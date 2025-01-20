@interface _EXQuery
+ (BOOL)supportsSecureCoding;
+ (id)allExtensionsQuery;
+ (id)executeQueries:(id)a3;
+ (id)executeQuery:(id)a3;
+ (id)extensionPointIdentifierQuery:(id)a3;
+ (id)extensionPointIdentifierQuery:(id)a3 platform:(unsigned int)a4;
+ (void)executeQueries:(id)a3 completionHandler:(id)a4;
+ (void)executeQuery:(id)a3 completionHandler:(id)a4;
- (BOOL)allowsDuplicates;
- (BOOL)excludeLockedApps;
- (BOOL)includePostprocessing;
- (BOOL)isEqual:(id)a3;
- (BOOL)matches:(id)a3;
- (BOOL)matchesRecord:(id)a3;
- (NSPredicate)predicate;
- (NSString)extensionPointIdentifier;
- (_EXQuery)init;
- (_EXQuery)initWithCoder:(id)a3;
- (_EXQuery)initWithExtensionPointIdentifier:(id)a3;
- (_EXQuery)initWithExtensionPointIdentifier:(id)a3 predicate:(id)a4;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (unsigned)platform;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsDuplicates:(BOOL)a3;
- (void)setExcludeLockedApps:(BOOL)a3;
- (void)setExtensionPointIdentifier:(id)a3;
- (void)setIncludePostprocessing:(BOOL)a3;
- (void)setPlatform:(unsigned int)a3;
- (void)setPredicate:(id)a3;
@end

@implementation _EXQuery

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)self + OBJC_IVAR____EXQuery_inner);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQuery_predicate);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_191FBA1E8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_191F35ACC((uint64_t)v8);

  sub_191F35A6C((uint64_t)v8);
  return v6 & 1;
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_191F39BF0(v6);

  __swift_project_boxed_opaque_existential_2Tm(v6, v6[3]);
  v4 = (void *)sub_191FBA588();
  __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)v6);
  return v4;
}

- (_EXQuery)init
{
  return (_EXQuery *)sub_191F39D30();
}

- (_EXQuery)initWithExtensionPointIdentifier:(id)a3
{
  uint64_t v3 = sub_191FB9DC8();
  uint64_t v5 = v4;
  int active_platform = dyld_get_active_platform();
  v7 = (unint64_t *)_EXAuditTokenForCurrentProcess();
  unint64_t v8 = *v7;
  unint64_t v9 = v7[1];
  unint64_t v10 = v7[2];
  unint64_t v11 = v7[3];
  id v12 = objc_allocWithZone((Class)type metadata accessor for _EXQuery());
  v13 = (_EXQuery *)sub_191F415F0(v3, v5, active_platform, v8, v9, v10, v11);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v13;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_191F417B8();

  return v3;
}

- (void)setExcludeLockedApps:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____EXQuery_excludeLockedApps) = a3;
}

+ (id)extensionPointIdentifierQuery:(id)a3
{
  uint64_t v3 = sub_191FB9DC8();
  uint64_t v5 = v4;
  swift_bridgeObjectRetain();
  int active_platform = dyld_get_active_platform();
  v7 = (unint64_t *)_EXAuditTokenForCurrentProcess();
  unint64_t v8 = *v7;
  unint64_t v9 = v7[1];
  unint64_t v10 = v7[2];
  unint64_t v11 = v7[3];
  id v12 = objc_allocWithZone((Class)type metadata accessor for _EXQuery());
  id v13 = sub_191F415F0(v3, v5, active_platform, v8, v9, v10, v11);
  swift_bridgeObjectRelease();

  return v13;
}

+ (id)extensionPointIdentifierQuery:(id)a3 platform:(unsigned int)a4
{
  uint64_t v5 = sub_191FB9DC8();
  uint64_t v7 = v6;
  swift_bridgeObjectRetain();
  unint64_t v8 = (unint64_t *)_EXAuditTokenForCurrentProcess();
  unint64_t v9 = *v8;
  unint64_t v10 = v8[1];
  unint64_t v11 = v8[2];
  unint64_t v12 = v8[3];
  id v13 = objc_allocWithZone((Class)type metadata accessor for _EXQuery());
  id v14 = sub_191F415F0(v5, v7, a4, v9, v10, v11, v12);
  swift_bridgeObjectRelease();

  return v14;
}

+ (id)allExtensionsQuery
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for _EXQuery()), sel_init);

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXQuery)initWithExtensionPointIdentifier:(id)a3 predicate:(id)a4
{
  uint64_t v5 = sub_191FB9DC8();
  uint64_t v7 = v6;
  unint64_t v8 = (objc_class *)a4;
  int active_platform = dyld_get_active_platform();
  unint64_t v10 = (unint64_t *)_EXAuditTokenForCurrentProcess();
  unint64_t v11 = *v10;
  unint64_t v12 = v10[1];
  unint64_t v13 = v10[2];
  unint64_t v14 = v10[3];
  id v15 = objc_allocWithZone((Class)type metadata accessor for _EXQuery());
  v16 = (_EXQuery *)sub_191F415F0(v5, v7, active_platform, v11, v12, v13, v14);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  v17 = *(Class *)((char *)&v16->super.isa + OBJC_IVAR____EXQuery_predicate);
  *(Class *)((char *)&v16->super.isa + OBJC_IVAR____EXQuery_predicate) = v8;

  return v16;
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR____EXQuery_predicate));
}

