@interface SSHBPresenceController
- (BOOL)statusCodeSet;
- (NSMutableArray)turtleData;
- (SSHBPresenceInputs)inputs;
- (Turtle)turtle;
- (void)setInputs:(id)a3;
- (void)setStatusCode:(int64_t)a3;
- (void)setStatusCodeSet:(BOOL)a3;
- (void)setTurtle:(id)a3;
- (void)setTurtleData:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)teardown;
- (void)turtleCallback:(id)a3;
- (void)turtleWasDisconnected;
@end

@implementation SSHBPresenceController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[SSHBPresenceController setInputs:](self, "setInputs:", a3, a4);
  [(SSHBPresenceController *)self setStatusCodeSet:0];
  v5 = +[NSMutableArray array];
  [(SSHBPresenceController *)self setTurtleData:v5];

  v6 = objc_alloc_init(Turtle);
  [(SSHBPresenceController *)self setTurtle:v6];

  v7 = [(SSHBPresenceController *)self turtle];
  [v7 setDelegate:self];

  CFRunLoopRunInMode(kCFRunLoopDefaultMode, 2.0, 1u);
  v8 = [(SSHBPresenceController *)self inputs];
  unsigned int v9 = [v8 frequentSampling];

  if (v9)
  {
    v10 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Enabling frequent sampling...", buf, 2u);
    }

    v11 = [(SSHBPresenceController *)self turtle];
    id v23 = 0;
    unsigned __int8 v12 = [v11 configureFrequentBackgroundScan:1 error:&v23];
    id v13 = v23;

    if ((v12 & 1) == 0)
    {
      v14 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100006EC0();
      }

      [(SSHBPresenceController *)self setStatusCode:1];
    }
  }
  else
  {
    id v13 = 0;
  }
  v15 = [(SSHBPresenceController *)self inputs];
  unsigned int v16 = [v15 disableGapSubtraction];

  if (v16)
  {
    v17 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Disabling gap subtraction...", buf, 2u);
    }

    v18 = [(SSHBPresenceController *)self turtle];
    id v22 = v13;
    unsigned __int8 v19 = [v18 gapSubtraction:0 error:&v22];
    id v20 = v22;

    if ((v19 & 1) == 0)
    {
      v21 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100006E58();
      }

      [(SSHBPresenceController *)self setStatusCode:2];
    }
  }
  else
  {
    id v20 = v13;
  }
  if ([(SSHBPresenceController *)self statusCodeSet]) {
    [(SSHBPresenceController *)self setFinished:1];
  }
}

- (void)start
{
  v3 = [(SSHBPresenceController *)self turtle];
  v4 = [(SSHBPresenceController *)self inputs];
  [v4 sampleDuration];
  [v3 waitForDuration:];

  if (![(SSHBPresenceController *)self statusCodeSet])
  {
    v5 = [(SSHBPresenceController *)self inputs];
    unsigned int v6 = [v5 frequentSampling];
    v7 = [(SSHBPresenceController *)self inputs];
    [v7 sampleDuration];
    double v9 = v8;

    double v10 = 50.0;
    if (!v6) {
      double v10 = 2.0;
    }
    int v11 = llround(v9 * v10);

    unsigned __int8 v12 = [(SSHBPresenceController *)self inputs];
    [v12 acceptedDeviation];
    signed int v14 = vcvtms_s32_f32((float)v11 - (float)((float)v11 * v13));

    v15 = [(SSHBPresenceController *)self turtleData];
    id v16 = [v15 count];

    v17 = DiagnosticLogHandleForCategory();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if ((unint64_t)v16 >= v14)
    {
      if (v18)
      {
        v21 = [(SSHBPresenceController *)self turtleData];
        int v28 = 134217984;
        id v29 = [v21 count];
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "SSHB found. (%lu)", (uint8_t *)&v28, 0xCu);
      }
      uint64_t v20 = 0;
    }
    else
    {
      if (v18)
      {
        unsigned __int8 v19 = [(SSHBPresenceController *)self turtleData];
        int v28 = 134217984;
        id v29 = [v19 count];
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "SSHB NOT found, or insufficient number of samples. (%lu)", (uint8_t *)&v28, 0xCu);
      }
      uint64_t v20 = 900;
    }

    [(SSHBPresenceController *)self setStatusCode:v20];
  }
  id v22 = [(SSHBPresenceController *)self turtle];
  id v23 = [v22 criticalErrors:0];
  v24 = +[NSMutableDictionary dictionaryWithObject:v23 forKey:@"criticalErrors"];

  v25 = [(SSHBPresenceController *)self inputs];
  LODWORD(v23) = [v25 sendRawData];

  if (v23)
  {
    v26 = [(SSHBPresenceController *)self turtleData];
    [v24 setObject:v26 forKeyedSubscript:@"rawData"];
  }
  v27 = [(SSHBPresenceController *)self result];
  [v27 setData:v24];

  [(SSHBPresenceController *)self setFinished:1];
}

