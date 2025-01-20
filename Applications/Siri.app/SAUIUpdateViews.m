@interface SAUIUpdateViews
- (id)sr_sirilandShim;
@end

@implementation SAUIUpdateViews

- (id)sr_sirilandShim
{
  v3 = [(SAUIUpdateViews *)self views];
  v4 = sub_100060A80(v3);
  if (v3 == v4)
  {
    v5 = self;
  }
  else
  {
    v5 = (SAUIUpdateViews *)[(SAUIUpdateViews *)self copy];
    [(SAUIUpdateViews *)v5 setViews:v4];
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      v9 = "-[SAUIUpdateViews(Siriland) sr_sirilandShim]";
      __int16 v10 = 2112;
      v11 = self;
      __int16 v12 = 2112;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Successfully shimmed UpdateViews for the Siriland presentation:\n    UpdateViews: %@\n    Shimmed UpdateViews: %@", (uint8_t *)&v8, 0x20u);
    }
  }

  return v5;
}

@end