@interface IDSStewieClearInfo
+ (id)clearEverythingRequest;
- (IDSStewieClearInfo)initWithClearType:(int64_t)a3;
- (id)description;
- (int64_t)clearType;
- (unint64_t)type;
- (void)setClearType:(int64_t)a3;
- (void)unionWithClearInfo:(id)a3;
@end

@implementation IDSStewieClearInfo

- (IDSStewieClearInfo)initWithClearType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IDSStewieClearInfo;
  result = [(IDSStewieClearInfo *)&v5 init];
  if (result) {
    result->_clearType = a3;
  }
  return result;
}

- (unint64_t)type
{
  return 3;
}

+ (id)clearEverythingRequest
{
  id v2 = [objc_alloc((Class)a1) initWithClearType:0];

  return v2;
}

- (void)unionWithClearInfo:(id)a3
{
  if (![a3 clearType])
  {
    [(IDSStewieClearInfo *)self setClearType:0];
  }
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  int64_t v4 = [(IDSStewieClearInfo *)self clearType];
  self;
  CFStringRef v5 = @"Unknown";
  if (v4 == 1) {
    CFStringRef v5 = @"SessionKeys";
  }
  if (!v4) {
    CFStringRef v5 = @"All";
  }
  return +[NSString stringWithFormat:@"<%@: %p { type: %@ }>", v3, self, v5];
}

- (int64_t)clearType
{
  return self->_clearType;
}

- (void)setClearType:(int64_t)a3
{
  self->_clearType = a3;
}

@end