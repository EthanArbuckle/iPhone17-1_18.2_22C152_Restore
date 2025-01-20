@interface AddressingViewFactory
- (UIViewController)viewController;
- (_TtC14CloudSharingUI21AddressingViewFactory)init;
- (_TtC14CloudSharingUI21AddressingViewFactory)initWithHeaderImageData:(id)a3 headerTitle:(id)a4 loadingText:(id)a5 supplementaryText:(id)a6 userInfoText:(id)a7 primaryButtonText:(id)a8 secondaryButtonText:(id)a9 userDidClickPrimaryButton:(id)a10 userDidClickSecondaryButton:(id)a11 userDidClickShowContactPicker:(id)a12 userDidChangeAddresses:(id)a13;
- (void)addAddressFrom:(id)a3 contactProperty:(id)a4;
- (void)updateWithHeaderImageData:(id)a3 headerTitle:(id)a4 loadingText:(id)a5 supplementaryText:(id)a6 userInfoText:(id)a7 primaryButtonText:(id)a8 secondaryButtonText:(id)a9;
@end

@implementation AddressingViewFactory

- (UIViewController)viewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC14CloudSharingUI21AddressingViewFactory_viewController));
}

- (_TtC14CloudSharingUI21AddressingViewFactory)initWithHeaderImageData:(id)a3 headerTitle:(id)a4 loadingText:(id)a5 supplementaryText:(id)a6 userInfoText:(id)a7 primaryButtonText:(id)a8 secondaryButtonText:(id)a9 userDidClickPrimaryButton:(id)a10 userDidClickSecondaryButton:(id)a11 userDidClickShowContactPicker:(id)a12 userDidChangeAddresses:(id)a13
{
  v66 = (uint64_t (*)())_Block_copy(a10);
  v72 = _Block_copy(a11);
  v68 = _Block_copy(a12);
  v19 = _Block_copy(a13);
  if (a3)
  {
    id v20 = a4;
    id v21 = a5;
    id v22 = a6;
    id v23 = a7;
    id v24 = a8;
    id v25 = a9;
    id v26 = a9;
    id v27 = a3;
    uint64_t v28 = sub_2180CF5C0();
    unint64_t v74 = v29;
    uint64_t v75 = v28;

    v30 = v66;
    if (a4)
    {
LABEL_3:
      uint64_t v31 = sub_2180CFE50();
      unint64_t v70 = v32;
      v71 = (void *)v31;

      goto LABEL_6;
    }
  }
  else
  {
    id v33 = a4;
    id v34 = a5;
    id v35 = a6;
    id v36 = a7;
    id v37 = a8;
    id v25 = a9;
    id v38 = a9;
    unint64_t v74 = 0xF000000000000000;
    uint64_t v75 = 0;
    v30 = v66;
    if (a4) {
      goto LABEL_3;
    }
  }
  unint64_t v70 = 0;
  v71 = 0;
LABEL_6:
  v39 = v68;
  v40 = v19;
  if (a5)
  {
    uint64_t v41 = sub_2180CFE50();
    unint64_t v67 = v42;
    v69 = (void *)v41;

    if (a6) {
      goto LABEL_8;
    }
  }
  else
  {
    unint64_t v67 = 0;
    v69 = 0;
    if (a6)
    {
LABEL_8:
      uint64_t v43 = sub_2180CFE50();
      unint64_t v64 = v44;
      v65 = (void *)v43;

      v45 = v72;
      if (a7) {
        goto LABEL_9;
      }
      goto LABEL_18;
    }
  }
  unint64_t v64 = 0;
  v65 = 0;
  v45 = v72;
  if (a7)
  {
LABEL_9:
    v73 = (void *)sub_2180CFE50();
    unint64_t v63 = v46;

    if (a8) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  v73 = 0;
  unint64_t v63 = 0;
  if (a8)
  {
LABEL_10:
    uint64_t v47 = sub_2180CFE50();
    unint64_t v61 = v48;
    v62 = (void *)v47;

    if (v25) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  unint64_t v61 = 0;
  v62 = 0;
  if (v25)
  {
LABEL_11:
    v60 = (void *)sub_2180CFE50();
    unint64_t v50 = v49;

    if (v30) {
      goto LABEL_12;
    }
    goto LABEL_21;
  }
LABEL_20:
  v60 = 0;
  unint64_t v50 = 0;
  if (v30)
  {
LABEL_12:
    uint64_t v51 = swift_allocObject();
    *(void *)(v51 + 16) = v30;
    v30 = sub_2180CF35C;
    if (v45) {
      goto LABEL_13;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v51 = 0;
  if (v45)
  {
LABEL_13:
    uint64_t v52 = swift_allocObject();
    *(void *)(v52 + 16) = v45;
    v53 = sub_2180CF35C;
    if (v39) {
      goto LABEL_14;
    }
LABEL_23:
    v55 = 0;
    uint64_t v54 = 0;
    if (v40) {
      goto LABEL_15;
    }
LABEL_24:
    v57 = 0;
    uint64_t v56 = 0;
    goto LABEL_25;
  }
LABEL_22:
  v53 = 0;
  uint64_t v52 = 0;
  if (!v39) {
    goto LABEL_23;
  }
LABEL_14:
  uint64_t v54 = swift_allocObject();
  *(void *)(v54 + 16) = v39;
  v55 = sub_2180CF35C;
  if (!v40) {
    goto LABEL_24;
  }
LABEL_15:
  uint64_t v56 = swift_allocObject();
  *(void *)(v56 + 16) = v40;
  v57 = sub_2180CF35C;
LABEL_25:
  v58 = (_TtC14CloudSharingUI21AddressingViewFactory *)sub_2180CF05C(v75, v74, v71, v70, v69, v67, v65, v64, v73, v63, v62, v61, v60, v50, (uint64_t)v30, v51, (uint64_t)v53, v52, (uint64_t)v55,
                                                         v54,
                                                         (uint64_t)v57,
                                                         v56);
  sub_2180AC8B8((uint64_t)v57);
  sub_2180AC8B8((uint64_t)v55);
  sub_2180AC8B8((uint64_t)v53);
  sub_2180AC8B8((uint64_t)v30);
  sub_2180C8EC8(v75, v74);
  return v58;
}

- (void)updateWithHeaderImageData:(id)a3 headerTitle:(id)a4 loadingText:(id)a5 supplementaryText:(id)a6 userInfoText:(id)a7 primaryButtonText:(id)a8 secondaryButtonText:(id)a9
{
  if (a3)
  {
    id v15 = a4;
    id v16 = a5;
    id v17 = a6;
    id v18 = a7;
    id v19 = a8;
    id v20 = a9;
    id v21 = self;
    id v22 = a3;
    uint64_t v23 = sub_2180CF5C0();
    unint64_t v50 = v24;
    uint64_t v51 = v23;

    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    id v39 = a4;
    id v40 = a5;
    id v41 = a6;
    id v42 = a7;
    id v43 = a8;
    id v44 = a9;
    v45 = self;
    unint64_t v50 = 0xF000000000000000;
    uint64_t v51 = 0;
    if (a4)
    {
LABEL_3:
      unint64_t v48 = (void *)sub_2180CFE50();
      unint64_t v49 = v25;

      if (a5) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  unint64_t v48 = 0;
  unint64_t v49 = 0;
  if (a5)
  {
LABEL_4:
    uint64_t v47 = (void *)sub_2180CFE50();
    unint64_t v27 = v26;

    if (a6) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v47 = 0;
  unint64_t v27 = 0;
  if (a6)
  {
LABEL_5:
    unint64_t v46 = (void *)sub_2180CFE50();
    unint64_t v29 = v28;

    if (a7) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v46 = 0;
  unint64_t v29 = 0;
  if (a7)
  {
LABEL_6:
    v30 = (void *)sub_2180CFE50();
    unint64_t v32 = v31;

    if (a8) {
      goto LABEL_7;
    }
LABEL_14:
    id v33 = 0;
    unint64_t v35 = 0;
    if (a9) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_13:
  v30 = 0;
  unint64_t v32 = 0;
  if (!a8) {
    goto LABEL_14;
  }
LABEL_7:
  id v33 = (void *)sub_2180CFE50();
  unint64_t v35 = v34;

  if (a9)
  {
LABEL_8:
    id v36 = (void *)sub_2180CFE50();
    unint64_t v38 = v37;

    goto LABEL_16;
  }
LABEL_15:
  id v36 = 0;
  unint64_t v38 = 0;
LABEL_16:
  sub_2180C974C(v51, v50, v48, v49, v47, v27, v46, v29, v30, v32, v33, v35, v36, v38);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2180C8EC8(v51, v50);
}

- (void)addAddressFrom:(id)a3 contactProperty:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_2180C8F8C(a3, a4);
}

- (_TtC14CloudSharingUI21AddressingViewFactory)init
{
  result = (_TtC14CloudSharingUI21AddressingViewFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14CloudSharingUI21AddressingViewFactory_viewController);
}

@end