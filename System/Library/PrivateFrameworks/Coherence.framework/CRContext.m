@interface CRContext
+ (id)newTransientContextObjC;
- (CRContext)init;
@end

@implementation CRContext

- (void).cxx_destruct
{
}

- (CRContext)init
{
  result = (CRContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

+ (id)newTransientContextObjC
{
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  id v2 = _s9Coherence9CRContextC19newTransientContext18uniqueAssetManager18encryptionDelegateACSb_AA010EncryptionJ0_pSgtFZ_0(0, (uint64_t)v4);
  sub_1C3F962E0((uint64_t)v4, qword_1EBBC0C90);
  return v2;
}

@end