- (void)teardown
{
  v3 = [(SSHBPresenceController *)self turtle];

  if (v3)
  {
    v4 = [(SSHBPresenceController *)self inputs];
    unsigned int v5 = [v4 frequentSampling];

    if (v5)
    {
      unsigned int v6 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Re-disabling frequent sampling...", buf, 2u);
      }

      v7 = [(SSHBPresenceController *)self turtle];
      id v19 = 0;
      unsigned __int8 v8 = [v7 configureFrequentBackgroundScan:0 error:&v19];
      id v9 = v19;

      if ((v8 & 1) == 0)
      {
        double v10 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_100006F90();
        }
      }
    }
    else
    {
      id v9 = 0;
    }
    int v11 = [(SSHBPresenceController *)self inputs];
    unsigned int v12 = [v11 disableGapSubtraction];

    if (v12)
    {
      float v13 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Re-enabling gap subtraction...", buf, 2u);
      }

      signed int v14 = [(SSHBPresenceController *)self turtle];
      id v18 = v9;
      unsigned __int8 v15 = [v14 gapSubtraction:1 error:&v18];
      id v16 = v18;

      if ((v15 & 1) == 0)
      {
        v17 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100006F28();
        }
      }
    }
    else
    {
      id v16 = v9;
    }
    [(SSHBPresenceController *)self setTurtle:0];
  }
}

- (void)setStatusCode:(int64_t)a3
{
  if (![(SSHBPresenceController *)self statusCodeSet])
  {
    [(SSHBPresenceController *)self setStatusCodeSet:1];
    id v6 = +[NSNumber numberWithInteger:a3];
    unsigned int v5 = [(SSHBPresenceController *)self result];
    [v5 setStatusCode:v6];
  }
}

- (void)turtleWasDisconnected
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100006FF8(v3);
  }

  [(SSHBPresenceController *)self setStatusCode:3];
}

- (void)turtleCallback:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(SSHBPresenceController *)self isCancelled];
  if (v4 && (v5 & 1) == 0)
  {
    [v4 capValue];
    [v4 gapValue];
    [v4 forceValue];
    id v6 = [(SSHBPresenceController *)self turtleData];
    v7 = [v4 descriptionDictionary];
    [v6 addObject:v7];

    unsigned __int8 v8 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10000703C(v4, v8);
    }
  }
}

- (Turtle)turtle
{
  return self->_turtle;
}

- (void)setTurtle:(id)a3
{
}

- (NSMutableArray)turtleData
{
  return self->_turtleData;
}

- (void)setTurtleData:(id)a3
{
}

- (BOOL)statusCodeSet
{
  return self->_statusCodeSet;
}

- (void)setStatusCodeSet:(BOOL)a3
{
  self->_statusCodeSet = a3;
}

- (SSHBPresenceInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_turtleData, 0);

  objc_storeStrong((id *)&self->_turtle, 0);
}

@end