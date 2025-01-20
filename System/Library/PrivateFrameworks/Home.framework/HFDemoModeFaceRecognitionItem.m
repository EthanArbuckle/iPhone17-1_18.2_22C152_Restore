@interface HFDemoModeFaceRecognitionItem
+ (id)dateFormatter;
- (HFDemoModeFaceRecognitionItem)init;
- (HFDemoModeFaceRecognitionItem)initWithRecentsData:(id)a3 home:(id)a4;
- (HFDemoModeFaceRecognitionRecentsData)demoRecentsEntry;
- (HMHome)home;
- (HMPerson)person;
- (HMPersonManager)personManager;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDemoRecentsEntry:(id)a3;
@end

@implementation HFDemoModeFaceRecognitionItem

+ (id)dateFormatter
{
  if (qword_26AB2E728 != -1) {
    dispatch_once(&qword_26AB2E728, &__block_literal_global_65);
  }
  v2 = (void *)_MergedGlobals_1;
  return v2;
}

uint64_t __46__HFDemoModeFaceRecognitionItem_dateFormatter__block_invoke()
{
  v0 = +[HFFormatterManager sharedInstance];
  uint64_t v1 = [v0 relativeDateFormatter];
  v2 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v1;

  v3 = (void *)_MergedGlobals_1;
  return [v3 setTimeStyle:0];
}

- (HFDemoModeFaceRecognitionItem)initWithRecentsData:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFDemoModeFaceRecognitionItem;
  v9 = [(HFDemoModeFaceRecognitionItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_demoRecentsEntry, a3);
    objc_storeStrong((id *)&v10->_home, a4);
  }

  return v10;
}

- (HFDemoModeFaceRecognitionItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithRecentsData_home_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFDemoModeFaceRecognitionItem.m", 50, @"%s is unavailable; use %@ instead",
    "-[HFDemoModeFaceRecognitionItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [HFDemoModeFaceRecognitionItem alloc];
  v5 = [(HFDemoModeFaceRecognitionItem *)self demoRecentsEntry];
  v6 = [(HFDemoModeFaceRecognitionItem *)self home];
  id v7 = [(HFDemoModeFaceRecognitionItem *)v4 initWithRecentsData:v5 home:v6];

  [(HFItem *)v7 copyLatestResultsFromItem:self];
  return v7;
}

- (HMPerson)person
{
  v2 = [(HFDemoModeFaceRecognitionItem *)self demoRecentsEntry];
  v3 = [v2 person];

  return (HMPerson *)v3;
}

- (HMPersonManager)personManager
{
  NSLog(&cfstr_DemoModeShould.isa, a2);
  v3 = [(HFDemoModeFaceRecognitionItem *)self home];
  v4 = [v3 personManager];

  return (HMPersonManager *)v4;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  v5 = [(HFDemoModeFaceRecognitionItem *)self demoRecentsEntry];
  v6 = [v5 faceCrop];

  id v7 = objc_alloc(MEMORY[0x263F1C6B0]);
  id v8 = [v6 dataRepresentation];
  v9 = (void *)[v7 initWithData:v8];

  if (v9)
  {
    [v4 setObject:v9 forKeyedSubscript:@"HFPersonResultFaceCropImageKey"];
    v10 = [v6 dateCreated];
    v11 = [MEMORY[0x263EFF910] distantFuture];

    if (v10 != v11)
    {
      objc_msgSend(v4, "na_safeSetObject:forKey:", v10, @"HFPersonResultFaceCropDateKey");
      objc_msgSend(v4, "na_safeSetObject:forKey:", v10, @"HFResultCameraSignificantEventDateKey");
      objc_super v12 = [(id)objc_opt_class() dateFormatter];
      v13 = [v12 stringFromDate:v10];
      [v4 setObject:v13 forKeyedSubscript:@"description"];
    }
    v14 = (void *)MEMORY[0x263EFFA08];
    v15 = [(HFDemoModeFaceRecognitionItem *)self demoRecentsEntry];
    v16 = [v15 faceCrop];
    v17 = [v16 UUID];
    v18 = objc_msgSend(v14, "na_setWithSafeObject:", v17);
    [v4 setObject:v18 forKeyedSubscript:@"HFPersonResultFaceCropIdentifiersKey"];
  }
  [v4 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"HFPersonResultIsHomeOriginatedKey"];
  v19 = [(HFDemoModeFaceRecognitionItem *)self demoRecentsEntry];
  v20 = [v19 person];

  if (v20)
  {
    v21 = [v20 name];
    objc_msgSend(v4, "na_safeSetObject:forKey:", v21, @"title");

    v22 = [v20 UUID];
    objc_msgSend(v4, "na_safeSetObject:forKey:", v22, @"personIdentifier");
  }
  v23 = (void *)MEMORY[0x263F58190];
  v24 = +[HFItemUpdateOutcome outcomeWithResults:v4];
  v25 = [v23 futureWithResult:v24];

  return v25;
}

- (HMHome)home
{
  return self->_home;
}

- (HFDemoModeFaceRecognitionRecentsData)demoRecentsEntry
{
  return self->_demoRecentsEntry;
}

- (void)setDemoRecentsEntry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demoRecentsEntry, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end