- (void)setPredicate:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQuery_predicate);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQuery_predicate) = (Class)a3;
  id v3 = a3;
}

- (BOOL)includePostprocessing
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____EXQuery_includePostprocessing);
}

- (void)setIncludePostprocessing:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____EXQuery_includePostprocessing) = a3;
}

- (BOOL)allowsDuplicates
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____EXQuery_allowsDuplicates);
}

- (void)setAllowsDuplicates:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____EXQuery_allowsDuplicates) = a3;
}

- (NSString)extensionPointIdentifier
{
  id v3 = (char *)self + OBJC_IVAR____EXQuery_inner;
  swift_beginAccess();
  sub_191F41D54((uint64_t)v3, (uint64_t)v12);
  uint64_t v4 = v13;
  uint64_t v5 = v14;
  __swift_project_boxed_opaque_existential_2Tm(v12, v13);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  uint64_t v7 = self;
  v6(v4, v5);
  uint64_t v9 = v8;
  __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)v12);

  if (v9)
  {
    unint64_t v10 = (void *)sub_191FB9DA8();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v10 = 0;
  }

  return (NSString *)v10;
}

- (void)setExtensionPointIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_191FB9DC8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = (char *)self + OBJC_IVAR____EXQuery_inner;
  swift_beginAccess();
  uint64_t v8 = *((void *)v7 + 3);
  uint64_t v9 = *((void *)v7 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v7, v8);
  unint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 16);
  unint64_t v11 = self;
  v10(v4, v6, v8, v9);
  swift_endAccess();
}

- (unsigned)platform
{
  id v3 = (char *)self + OBJC_IVAR____EXQuery_inner;
  swift_beginAccess();
  sub_191F41D54((uint64_t)v3, (uint64_t)v9);
  uint64_t v4 = v10;
  uint64_t v5 = v11;
  __swift_project_boxed_opaque_existential_2Tm(v9, v10);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 40);
  uint64_t v7 = self;
  LODWORD(v3) = v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)v9);

  return v3;
}

- (void)setPlatform:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = (char *)self + OBJC_IVAR____EXQuery_inner;
  swift_beginAccess();
  uint64_t v6 = *((void *)v5 + 3);
  uint64_t v7 = *((void *)v5 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v5, v6);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  uint64_t v9 = self;
  v8(v3, v6, v7);
  swift_endAccess();
}

- (BOOL)excludeLockedApps
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____EXQuery_excludeLockedApps);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_191F886E0(v4);
}

- (_EXQuery)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_EXQuery *)sub_191F89D78(v3);

  return v4;
}

- (BOOL)matches:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_191F88B40(v4);

  return self & 1;
}

- (BOOL)matchesRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_191F37F68(v4);

  return self & 1;
}

+ (id)executeQuery:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB27BE50);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_191FBFCE0;
  *(void *)(inited + 32) = a3;
  unint64_t v9 = inited;
  sub_191FB9EF8();
  id v5 = a3;
  unint64_t v6 = sub_191F87854(v9);
  swift_bridgeObjectRelease();
  sub_191F9AEC4(v6);

  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92FD648);
  uint64_t v7 = (void *)sub_191FB9EC8();
  swift_bridgeObjectRelease();

  return v7;
}

+ (void)executeQuery:(id)a3 completionHandler:(id)a4
{
  id v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB27BE50);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_191FBFCE0;
  *(void *)(v7 + 32) = a3;
  unint64_t v10 = v7;
  sub_191FB9EF8();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_191F8A728;
  *(void *)(v8 + 24) = v6;
  id v9 = a3;
  swift_retain();
  sub_191F879BC(v10, (uint64_t)sub_191F8A220, v8);

  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
}

+ (id)executeQueries:(id)a3
{
  type metadata accessor for _EXQuery();
  unint64_t v3 = sub_191FB9ED8();
  unint64_t v4 = sub_191F87854(v3);
  sub_191F9AEC4(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92FD648);
  id v5 = (void *)sub_191FB9EC8();
  swift_bridgeObjectRelease();

  return v5;
}

+ (void)executeQueries:(id)a3 completionHandler:(id)a4
{
  unint64_t v4 = _Block_copy(a4);
  type metadata accessor for _EXQuery();
  unint64_t v5 = sub_191FB9ED8();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_191F8A1E0;
  *(void *)(v7 + 24) = v6;
  swift_retain();
  sub_191F879BC(v5, (uint64_t)sub_191F8A734, v7);
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

@end