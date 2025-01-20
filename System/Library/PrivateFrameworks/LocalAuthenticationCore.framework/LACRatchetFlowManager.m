@interface LACRatchetFlowManager
- (LACAuthUIPresenting)presenter;
- (LACRatchetFlowManager)initWithPresenter:(id)a3 uiManager:(id)a4;
- (LACRatchetUIManaging)uiManager;
- (void)dismissWithCompletion:(id)a3;
- (void)showCoolOffSheetWithOptions:(id)a3 presentationCompletion:(id)a4 sheetCompletion:(id)a5;
@end

@implementation LACRatchetFlowManager

- (LACRatchetFlowManager)initWithPresenter:(id)a3 uiManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACRatchetFlowManager;
  v9 = [(LACRatchetFlowManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presenter, a3);
    objc_storeStrong((id *)&v10->_uiManager, a4);
  }

  return v10;
}

- (LACAuthUIPresenting)presenter
{
  return self->_presenter;
}

- (LACRatchetUIManaging)uiManager
{
  return self->_uiManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiManager, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
}

- (void)showCoolOffSheetWithOptions:(id)a3 presentationCompletion:(id)a4 sheetCompletion:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v8 - 8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t (*)())_Block_copy(a4);
  objc_super v12 = (uint64_t (*)())_Block_copy(a5);
  v13 = v12;
  if (!v11)
  {
    uint64_t v14 = 0;
    if (!v12) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v11;
  v11 = thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply;
  if (v13)
  {
LABEL_3:
    *(void *)(swift_allocObject() + 16) = v13;
    v13 = partial apply for thunk for @escaping @callee_unowned @convention(block) () -> ();
  }
LABEL_5:
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v10, 1, 1, v15);
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = 0;
  *(void *)(v17 + 24) = 0;
  *(void *)(v17 + 32) = v16;
  *(_OWORD *)(v17 + 40) = xmmword_254FD1C30;
  *(void *)(v17 + 56) = v11;
  *(void *)(v17 + 64) = v14;
  v18 = self;
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Error?) -> ())?((uint64_t)v11);
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v10, (uint64_t)&closure #1 in LACRatchetFlowManager.transition(to:with:style:completion:)partial apply, v17);
  swift_release();
  _sxRi_zRi0_zlyytIsegHr_SgWOe((uint64_t)v13);
  _sxRi_zRi0_zlyytIsegHr_SgWOe((uint64_t)v11);
}

- (void)dismissWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    uint64_t v8 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ();
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  objc_super v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v11;
  v12[5] = v8;
  v12[6] = v9;
  v13 = self;
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Error?) -> ())?((uint64_t)v8);
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in LACRatchetFlowManager.dismiss(completion:)partial apply, (uint64_t)v12);
  swift_release();
  _sxRi_zRi0_zlyytIsegHr_SgWOe((uint64_t)v8);
}

@end