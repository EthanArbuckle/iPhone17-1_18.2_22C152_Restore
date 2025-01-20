@interface TailspinDiagnosticExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation TailspinDiagnosticExtension

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  id v3 = a3;
  if (!tailspin_config_create_with_current_state() || (int v4 = tailspin_enabled_get(), tailspin_config_free(), !v4))
  {
    id v8 = &__NSArray0__struct;
    goto LABEL_21;
  }
  v5 = [v3 objectForKeyedSubscript:UnsafePointer];
  v6 = v5;
  if (v5) {
    unsigned int v7 = [v5 BOOLValue];
  }
  else {
    unsigned int v7 = 0;
  }
  v9 = [v3 objectForKeyedSubscript:UnsafePointer];
  v10 = v9;
  if (!v9)
  {
    id v14 = objc_alloc_init((Class)NSDateFormatter);
    [v14 setDateStyle:1];
    [v14 setDateFormat:@"yyyy-MM-dd-HHmmss"];
    v15 = +[NSDate date];
    v16 = [v14 stringFromDate:v15];
    v17 = +[NSString stringWithFormat:@"tailspin-trace_%@.tailspin", v16];

    id v11 = [@"/var/mobile/Library/Logs/CrashReporter" stringByAppendingPathComponent:v17];

    if (v7) {
      goto LABEL_9;
    }
LABEL_12:
    mode_t v18 = umask(0);
    id v19 = v11;
    int v20 = open((const char *)[v19 UTF8String], 2562, 432);
    umask(v18);
    if (v20 == -1)
    {
      id v8 = &__NSArray0__struct;
    }
    else
    {
      id v21 = v3;
      NSLog(@"Saving tailspin file with options = %@", v21);
      if (tailspin_dump_output_with_options_sync())
      {
        NSLog(@"Saved tailspin output to file '%@'", v19);
        v22 = +[DEAttachmentItem attachmentWithPath:v19];
        [v22 setDeleteOnAttach:&__kCFBooleanTrue];
        v26 = v22;
        v23 = +[NSArray arrayWithObjects:&v26 count:1];
      }
      else
      {
        NSLog(@"Unable to save tailspin data to file '%@'", v19);
        v23 = &__NSArray0__struct;
      }
      close(v20);
      id v8 = v23;
    }
    goto LABEL_20;
  }
  id v11 = v9;
  if (!v7) {
    goto LABEL_12;
  }
LABEL_9:
  id v12 = v11;
  if (access((const char *)[v12 UTF8String], 0))
  {
    v13 = &__NSArray0__struct;
  }
  else
  {
    v24 = +[DEAttachmentItem attachmentWithPath:v12];
    [v24 setDeleteOnAttach:&__kCFBooleanTrue];
    v27 = v24;
    v13 = +[NSArray arrayWithObjects:&v27 count:1];
  }
  NSLog(@"Returned existing tailspin file '%@'", v12);
  id v8 = v13;
LABEL_20:

LABEL_21:
  return v8;
}

@end