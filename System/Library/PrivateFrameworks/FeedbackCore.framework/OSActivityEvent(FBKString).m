@interface OSActivityEvent(FBKString)
- (id)fba_toString;
@end

@implementation OSActivityEvent(FBKString)

- (id)fba_toString
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [a1 subsystem];
    if (v2)
    {
      v3 = NSString;
      v4 = [a1 subsystem];
      v5 = [v3 stringWithFormat:@"[%@]", v4];
    }
    else
    {
      v5 = &stru_26DDF6A30;
    }

    v12 = NSString;
    v7 = [a1 timestamp];
    v8 = objc_msgSend(v7, "fba_toString");
    v10 = [a1 process];
    uint64_t v13 = [a1 processID];
    v14 = [a1 eventMessage];
    v11 = [v12 stringWithFormat:@"%@ %@[%d]:%@ %@", v8, v10, v13, v5, v14];
  }
  else
  {
    v6 = NSString;
    v5 = [a1 timestamp];
    v7 = [(__CFString *)v5 fba_toString];
    v8 = [a1 process];
    uint64_t v9 = [a1 processID];
    v10 = [a1 eventMessage];
    v11 = [v6 stringWithFormat:@"%@ %@[%d]: %@", v7, v8, v9, v10];
  }

  return v11;
}

@end