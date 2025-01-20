@interface _CNUIDefaultUserActionRecorderEventFactory
- (id)recentEventForAddress:(id)a3 kind:(id)a4 metadata:(id)a5;
@end

@implementation _CNUIDefaultUserActionRecorderEventFactory

- (id)recentEventForAddress:(id)a3 kind:(id)a4 metadata:(id)a5
{
  v7 = (void *)MEMORY[0x263F37DB0];
  v8 = (void *)MEMORY[0x263EFF910];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 date];
  v13 = [v7 recentEventForAddress:v11 displayName:0 kind:v10 date:v12 weight:0 metadata:v9 options:0];

  return v13;
}

@end