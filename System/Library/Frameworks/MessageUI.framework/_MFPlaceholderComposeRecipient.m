@interface _MFPlaceholderComposeRecipient
- (id)displayString;
- (void)setDisplayString:(id)a3;
@end

@implementation _MFPlaceholderComposeRecipient

- (void)setDisplayString:(id)a3
{
  p_displayString = &self->super._displayString;
  id v5 = a3;
  if (([v5 isEqualToString:*p_displayString] & 1) == 0) {
    objc_storeStrong((id *)p_displayString, a3);
  }
}

- (id)displayString
{
  return self->super._displayString;
}

@end