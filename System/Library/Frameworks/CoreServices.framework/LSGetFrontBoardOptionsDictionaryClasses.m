@interface LSGetFrontBoardOptionsDictionaryClasses
@end

@implementation LSGetFrontBoardOptionsDictionaryClasses

void ___LSGetFrontBoardOptionsDictionaryClasses_block_invoke()
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v0 = XNSGetPropertyListClasses();
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v2 = [v0 setByAddingObjectsFromArray:v1];
  v3 = (void *)_LSGetFrontBoardOptionsDictionaryClasses_result;
  _LSGetFrontBoardOptionsDictionaryClasses_result = v2;

  uint64_t v4 = getBSServiceConnectionEndpointClass[0]();
  if (v4)
  {
    uint64_t v5 = [(id)_LSGetFrontBoardOptionsDictionaryClasses_result setByAddingObject:v4];
    v6 = (void *)_LSGetFrontBoardOptionsDictionaryClasses_result;
    _LSGetFrontBoardOptionsDictionaryClasses_result = v5;
  }
  uint64_t v7 = getUISClickAttributionClass[0]();
  if (v7)
  {
    uint64_t v8 = [(id)_LSGetFrontBoardOptionsDictionaryClasses_result setByAddingObject:v7];
    v9 = (void *)_LSGetFrontBoardOptionsDictionaryClasses_result;
    _LSGetFrontBoardOptionsDictionaryClasses_result = v8;
  }
  Class UISPasteSharingTokenClass = getUISPasteSharingTokenClass();
  if (UISPasteSharingTokenClass)
  {
    uint64_t v11 = [(id)_LSGetFrontBoardOptionsDictionaryClasses_result setByAddingObject:UISPasteSharingTokenClass];
    v12 = (void *)_LSGetFrontBoardOptionsDictionaryClasses_result;
    _LSGetFrontBoardOptionsDictionaryClasses_result = v11;
  }
}

@end