@interface DMTEmbeddedDataResetBackedErasePrimitives
- (void)performEraseWithCompletion:(id)a3;
@end

@implementation DMTEmbeddedDataResetBackedErasePrimitives

- (void)performEraseWithCompletion:(id)a3
{
  id v3 = a3;
  id v8 = (id)objc_opt_new();
  v4 = DMTBundle();
  v5 = [v4 localizedStringForKey:@"Preparing Device…" value:&stru_26E10D868 table:0];

  v6 = (void *)[objc_alloc(MEMORY[0x263F3B440]) initWithMode:4 options:v8 reason:v5];
  v7 = [MEMORY[0x263F3B448] sharedInstance];
  [v7 resetWithRequest:v6 completion:v3];
}

@end