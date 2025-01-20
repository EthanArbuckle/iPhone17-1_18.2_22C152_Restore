@interface MPCSonicAVItem_Swift
- (MPCSonicAVItem_Swift)init;
- (MPCSonicAVItem_Swift)initWithItem:(id)a3 contentID:(id)a4 userIdentity:(id)a5;
- (id)_contentID;
- (void)renderWithCompletion:(id)a3;
@end

@implementation MPCSonicAVItem_Swift

- (MPCSonicAVItem_Swift)initWithItem:(id)a3 contentID:(id)a4 userIdentity:(id)a5
{
  uint64_t v7 = sub_21BEAA178();
  return (MPCSonicAVItem_Swift *)sub_21BC98F48(a3, v7, v8, a5);
}

- (void).cxx_destruct
{
}

- (void)renderWithCompletion:(id)a3
{
}

- (id)_contentID
{
  v2 = self;
  sub_21BC9B398(v5);

  __swift_project_boxed_opaque_existential_0Tm(v5, v5[3]);
  v3 = (void *)sub_21BEAAE58();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v5);

  return v3;
}

- (MPCSonicAVItem_Swift)init
{
}

@end