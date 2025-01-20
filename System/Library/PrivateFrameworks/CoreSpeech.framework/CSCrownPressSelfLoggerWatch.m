@interface CSCrownPressSelfLoggerWatch
- (BOOL)listeningEnabled;
- (CSCrownPressSelfLoggerWatch)init;
- (OS_dispatch_queue)queue;
- (unint64_t)displayWakeHostTime;
- (void)CSSiriAssertionMonitor:(id)a3 didReceiveBacklightOnEnabled:(BOOL)a4 atHostTime:(unint64_t)a5;
- (void)_emitCrownPressedEventwithMHUUID:(id)a3 didUseAOM:(BOOL)a4;
- (void)_handleDidStartStreamWithContext:(id)a3 withOption:(id)a4 successfully:(BOOL)a5;
- (void)dealloc;
- (void)setDisplayWakeHostTime:(unint64_t)a3;
- (void)setListeningEnabled:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setup;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
@end

@implementation CSCrownPressSelfLoggerWatch

- (void).cxx_destruct
{
}

- (void)setListeningEnabled:(BOOL)a3
{
  self->_listeningEnabled = a3;
}

- (BOOL)listeningEnabled
{
  return self->_listeningEnabled;
}

- (void)setDisplayWakeHostTime:(unint64_t)a3
{
  self->_displayWakeHostTime = a3;
}

- (unint64_t)displayWakeHostTime
{
  return self->_displayWakeHostTime;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)CSSiriAssertionMonitor:(id)a3 didReceiveBacklightOnEnabled:(BOOL)a4 atHostTime:(unint64_t)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E087C;
  block[3] = &unk_100252F08;
  BOOL v7 = a4;
  block[4] = self;
  block[5] = a5;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  id v10 = a4;
  id v11 = a6;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000E0974;
  v15[3] = &unk_100252588;
  v15[4] = self;
  id v16 = v10;
  id v17 = v11;
  BOOL v18 = a5;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (void)_handleDidStartStreamWithContext:(id)a3 withOption:(id)a4 successfully:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  if (v5)
  {
    id v16 = v8;
    unsigned int v9 = [a3 isHomePressed];
    id v8 = v16;
    if (v9)
    {
      if (self->_listeningEnabled
        && (unint64_t v10 = [(CSCrownPressSelfLoggerWatch *)self displayWakeHostTime],
            id v11 = [v16 startRecordingHostTime],
            id v8 = v16,
            v10 <= (unint64_t)v11))
      {
        v12 = [v16 requestMHUUID];
        id v13 = self;
        id v14 = v12;
        uint64_t v15 = 0;
      }
      else
      {
        v12 = [v8 requestMHUUID];
        id v13 = self;
        id v14 = v12;
        uint64_t v15 = 1;
      }
      [(CSCrownPressSelfLoggerWatch *)v13 _emitCrownPressedEventwithMHUUID:v14 didUseAOM:v15];

      id v8 = v16;
    }
  }
}

- (void)_emitCrownPressedEventwithMHUUID:(id)a3 didUseAOM:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (!v5)
  {
    v6 = +[NSUUID UUID];
    id v5 = [v6 UUIDString];

    BOOL v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      id v16 = "-[CSCrownPressSelfLoggerWatch _emitCrownPressedEventwithMHUUID:didUseAOM:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Mint a new MHUUID for crown press events", (uint8_t *)&v15, 0xCu);
    }
  }
  id v8 = objc_alloc_init((Class)MHSchemaMHCrownPressed);
  [v8 setIsAlwaysOnMicAudioUsed:v4];
  id v9 = objc_alloc_init((Class)MHSchemaMHClientEvent);
  id v10 = objc_alloc_init((Class)MHSchemaMHClientEventMetadata);
  id v11 = objc_alloc((Class)SISchemaUUID);
  id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:v5];
  id v13 = [v11 initWithNSUUID:v12];
  [v10 setMhId:v13];

  [v9 setEventMetadata:v10];
  [v9 setCrownPressed:v8];
  id v14 = +[AssistantSiriAnalytics sharedStream];
  [v14 emitMessage:v9];
}

- (void)setup
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E0C88;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  v3 = +[CSSiriClientBehaviorMonitor sharedInstance];
  [v3 unregisterObserver:self];

  BOOL v4 = +[CSSiriAssertionMonitor sharedInstance];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)CSCrownPressSelfLoggerWatch;
  [(CSCrownPressSelfLoggerWatch *)&v5 dealloc];
}

- (CSCrownPressSelfLoggerWatch)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSCrownPressSelfLoggerWatch;
  v2 = [(CSCrownPressSelfLoggerWatch *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -2);
    dispatch_queue_t v4 = dispatch_queue_create("CSCrownPressSelfLoggerWatch queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v2->_listeningEnabled = 0;
  }
  return v2;
}

@end