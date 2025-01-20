@interface CKIMGroupHeaderRecipient
- (NSString)displayString;
- (void)setDisplayString:(id)a3;
@end

@implementation CKIMGroupHeaderRecipient

- (void)setDisplayString:(id)a3
{
  p_displayString = &self->_displayString;
  id v5 = a3;
  if (!-[NSString isEqualToString:](*p_displayString, "isEqualToString:")) {
    objc_storeStrong((id *)p_displayString, a3);
  }
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void).cxx_destruct
{
}

@end