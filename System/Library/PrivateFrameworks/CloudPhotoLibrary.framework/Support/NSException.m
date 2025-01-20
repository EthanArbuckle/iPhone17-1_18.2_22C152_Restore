@interface NSException
- (id)cplReason;
@end

@implementation NSException

- (id)cplReason
{
  v3 = [(NSException *)self reason];
  if (v3)
  {
    if (qword_1002CEA58 != -1) {
      dispatch_once(&qword_1002CEA58, &stru_10027A138);
    }
    objc_msgSend((id)qword_1002CEA60, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), @"<redacted>");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = [(NSException *)self name];
    v6 = (void *)v5;
    v7 = @"unknown exception";
    if (v5) {
      v7 = (__CFString *)v5;
    }
    v4 = v7;
  }
  return v4;
}

@end