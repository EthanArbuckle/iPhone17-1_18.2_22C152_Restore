@interface FPPublicLog
- (FPPublicLog)initWithString:(id)a3;
- (id)description;
- (id)redactedDescription;
@end

@implementation FPPublicLog

- (FPPublicLog)initWithString:(id)a3
{
  return self;
}

- (id)description
{
  return self->_string;
}

- (id)redactedDescription
{
  return self->_string;
}

- (void).cxx_destruct
{
}

@end