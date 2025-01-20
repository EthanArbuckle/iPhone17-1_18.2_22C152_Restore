@interface NSError
- (NSString)mf_markupString;
@end

@implementation NSError

- (NSString)mf_markupString
{
  v3 = sub_1000B3D38(self);
  if (!v3)
  {
    v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = [(NSError *)self ef_publicDescription];
      sub_1000C2CF8(v5, buf, v4);
    }

    v6 = +[NSBundle mainBundle];
    v3 = [v6 localizedStringForKey:@"MESSAGE_CAUSED_PROBLEM" value:&stru_10013ED08 table:@"Main"];
  }
  v7 = objc_msgSend(v3, "mf_stringByEscapingHTMLCodes");
  v8 = +[NSString localizedStringWithFormat:@"<html dir=auto><body><i><font color=#888>%@</font></i></body></html>", v7];

  return (NSString *)v8;
}

@end