@interface EKParticipantForDisplay
- (BOOL)isOptionalParticipant;
- (NSMutableAttributedString)displayString;
- (void)setDisplayString:(id)a3;
- (void)setOptionalParticipant:(BOOL)a3;
@end

@implementation EKParticipantForDisplay

- (NSMutableAttributedString)displayString
{
  return self->_displayString;
}

- (void)setDisplayString:(id)a3
{
}

- (BOOL)isOptionalParticipant
{
  return self->_optionalParticipant;
}

- (void)setOptionalParticipant:(BOOL)a3
{
  self->_optionalParticipant = a3;
}

- (void).cxx_destruct
{
}

@end