@interface CKiOSCommSafetySendContext
+ (id)contextKey;
+ (id)contextWithComposition:(id)a3 sensitiveMediaObjects:(id)a4 identifiersOfShelvedImages:(id)a5;
- (CKComposition)composition;
- (CKiOSCommSafetySendContext)initWithComposition:(id)a3 sensitiveMediaObjects:(id)a4 identifiersOfShelvedImages:(id)a5;
- (NSArray)identifiersOfShelvedImages;
- (NSSet)sensitiveMediaObjects;
@end

@implementation CKiOSCommSafetySendContext

+ (id)contextKey
{
  return @"CKCommSafetyContextKeyiOSSend";
}

+ (id)contextWithComposition:(id)a3 sensitiveMediaObjects:(id)a4 identifiersOfShelvedImages:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[CKiOSCommSafetySendContext alloc] initWithComposition:v9 sensitiveMediaObjects:v8 identifiersOfShelvedImages:v7];

  return v10;
}

- (CKiOSCommSafetySendContext)initWithComposition:(id)a3 sensitiveMediaObjects:(id)a4 identifiersOfShelvedImages:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKiOSCommSafetySendContext;
  v12 = [(CKiOSCommSafetySendContext *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_composition, a3);
    objc_storeStrong((id *)&v13->_sensitiveMediaObjects, a4);
    objc_storeStrong((id *)&v13->_identifiersOfShelvedImages, a5);
  }

  return v13;
}

- (CKComposition)composition
{
  return self->_composition;
}

- (NSSet)sensitiveMediaObjects
{
  return self->_sensitiveMediaObjects;
}

- (NSArray)identifiersOfShelvedImages
{
  return self->_identifiersOfShelvedImages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersOfShelvedImages, 0);
  objc_storeStrong((id *)&self->_sensitiveMediaObjects, 0);

  objc_storeStrong((id *)&self->_composition, 0);
}

@end