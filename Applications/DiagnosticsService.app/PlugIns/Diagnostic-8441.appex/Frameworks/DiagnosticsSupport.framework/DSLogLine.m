@interface DSLogLine
+ (id)logLinesFromArray:(id)a3;
- (BOOL)BOOLFromFieldAtIndex:(int)a3;
- (BOOL)isUsable;
- (DSLogLine)initWithLine:(id)a3;
- (DSLogLine)initWithLogLine:(id)a3;
- (NSArray)fields;
- (NSDate)date;
- (NSString)bundleID;
- (NSString)exception;
- (NSString)type;
- (double)doubleFromFieldAtIndex:(int)a3;
- (id)blankingStringFromFieldAtIndex:(int)a3;
- (id)stringFromFieldAtIndex:(int)a3;
- (int)integerFromFieldAtIndex:(int)a3;
- (int64_t)longLongFromFieldAtIndex:(int)a3;
- (void)setType:(id)a3;
@end

@implementation DSLogLine

- (DSLogLine)initWithLine:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)DSLogLine;
  v5 = [(DSLogLine *)&v27 init];
  if (!v5)
  {
LABEL_26:
    v23 = v5;
    goto LABEL_27;
  }
  if ((unint64_t)[v4 length] >= 2)
  {
    uint64_t v6 = [v4 componentsSeparatedByString:@","];
    fields = v5->_fields;
    v5->_fields = (NSArray *)v6;

    if ([(NSArray *)v5->_fields count] <= 1)
    {
      v8 = DiagnosticLogHandleForCategory(3);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[DSLogLine initWithLine:]((id *)&v5->_fields, v8);
      }

      goto LABEL_20;
    }
    v9 = +[DSDateFormatter sharedFormatter];
    v10 = [v9 formatterWithType:2];
    v11 = [(NSArray *)v5->_fields objectAtIndex:0];
    uint64_t v12 = [v10 dateFromString:v11];
    date = v5->_date;
    v5->_date = (NSDate *)v12;

    v14 = v5->_date;
    if (v14)
    {
      v15 = +[NSDate date];
      [(NSDate *)v14 timeIntervalSinceDate:v15];
      double v17 = v16;

      if (v17 > 86400.0 || v17 <= -1209600.0)
      {
        v22 = DiagnosticLogHandleForCategory(3);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[DSLogLine initWithLine:](v22, v17);
        }
      }
      else
      {
        uint64_t v18 = [(NSArray *)v5->_fields objectAtIndex:1];
        type = v5->_type;
        v5->_type = (NSString *)v18;

        if ([(NSString *)v5->_type length])
        {
          v5->_isUsable = 1;
          if ([(NSArray *)v5->_fields count] <= 6)
          {
            exception = v5->_exception;
            v5->_exception = 0;
          }
          else
          {
            uint64_t v20 = [(NSArray *)v5->_fields objectAtIndexedSubscript:6];
            exception = v5->_exception;
            v5->_exception = (NSString *)v20;
          }

          if ([(NSArray *)v5->_fields count] <= 5)
          {
            bundleID = v5->_bundleID;
            v5->_bundleID = 0;
          }
          else
          {
            uint64_t v24 = [(NSArray *)v5->_fields objectAtIndexedSubscript:5];
            bundleID = v5->_bundleID;
            v5->_bundleID = (NSString *)v24;
          }

          goto LABEL_26;
        }
        v22 = DiagnosticLogHandleForCategory(3);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[DSLogLine initWithLine:].cold.4(v22);
        }
      }
    }
    else
    {
      v22 = DiagnosticLogHandleForCategory(3);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[DSLogLine initWithLine:](v22);
      }
    }
  }
LABEL_20:
  v23 = 0;
LABEL_27:

  return v23;
}

- (DSLogLine)initWithLogLine:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DSLogLine;
  v5 = [(DSLogLine *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 type];
    type = v5->_type;
    v5->_type = (NSString *)v6;

    uint64_t v8 = [v4 date];
    date = v5->_date;
    v5->_date = (NSDate *)v8;

    v5->_isUsable = [v4 isUsable];
    uint64_t v10 = [v4 exception];
    exception = v5->_exception;
    v5->_exception = (NSString *)v10;

    uint64_t v12 = [v4 fields];
    fields = v5->_fields;
    v5->_fields = (NSArray *)v12;
  }
  return v5;
}

+ (id)logLinesFromArray:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = [DSLogLine alloc];
        uint64_t v12 = -[DSLogLine initWithLine:](v11, "initWithLine:", v10, (void)v14);
        if (v12) {
          [v4 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (int)integerFromFieldAtIndex:(int)a3
{
  id v5 = [(DSLogLine *)self fields];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3) {
    return 0;
  }
  id v7 = [(DSLogLine *)self fields];
  uint64_t v8 = [v7 objectAtIndexedSubscript:a3];
  int v9 = [v8 intValue];

  return v9;
}

- (int64_t)longLongFromFieldAtIndex:(int)a3
{
  id v5 = [(DSLogLine *)self fields];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3) {
    return 0;
  }
  id v7 = [(DSLogLine *)self fields];
  uint64_t v8 = [v7 objectAtIndexedSubscript:a3];
  id v9 = [v8 longLongValue];

  return (int64_t)v9;
}

- (double)doubleFromFieldAtIndex:(int)a3
{
  id v5 = [(DSLogLine *)self fields];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3) {
    return 0.0;
  }
  id v7 = [(DSLogLine *)self fields];
  uint64_t v8 = [v7 objectAtIndexedSubscript:a3];
  [v8 doubleValue];
  double v10 = v9;

  return v10;
}

- (BOOL)BOOLFromFieldAtIndex:(int)a3
{
  id v5 = [(DSLogLine *)self fields];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3) {
    return 0;
  }
  id v7 = [(DSLogLine *)self fields];
  uint64_t v8 = [v7 objectAtIndexedSubscript:a3];
  unsigned __int8 v9 = [v8 BOOLValue];

  return v9;
}

- (id)blankingStringFromFieldAtIndex:(int)a3
{
  id v5 = [(DSLogLine *)self fields];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    uint64_t v8 = &stru_1C970;
  }
  else
  {
    id v7 = [(DSLogLine *)self fields];
    uint64_t v8 = [v7 objectAtIndexedSubscript:a3];
  }

  return v8;
}

- (id)stringFromFieldAtIndex:(int)a3
{
  id v5 = [(DSLogLine *)self fields];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    uint64_t v8 = 0;
  }
  else
  {
    id v7 = [(DSLogLine *)self fields];
    uint64_t v8 = [v7 objectAtIndexedSubscript:a3];
  }

  return v8;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)isUsable
{
  return self->_isUsable;
}

- (NSString)exception
{
  return self->_exception;
}

- (NSArray)fields
{
  return self->_fields;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_exception, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

- (void)initWithLine:(id *)a1 .cold.1(id *a1, NSObject *a2)
{
  id v3 = [*a1 count];
  int v4 = 134217984;
  id v5 = v3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "[DSLogLine] ignoring log line, field count too small: %ld", (uint8_t *)&v4, 0xCu);
}

- (void)initWithLine:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "[DSLogLine] ignoring log line, log date unparseable", v1, 2u);
}

- (void)initWithLine:(os_log_t)log .cold.3(os_log_t log, double a2)
{
  int v2 = 134217984;
  uint64_t v3 = (uint64_t)a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "[DSLogLine] ignoring log line, log date out of range: %ld", (uint8_t *)&v2, 0xCu);
}

- (void)initWithLine:(os_log_t)log .cold.4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "[DSLogLine] ignoring log line, type is blank", v1, 2u);
}

@end