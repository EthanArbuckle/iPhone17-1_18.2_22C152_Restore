@interface _XREngineeringTypeArrayEncodingParser
+ (id)_elementNameToClassMap;
- (void)_handleCompletion;
- (void)_handleStart;
- (void)setRemainder:(id)a3;
- (void)setSlot:(id)a3;
@end

@implementation _XREngineeringTypeArrayEncodingParser

+ (id)_elementNameToClassMap
{
  if (qword_2687AA208 != -1) {
    dispatch_once(&qword_2687AA208, &unk_26E7527F0);
  }
  v2 = (void *)qword_2687AA200;

  return v2;
}

- (void)_handleStart
{
  self->_fixedTypes = (NSMutableArray *)objc_opt_new();

  MEMORY[0x270F9A758]();
}

- (void)setSlot:(id)a3
{
  fixedTypes = self->_fixedTypes;
  id v9 = [a3 copyWithZone:v3];
  [fixedTypes addObject:v6 withKey:(uint64_t)v9 value:v7 value:v8];
}

- (void)setRemainder:(id)a3
{
  self->_remainderType = [a3 copyWithZone:a2];

  MEMORY[0x270F9A758]();
}

- (void)_handleCompletion
{
  uint64_t v3 = self->super.parent->parent;
  id v13 = (id)objc_opt_new();
  [v13 setFixedTypes:v4 types:v5 count:v6];
  [v13 setRemainderType:v7 remainderType:v8 remainderType:v9];
  [v3 setEncodingConvention:v10 withTransitionContext:v11 completion:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainderType, 0);

  objc_storeStrong((id *)&self->_fixedTypes, 0);
}

@end