@interface HKDisplayType(AddData)
- (id)wd_addDataViewControllerWithHealthStore:()AddData healthToolBox:initialStartDate:;
- (id)wd_addDataViewControllerWithHealthStore:()AddData unitController:initialStartDate:dateCache:;
@end

@implementation HKDisplayType(AddData)

- (id)wd_addDataViewControllerWithHealthStore:()AddData healthToolBox:initialStartDate:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v9 profile];
  v12 = [v11 unitController];
  v13 = [v9 profile];

  v14 = [v13 dateCache];
  v15 = objc_msgSend(a1, "wd_addDataViewControllerWithHealthStore:unitController:initialStartDate:dateCache:", v10, v12, v8, v14);

  return v15;
}

- (id)wd_addDataViewControllerWithHealthStore:()AddData unitController:initialStartDate:dateCache:
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "wd_addDataViewControllerClass")), "initWithDisplayType:healthStore:unitController:initialStartDate:dateCache:", a1, v13, v12, v11, v10);

  return v14;
}

@end