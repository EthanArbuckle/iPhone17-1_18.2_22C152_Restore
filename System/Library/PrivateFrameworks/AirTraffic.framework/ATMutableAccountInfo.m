@interface ATMutableAccountInfo
- (void)setAltDSID:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setDSID:(id)a3;
@end

@implementation ATMutableAccountInfo

- (void)setAppleID:(id)a3
{
  if (self->super._appleID != a3)
  {
    self->super._appleID = (NSString *)[a3 copy];
    MEMORY[0x270F9A758]();
  }
}

- (void)setAltDSID:(id)a3
{
  if (self->super._altDSID != a3)
  {
    self->super._altDSID = (NSString *)[a3 copy];
    MEMORY[0x270F9A758]();
  }
}

- (void)setDSID:(id)a3
{
  if (self->super._DSID != a3)
  {
    self->super._DSID = (NSNumber *)[a3 copy];
    MEMORY[0x270F9A758]();
  }
}

@end