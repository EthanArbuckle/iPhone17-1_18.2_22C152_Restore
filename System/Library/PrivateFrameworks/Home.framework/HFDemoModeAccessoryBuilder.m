@interface HFDemoModeAccessoryBuilder
+ (Class)homeKitRepresentationClass;
- (BOOL)isFavorite;
- (BOOL)showInHomeDashboard;
- (BOOL)supportsFavoriting;
- (HFDemoModeAccessoryBuilder)initWithExistingObject:(id)a3 inHome:(id)a4;
- (HFNamingComponents)namingComponent;
- (HFRoomBuilder)room;
- (NSString)name;
- (NSString)originalName;
- (id)_lazilyUpdateName;
- (id)_lazilyUpdateRoom;
- (id)_lazilyUpdateValueForContextType:(unint64_t)a3;
- (id)_performValidation;
- (id)accessories;
- (id)commitItem;
- (id)removeItemFromHome;
- (void)setIsFavorite:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNamingComponent:(id)a3;
- (void)setRoom:(id)a3;
- (void)setShowInHomeDashboard:(BOOL)a3;
@end

@implementation HFDemoModeAccessoryBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFDemoModeAccessoryBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  id v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HFDemoModeAccessoryBuilder;
  v7 = [(HFItemBuilder *)&v19 initWithExistingObject:a3 inHome:v6];
  v8 = v7;
  if (v7)
  {
    v9 = [(HFItemBuilder *)v7 homeKitRepresentation];
    v10 = +[HFNamingComponents namingComponentFromAccessory:v9];
    [(HFDemoModeAccessoryBuilder *)v8 setNamingComponent:v10];

    v11 = [(HFDemoModeAccessoryBuilder *)v8 originalName];
    [(HFDemoModeAccessoryBuilder *)v8 setName:v11];

    v12 = [HFRoomBuilder alloc];
    v13 = [(HFDemoModeAccessoryBuilder *)v8 accessory];
    v14 = [v13 room];
    v15 = [(HFRoomBuilder *)v12 initWithExistingObject:v14 inHome:v6];
    [(HFDemoModeAccessoryBuilder *)v8 setRoom:v15];

    v16 = [(HFDemoModeAccessoryBuilder *)v8 accessory];
    -[HFDemoModeAccessoryBuilder setShowInHomeDashboard:](v8, "setShowInHomeDashboard:", objc_msgSend(v16, "hf_effectiveShowInHomeDashboard"));

    v17 = [(HFDemoModeAccessoryBuilder *)v8 accessory];
    -[HFDemoModeAccessoryBuilder setIsFavorite:](v8, "setIsFavorite:", objc_msgSend(v17, "hf_effectiveIsFavorite"));
  }
  return v8;
}

- (NSString)originalName
{
  v2 = [(HFDemoModeAccessoryBuilder *)self namingComponent];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (id)accessories
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(HFDemoModeAccessoryBuilder *)self accessory];
  v4 = [v2 setWithObject:v3];

  return v4;
}

- (BOOL)supportsFavoriting
{
  return 1;
}

- (id)removeItemFromHome
{
  return (id)[MEMORY[0x263F58190] futureWithNoResult];
}

- (id)_performValidation
{
  return [(HFItemBuilder *)self lazy_verifyPropertyIsSet:@"room"];
}

- (id)commitItem
{
  v22[2] = *MEMORY[0x263EF8340];
  v3 = [(HFItemBuilder *)self home];
  char v4 = objc_msgSend(v3, "hf_currentUserIsAdministrator");

  if (v4)
  {
    v5 = [(HFDemoModeAccessoryBuilder *)self _lazilyUpdateValueForContextType:2];
    v22[0] = v5;
    id v6 = [(HFDemoModeAccessoryBuilder *)self _lazilyUpdateValueForContextType:3];
    v22[1] = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];

    v8 = [MEMORY[0x263F58190] combineAllFutures:v7];
    v9 = @"HFOperationEditService";
    v10 = (void *)MEMORY[0x263F58190];
    v11 = [(HFDemoModeAccessoryBuilder *)self _performValidation];
    v21[0] = v11;
    v12 = [(HFDemoModeAccessoryBuilder *)self _lazilyUpdateName];
    v21[1] = v12;
    v13 = [(HFDemoModeAccessoryBuilder *)self _lazilyUpdateRoom];
    v21[2] = v13;
    v21[3] = v8;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];
    v15 = [v10 chainFutures:v14];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __40__HFDemoModeAccessoryBuilder_commitItem__block_invoke;
    v18[3] = &unk_26408CE18;
    objc_super v19 = v9;
    v20 = self;
    v16 = [v15 recover:v18];
  }
  else
  {
    v16 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  return v16;
}

