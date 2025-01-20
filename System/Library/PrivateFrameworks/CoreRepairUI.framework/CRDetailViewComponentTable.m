@interface CRDetailViewComponentTable
- (id)specifiers;
@end

@implementation CRDetailViewComponentTable

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    [(CRDetailViewComponentTable *)self setTitle:0];
    v5 = objc_opt_new();
    v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26ECCB650 target:self set:0 get:0 detail:0 cell:4 edit:0];
    [v6 setIdentifier:@"ABOUT_PARTS_AND_SERVICE_HISTORY"];
    [v6 setObject:NSClassFromString(&cfstr_CorerepairuiPa.isa) forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    v7 = objc_opt_new();
    v8 = [v7 getCurrentDetailsWithPrivacySpecifier:1];

    if ([v8 count])
    {
      [v5 addObject:v6];
      [v5 addObjectsFromArray:v8];
    }
    v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

@end