@interface CSEnhancedEndpointerModelTypeDefault
- (id)modelName;
- (int64_t)endpointerType;
- (int64_t)featureCount;
- (uint64_t)inputVector;
- (uint64_t)setInputVector:(uint64_t)a1;
- (uint64_t)setModelName:(uint64_t)a1;
- (void)setEndpointerType:(int64_t)a3;
- (void)setFeatureCount:(int64_t)a3;
@end

@implementation CSEnhancedEndpointerModelTypeDefault

- (int64_t)featureCount
{
  return *(void *)self->featureCount;
}

- (void)setFeatureCount:(int64_t)a3
{
  *(void *)self->featureCount = a3;
}

- (int64_t)endpointerType
{
  return *(void *)self->endpointerType;
}

- (void)setEndpointerType:(int64_t)a3
{
  *(void *)self->endpointerType = a3;
}

- (id)modelName
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v0 = (void *)sub_1BA252368();
  swift_bridgeObjectRelease();
  return v0;
}

- (uint64_t)setModelName:(uint64_t)a1
{
  uint64_t v2 = sub_1BA252378();
  uint64_t v4 = v3;
  swift_beginAccess();
  *(void *)(a1 + 24) = v2;
  *(void *)(a1 + 32) = v4;
  return swift_bridgeObjectRelease();
}

- (uint64_t)inputVector
{
  return swift_getObjCClassFromMetadata();
}

- (uint64_t)setInputVector:(uint64_t)a1
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t result = swift_beginAccess();
  *(void *)(a1 + 40) = ObjCClassMetadata;
  return result;
}

@end