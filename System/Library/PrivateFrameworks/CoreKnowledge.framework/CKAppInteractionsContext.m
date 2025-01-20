@interface CKAppInteractionsContext
+ (BOOL)supportsSecureCoding;
- (CKAppInteractionsContext)init;
- (CKAppInteractionsContext)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)updateDiscardedDonations:(double)a3 forIntentType:(id)a4 andBundleId:(id)a5;
@end

@implementation CKAppInteractionsContext

- (CKAppInteractionsContext)init
{
  return (CKAppInteractionsContext *)CKAppInteractionsContext.init()();
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A77B97AC(v4);
}

- (CKAppInteractionsContext)initWithCoder:(id)a3
{
  return (CKAppInteractionsContext *)CKAppInteractionsContext.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_1A77B9E50(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  id v4 = (void *)sub_1A7831DAC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (void)updateDiscardedDonations:(double)a3 forIntentType:(id)a4 andBundleId:(id)a5
{
  uint64_t v6 = sub_1A78317EC();
  uint64_t v8 = v7;
  sub_1A78317EC();
  v9 = self;
  sub_1A77BA44C(v6, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end