id __40__HFDemoModeAccessoryBuilder_commitItem__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F58190];
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 name];
  v7 = objc_msgSend(v5, "hf_errorWithOperationType:failedItemName:", v3, v6);

  v8 = [v2 futureWithError:v7];

  return v8;
}

- (id)_lazilyUpdateName
{
  uint64_t v3 = [(HFDemoModeAccessoryBuilder *)self name];
  char v4 = [(HFDemoModeAccessoryBuilder *)self originalName];
  id v5 = v3;
  id v6 = v4;
  if (v5 == v6)
  {

    v9 = v5;
LABEL_8:

    goto LABEL_9;
  }
  v7 = v6;
  if (!v5)
  {

    goto LABEL_7;
  }
  char v8 = [v5 isEqual:v6];

  if ((v8 & 1) == 0)
  {
LABEL_7:
    v10 = [(HFDemoModeAccessoryBuilder *)self name];
    v11 = [(HFDemoModeAccessoryBuilder *)self accessory];
    v12 = [v11 applicationData];
    [v12 setObject:v10 forKeyedSubscript:@"name"];

    v9 = +[HFDemoModeAccessoryManager sharedManager];
    id v5 = [(HFDemoModeAccessoryBuilder *)self accessory];
    [v9 dispatchUpdateMessageForAccessory:v5];
    goto LABEL_8;
  }
LABEL_9:
  v13 = [MEMORY[0x263F58190] futureWithNoResult];
  return v13;
}

- (id)_lazilyUpdateRoom
{
  uint64_t v3 = [(HFDemoModeAccessoryBuilder *)self accessory];
  char v4 = [v3 room];
  id v5 = [v4 uniqueIdentifier];
  id v6 = [(HFDemoModeAccessoryBuilder *)self room];
  v7 = [v6 room];
  char v8 = [v7 uniqueIdentifier];
  char v9 = [v5 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    v10 = [(HFDemoModeAccessoryBuilder *)self room];
    v11 = [v10 room];
    v12 = [v11 name];
    v13 = [(HFDemoModeAccessoryBuilder *)self accessory];
    v14 = [v13 applicationData];
    [v14 setObject:v12 forKeyedSubscript:@"room"];

    v15 = +[HFDemoModeAccessoryManager sharedManager];
    v16 = [(HFDemoModeAccessoryBuilder *)self accessory];
    [v15 dispatchUpdateMessageForAccessory:v16];
  }
  v17 = [MEMORY[0x263F58190] futureWithNoResult];

  return v17;
}

- (id)_lazilyUpdateValueForContextType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      BOOL v5 = [(HFDemoModeAccessoryBuilder *)self isFavorite];
      goto LABEL_6;
    case 1uLL:
      NSLog(&cfstr_IncludeInStatu_2.isa, a2);
      goto LABEL_11;
    case 3uLL:
      BOOL v5 = [(HFDemoModeAccessoryBuilder *)self showInHomeDashboard];
LABEL_6:
      BOOL v6 = v5;
      goto LABEL_7;
    default:
      BOOL v6 = 0;
LABEL_7:
      v7 = [(HFDemoModeAccessoryBuilder *)self accessory];
      if (v6 == objc_msgSend(v7, "hf_isOnForContextType:", a3))
      {
        char v8 = [(HFDemoModeAccessoryBuilder *)self accessory];
        char v9 = objc_msgSend(v8, "hf_hasSetForContextType:", a3);

        if (v9) {
          goto LABEL_11;
        }
      }
      else
      {
      }
      v10 = [(HFDemoModeAccessoryBuilder *)self accessory];
      id v11 = (id)objc_msgSend(v10, "hf_updateValue:forContextType:", v6, a3);

      v12 = +[HFDemoModeAccessoryManager sharedManager];
      v13 = [(HFDemoModeAccessoryBuilder *)self accessory];
      [v12 dispatchUpdateMessageForAccessory:v13];

LABEL_11:
      v14 = [MEMORY[0x263F58190] futureWithNoResult];
      return v14;
  }
}

- (NSString)name
{
  return self->name;
}

- (void)setName:(id)a3
{
}

- (HFRoomBuilder)room
{
  return self->room;
}

- (void)setRoom:(id)a3
{
}

- (BOOL)isFavorite
{
  return self->isFavorite;
}

- (void)setIsFavorite:(BOOL)a3
{
  self->isFavorite = a3;
}

- (BOOL)showInHomeDashboard
{
  return self->showInHomeDashboard;
}

- (void)setShowInHomeDashboard:(BOOL)a3
{
  self->showInHomeDashboard = a3;
}

- (HFNamingComponents)namingComponent
{
  return self->_namingComponent;
}

- (void)setNamingComponent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namingComponent, 0);
  objc_storeStrong((id *)&self->room, 0);
  objc_storeStrong((id *)&self->name, 0);
}

@end