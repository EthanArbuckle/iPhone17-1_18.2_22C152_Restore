@interface __NSErrorRecoveryAttempter
- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(int64_t)a4;
- (void)attemptRecoveryFromError:(id)a3 optionIndex:(int64_t)a4 delegate:(id)a5 didRecoverSelector:(SEL)a6 contextInfo:(void *)a7;
@end

@implementation __NSErrorRecoveryAttempter

- (void)attemptRecoveryFromError:(id)a3 optionIndex:(int64_t)a4 delegate:(id)a5 didRecoverSelector:(SEL)a6 contextInfo:(void *)a7
{
  id v11 = a3;
  swift_unknownObjectRetain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for RecoverableError);
  swift_dynamicCast();
  uint64_t v12 = v17;
  uint64_t v13 = v18;
  __swift_project_boxed_opaque_existential_1(v16, v17);
  v14 = (void *)swift_allocObject();
  v14[2] = a5;
  v14[3] = a6;
  v14[4] = a7;
  v15 = *(void (**)(int64_t, id (*)(char), void *, uint64_t, uint64_t))(v13 + 24);
  swift_unknownObjectRetain();
  v15(a4, partial apply for closure #1 in __NSErrorRecoveryAttempter.attemptRecovery(fromError:optionIndex:delegate:didRecoverSelector:contextInfo:), v14, v12, v13);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);

  swift_unknownObjectRelease();
  swift_release();
}

- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(int64_t)a4
{
  id v5 = a3;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for RecoverableError);
  swift_dynamicCast();
  uint64_t v6 = v10;
  uint64_t v7 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  LOBYTE(a4) = (*(uint64_t (**)(int64_t, uint64_t, uint64_t))(v7 + 32))(a4, v6, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);

  swift_release();
  return a4 & 1;
}

@end