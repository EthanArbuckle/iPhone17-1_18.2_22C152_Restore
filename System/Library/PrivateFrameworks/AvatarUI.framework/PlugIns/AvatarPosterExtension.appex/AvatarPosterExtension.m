void type metadata accessor for PRPosterBoundingShape(uint64_t a1)
{
  sub_100002C34(a1, &qword_100022AE8);
}

void sub_100002828(void *a1)
{
  [v1 setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = self;
  sub_100002B10(&qword_100022AF0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100016AB0;
  id v5 = [a1 leadingAnchor];
  id v6 = [v1 leadingAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];

  *(void *)(v4 + 32) = v7;
  id v8 = [a1 trailingAnchor];
  id v9 = [v1 trailingAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9];

  *(void *)(v4 + 40) = v10;
  id v11 = [a1 topAnchor];
  id v12 = [v1 topAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12];

  *(void *)(v4 + 48) = v13;
  id v14 = [a1 bottomAnchor];
  id v15 = [v1 bottomAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15];

  *(void *)(v4 + 56) = v16;
  sub_100015B30();
  sub_100002B54();
  Class isa = sub_100015B10().super.isa;
  swift_bridgeObjectRelease();
  [v3 activateConstraints:isa];
}

void sub_100002A80(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_100002A88@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_100002A9C(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100002ACC(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100002AE0(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_100002AF4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100002B04(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100002B10(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100002B54()
{
  unint64_t result = qword_100022AF8;
  if (!qword_100022AF8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100022AF8);
  }
  return result;
}

void *sub_100002B94@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void type metadata accessor for CGColor(uint64_t a1)
{
}

__n128 initializeBufferWithCopyOfBuffer for AvatarPosterEditor.Constants(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AvatarPosterEditor.Constants(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AvatarPosterEditor.Constants(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void sub_100002C34(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

id sub_100002CBC()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AvatarPosterUpdater()
{
  return self;
}

void sub_100002D80(void *a1)
{
  objc_super v2 = v1;
  id v4 = [v1 image];
  id v5 = v4;
  if (a1)
  {
    if (v4)
    {
      sub_100003C34();
      id v12 = a1;
      char v6 = sub_100015C60();

      if (v6)
      {

        return;
      }
    }
  }
  else
  {
    if (!v4) {
      return;
    }
  }
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_innerImageView], "setImage:", a1, v12);
  sub_100003828();
  sub_100003AA0((uint64_t)&v2[OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_delegate], (uint64_t)v13);
  if (v14)
  {
    id v7 = sub_100003B68(v13, v14);
    if (a1)
    {
      if (*(void *)(*v7 + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_extendedRenderingSession))
      {
        if (qword_100022A80 != -1) {
          swift_once();
        }
        uint64_t v8 = sub_100015A00();
        sub_100003BFC(v8, (uint64_t)qword_100022D90);
        id v9 = sub_1000159E0();
        os_log_type_t v10 = sub_100015BB0();
        if (os_log_type_enabled(v9, v10))
        {
          id v11 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v11 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, v10, "Relinquishing extended rendering session", v11, 2u);
          swift_slowDealloc();
        }

        sub_1000051B4(0);
      }
    }
    sub_100003BAC((uint64_t)v13);
  }
  else
  {

    sub_100003B08((uint64_t)v13);
  }
}

id sub_100002F98(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v3 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(a1
                                                             + OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_innerImageView), *a3));
  return v3;
}

double sub_100003128()
{
  [v0 bounds];
  double v2 = v1;
  double v4 = v3;
  id v5 = [v0 image];
  if (v5)
  {
    char v6 = v5;
    [v5 size];
    double v8 = v2 / v7;
    [v6 size];
    double v10 = v4 / v9;
    id v11 = [v0 contentMode];
    if (v11)
    {
      if (v11 == (id)1)
      {
        if (v10 >= v8) {
          double v10 = v8;
        }
      }
      else
      {
        if (v11 != (id)2)
        {
          [v6 size];
          double v2 = v14;

          return v2;
        }
        if (v8 > v10) {
          double v10 = v8;
        }
      }
      [v6 size];
      double v2 = v10 * v13;
    }
    else
    {
      [v6 size];
      double v2 = v8 * v12;
    }
    [v6 size];
  }
  return v2;
}

void sub_1000033AC(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_innerImageView] = 0;
  double v3 = &v1[OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_delegate];
  double v4 = (objc_class *)type metadata accessor for AvatarPosterImageView();
  *(_OWORD *)double v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((void *)v3 + 4) = 0;
  v19.receiver = v1;
  v19.super_class = v4;
  id v5 = objc_msgSendSuper2(&v19, "initWithCoder:", a1);
  if (!v5) {
    goto LABEL_7;
  }
  v18.receiver = v5;
  v18.super_class = v4;
  char v6 = (char *)v5;
  id v7 = objc_msgSendSuper2(&v18, "image");
  v17.receiver = v6;
  v17.super_class = v4;
  id v8 = objc_msgSendSuper2(&v17, "highlightedImage");
  id v9 = [objc_allocWithZone((Class)UIImageView) initWithImage:v7 highlightedImage:v8];

  uint64_t v10 = OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_innerImageView;
  id v11 = *(void **)&v6[OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_innerImageView];
  *(void *)&v6[OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_innerImageView] = v9;

  double v12 = *(void **)&v6[v10];
  if (v12)
  {
    id v13 = v12;
    [v6 bounds];
    objc_msgSend(v13, "setFrame:");

    double v14 = *(void **)&v6[v10];
    if (v14)
    {
      [v14 setAutoresizingMask:18];
      id v15 = *(void **)&v6[v10];
      if (v15)
      {
        id v16 = v15;
        objc_msgSend(v16, "setContentMode:", objc_msgSend(v6, "contentMode"));

        if (*(void *)&v6[v10])
        {
          objc_msgSend(v6, "addSubview:");

LABEL_7:
          return;
        }
      }
    }
  }
  __break(1u);
}

void sub_100003614(void *a1, uint64_t a2, const char **a3)
{
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for AvatarPosterImageView();
  double v4 = *a3;
  id v5 = v7.receiver;
  objc_msgSendSuper2(&v7, v4);
  id v6 = objc_msgSend(v5, "layer", v7.receiver, v7.super_class);
  [v6 setContents:0];
}

void sub_100003694(void *a1, void *a2)
{
  if (!a1)
  {
    v20.receiver = v2;
    v20.super_class = (Class)type metadata accessor for AvatarPosterImageView();
    id v5 = objc_msgSendSuper2(&v20, "image");
    if (a2) {
      goto LABEL_3;
    }
LABEL_5:
    v19.receiver = v2;
    v19.super_class = (Class)type metadata accessor for AvatarPosterImageView();
    id v8 = a1;
    id v7 = objc_msgSendSuper2(&v19, "highlightedImage");
    goto LABEL_6;
  }
  id v5 = a1;
  if (!a2) {
    goto LABEL_5;
  }
LABEL_3:
  id v6 = a1;
  id v7 = a2;
LABEL_6:
  id v9 = objc_allocWithZone((Class)UIImageView);
  id v10 = a2;
  id v11 = [v9 initWithImage:v5 highlightedImage:v7];

  uint64_t v12 = OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_innerImageView;
  id v13 = *(void **)&v2[OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_innerImageView];
  *(void *)&v2[OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_innerImageView] = v11;

  double v14 = *(void **)&v2[v12];
  if (!v14) {
    goto LABEL_11;
  }
  id v15 = v14;
  [v2 bounds];
  objc_msgSend(v15, "setFrame:");

  id v16 = *(void **)&v2[v12];
  if (!v16) {
    goto LABEL_11;
  }
  [v16 setAutoresizingMask:18];
  objc_super v17 = *(void **)&v2[v12];
  if (v17
    && (id v18 = v17,
        objc_msgSend(v18, "setContentMode:", objc_msgSend(v2, "contentMode")),
        v18,
        *(void *)&v2[v12]))
  {
    objc_msgSend(v2, "addSubview:");
  }
  else
  {
LABEL_11:
    __break(1u);
  }
}

id sub_100003828()
{
  double v1 = sub_100003128();
  CGFloat v3 = v2;
  [v0 bounds];
  double v5 = v4;
  [v0 bounds];
  id v6 = *(void **)&v0[OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_innerImageView];
  if (v6)
  {
    id v7 = v6;
    v23.origin.y = 0.0;
    v23.origin.x = (v5 - v1) * 0.5;
    v23.size.width = v1;
    v23.size.height = v3;
    CGRect v24 = CGRectIntegral(v23);
    objc_msgSend(v7, "setFrame:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
  }
  [v0 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  CGFloat v15 = v14;
  v21.width = v12;
  v21.height = v14;
  v22.width = v1;
  v22.height = v3;
  if (!CGSizeEqualToSize(v21, v22))
  {
    v25.origin.x = v9;
    v25.origin.y = v11;
    v25.size.width = v13;
    v25.size.height = v15;
    double v16 = (v13 - v1) * 0.5 + CGRectGetMinX(v25);
    v26.origin.x = v9;
    v26.origin.y = v11;
    v26.size.width = v13;
    v26.size.height = v15;
    double MinY = CGRectGetMinY(v26);
    nullsub_1(v16, MinY);
    objc_msgSend(v0, "setFrame:");
  }
  id v18 = [v0 layer];
  [v18 setContents:0];

  v20.receiver = v0;
  v20.super_class = (Class)type metadata accessor for AvatarPosterImageView();
  return objc_msgSendSuper2(&v20, "setImage:", 0);
}

id sub_1000039F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AvatarPosterImageView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AvatarPosterImageView()
{
  return self;
}

uint64_t sub_100003AA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002B10(&qword_100022C48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100003B08(uint64_t a1)
{
  uint64_t v2 = sub_100002B10(&qword_100022C48);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_100003B68(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100003BAC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100003BFC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_100003C34()
{
  unint64_t result = qword_100022C50;
  if (!qword_100022C50)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100022C50);
  }
  return result;
}

uint64_t sub_100003C74(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(void **)(*(void *)(v4 + 64) + 40);
  *double v5 = a2;
  v5[1] = a3;
  id v6 = a2;
  id v7 = a3;
  return _swift_continuation_resume(v4);
}

uint64_t sub_100003CD0()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for AvatarPosterImageGenerator()
{
  return self;
}

uint64_t sub_100003D04(uint64_t a1, double a2, double a3, double a4)
{
  *(double *)(v4 + 152) = a3;
  *(double *)(v4 + 160) = a4;
  *(double *)(v4 + 144) = a2;
  *(void *)(v4 + 136) = a1;
  return _swift_task_switch(sub_100003D2C, 0, 0);
}

uint64_t sub_100003D2C()
{
  uint64_t v1 = sub_100015760();
  *((void *)v0 + 21) = v1;
  if (!v1)
  {
LABEL_9:
    objc_super v17 = (uint64_t (*)(void))*((void *)v0 + 1);
    return v17(0);
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_1000157C0();
  *((void *)v0 + 22) = v3;
  *((void *)v0 + 23) = v4;
  if (v4 >> 60 == 15)
  {
    swift_unknownObjectRelease();
    goto LABEL_9;
  }
  uint64_t v5 = v3;
  unint64_t v6 = v4;
  id v7 = self;
  Class isa = sub_100015920().super.isa;
  id v9 = [v7 poseConfigurationForData:isa withAvatarRecord:v2];
  *((void *)v0 + 24) = v9;

  if (!v9)
  {
    swift_unknownObjectRelease();
    sub_100004148(v5, v6);
    goto LABEL_9;
  }
  double v11 = v0[19];
  double v10 = v0[20];
  double v12 = v0[18];
  id v13 = [self avatarForRecord:v2];
  *((void *)v0 + 25) = v13;
  id v14 = [objc_allocWithZone((Class)AVTStickerGenerator) initWithAvatar:v13];
  *((void *)v0 + 26) = v14;
  [v14 setAsync:0];
  id v15 = objc_msgSend(self, "stickerGeneraterPosterOptionsWithSize:minimumHorizontalMargin:", v12, v11, v10);
  *((void *)v0 + 27) = v15;
  *((void *)v0 + 2) = v0;
  *((void *)v0 + 7) = v0 + 15;
  *((void *)v0 + 3) = sub_100003FC8;
  uint64_t v16 = swift_continuation_init();
  *((void *)v0 + 10) = _NSConcreteStackBlock;
  *((void *)v0 + 11) = 0x40000000;
  *((void *)v0 + 12) = sub_100003C74;
  *((void *)v0 + 13) = &unk_10001CD68;
  *((void *)v0 + 14) = v16;
  [v14 posterWithConfiguration:v9 options:v15 completionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100003FC8()
{
  return _swift_task_switch(sub_1000040A8, 0, 0);
}

uint64_t sub_1000040A8()
{
  uint64_t v2 = *(void **)(v0 + 208);
  uint64_t v1 = *(void **)(v0 + 216);
  unint64_t v4 = *(void **)(v0 + 192);
  uint64_t v3 = *(void **)(v0 + 200);
  sub_100004148(*(void *)(v0 + 176), *(void *)(v0 + 184));
  swift_unknownObjectRelease();

  uint64_t v5 = *(void *)(v0 + 120);
  unint64_t v6 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v6(v5);
}

uint64_t sub_100004148(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000415C(a1, a2);
  }
  return a1;
}

uint64_t sub_10000415C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t type metadata accessor for AvatarPosterColorGenerator()
{
  return self;
}

unint64_t sub_1000041D8(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    swift_stdlib_random();
    uint64_t result = (0 * (unsigned __int128)v1) >> 64;
    if (-(uint64_t)v1 % v1)
    {
      while (1)
        swift_stdlib_random();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_100004264()
{
  id v0 = [self standardPalette];
  id v1 = [v0 colors];

  sub_10000440C();
  unint64_t v2 = sub_100015B20();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_100015DE0();
    swift_bridgeObjectRelease();
    if (v8)
    {
      swift_bridgeObjectRetain();
      unint64_t v3 = sub_100015DE0();
      unint64_t result = swift_bridgeObjectRelease();
      if ((v3 & 0x8000000000000000) != 0) {
        goto LABEL_20;
      }
      if (v3)
      {
LABEL_3:
        unint64_t result = sub_1000041D8(v3);
        if ((v2 & 0xC000000000000001) != 0)
        {
          id v5 = (id)sub_100015D10();
LABEL_7:
          unint64_t v6 = v5;
          swift_bridgeObjectRelease();
          id v7 = [v6 color];

          if (v7) {
            return (unint64_t)v7;
          }
          goto LABEL_14;
        }
        if ((result & 0x8000000000000000) != 0)
        {
          __break(1u);
        }
        else if (result < *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v5 = *(id *)(v2 + 8 * result + 32);
          goto LABEL_7;
        }
        __break(1u);
LABEL_20:
        __break(1u);
        return result;
      }
      __break(1u);
    }
  }
  else
  {
    unint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
LABEL_14:
  id v9 = [self grayColor];
  return (unint64_t)v9;
}

unint64_t sub_10000440C()
{
  unint64_t result = qword_1000232E0;
  if (!qword_1000232E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000232E0);
  }
  return result;
}

uint64_t sub_10000444C()
{
  uint64_t v0 = sub_100015A00();
  sub_10000797C(v0, qword_100022D90);
  sub_100003BFC(v0, (uint64_t)qword_100022D90);
  return sub_1000159F0();
}

void sub_1000044C8(void *a1, void *a2)
{
  uint64_t v3 = v2;
  if (qword_100022A80 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_100015A00();
  sub_100003BFC(v6, (uint64_t)qword_100022D90);
  swift_unknownObjectRetain_n();
  id v7 = sub_1000159E0();
  os_log_type_t v8 = sub_100015BB0();
  if (os_log_type_enabled(v7, v8))
  {
    v35 = a1;
    id v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    *(_DWORD *)id v9 = 136315138;
    id v10 = [a2 description];
    uint64_t v11 = sub_100015AC0();
    unint64_t v13 = v12;

    uint64_t v14 = v11;
    a1 = v35;
    sub_10001314C(v14, v13, &v36);
    sub_100015CA0();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Initializing renderer with poster environment: %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  id v15 = *(void **)(v3 + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_renderer);
  *(void *)(v3 + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_renderer) = a1;

  id v16 = a1;
  sub_10000526C(a2);
  sub_100005CC8(a2);
  id v17 = [v16 backgroundView];
  uint64_t v18 = OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer__backgroundViewController;
  uint64_t v19 = *(void **)(v3 + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer__backgroundViewController);
  if (!v19)
  {
    id v20 = [objc_allocWithZone((Class)UIViewController) init];
    CGSize v21 = *(void **)(v3 + v18);
    *(void *)(v3 + v18) = v20;

    uint64_t v19 = *(void **)(v3 + v18);
    if (!v19) {
      goto LABEL_19;
    }
  }
  id v22 = [v19 view];
  if (!v22)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  CGRect v23 = v22;
  [v17 addSubview:v22];

  CGRect v24 = *(void **)(v3 + v18);
  if (!v24)
  {
    id v25 = [objc_allocWithZone((Class)UIViewController) init];
    CGRect v26 = *(void **)(v3 + v18);
    *(void *)(v3 + v18) = v25;

    CGRect v24 = *(void **)(v3 + v18);
    if (!v24) {
      goto LABEL_20;
    }
  }
  id v27 = [v24 view];
  if (!v27) {
    goto LABEL_16;
  }
  v28 = v27;
  id v29 = [v16 backgroundView];
  sub_100002828(v29);

  id v30 = [v16 floatingView];
  v31 = sub_1000079E0();
  if (v31)
  {
    [v30 addSubview:v31];

    v32 = sub_1000079E0();
    if (v32)
    {
      id v33 = v32;
      id v34 = [v16 floatingView];
      sub_100002828(v34);

      return;
    }
    goto LABEL_18;
  }
LABEL_17:
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
}

char *sub_100004A68(uint64_t a1)
{
  uint64_t v62 = a1;
  uint64_t v2 = sub_100002B10((uint64_t *)&unk_100022F60);
  __chkstk_darwin(v2);
  unint64_t v4 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100002B10((uint64_t *)&unk_100023050);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v61 = (uint64_t)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  id v10 = (char *)&v58 - v9;
  __chkstk_darwin(v8);
  unint64_t v12 = (char *)&v58 - v11;
  uint64_t v13 = sub_100015860();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  v60 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v58 - v17;
  uint64_t v19 = v1 + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_configuration;
  swift_beginAccess();
  sub_1000085E4(v19, (uint64_t)v12);
  id v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v20(v12, 1, v13) == 1) {
    return (char *)sub_100008708((uint64_t)v12, (uint64_t *)&unk_100023050);
  }
  uint64_t v58 = v1;
  id v22 = v12;
  CGRect v23 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  v23(v18, v22, v13);
  CGRect v24 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v59 = v18;
  v24(v10, v18, v13);
  uint64_t v25 = v14;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v10, 0, 1, v13);
  uint64_t v26 = (uint64_t)&v4[*(int *)(v2 + 48)];
  sub_1000085E4(v62, (uint64_t)v4);
  sub_1000085E4((uint64_t)v10, v26);
  if (v20(v4, 1, v13) == 1)
  {
    sub_100008708((uint64_t)v10, (uint64_t *)&unk_100023050);
    unsigned int v27 = v20((char *)v26, 1, v13);
    uint64_t v28 = (uint64_t)v59;
    if (v27 == 1)
    {
      sub_100008708((uint64_t)v4, (uint64_t *)&unk_100023050);
      return (char *)(*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v28, v13);
    }
    goto LABEL_8;
  }
  uint64_t v29 = v61;
  sub_1000085E4((uint64_t)v4, v61);
  if (v20((char *)v26, 1, v13) == 1)
  {
    sub_100008708((uint64_t)v10, (uint64_t *)&unk_100023050);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v29, v13);
    uint64_t v28 = (uint64_t)v59;
LABEL_8:
    sub_100008708((uint64_t)v4, (uint64_t *)&unk_100022F60);
    goto LABEL_11;
  }
  id v30 = v60;
  v23(v60, (char *)v26, v13);
  sub_10000880C(&qword_100022F70, (void (*)(uint64_t))&type metadata accessor for AvatarPosterConfiguration);
  char v31 = sub_100015A80();
  v32 = *(void (**)(char *, uint64_t))(v25 + 8);
  v32(v30, v13);
  sub_100008708((uint64_t)v10, (uint64_t *)&unk_100023050);
  v32((char *)v29, v13);
  sub_100008708((uint64_t)v4, (uint64_t *)&unk_100023050);
  uint64_t v28 = (uint64_t)v59;
  if (v31) {
    return (char *)((uint64_t (*)(char *, uint64_t))v32)(v59, v13);
  }
LABEL_11:
  uint64_t v33 = v13;
  if (qword_100022A80 != -1) {
    swift_once();
  }
  uint64_t v34 = sub_100015A00();
  sub_100003BFC(v34, (uint64_t)qword_100022D90);
  v35 = sub_1000159E0();
  os_log_type_t v36 = sub_100015BB0();
  BOOL v37 = os_log_type_enabled(v35, v36);
  uint64_t v38 = v58;
  uint64_t v39 = v25;
  if (v37)
  {
    v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v40 = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, v36, "Configuration changed, updating views", v40, 2u);
    swift_slowDealloc();
  }

  uint64_t v41 = OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer__backgroundViewController;
  unint64_t result = *(char **)(v38 + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer__backgroundViewController);
  if (!result)
  {
    id v42 = [objc_allocWithZone((Class)UIViewController) init];
    v43 = *(void **)(v38 + v41);
    *(void *)(v38 + v41) = v42;

    unint64_t result = *(char **)(v38 + v41);
    if (!result) {
      goto LABEL_29;
    }
  }
  unint64_t result = (char *)[result view];
  if (result)
  {
    v44 = result;
    sub_100008764(0, &qword_100023210);
    v45._rawValue = (void *)sub_100015830();
    Class isa = sub_100015C20(v45).super.isa;
    [v44 setBackgroundColor:isa];

    unint64_t result = (char *)sub_1000079E0();
    if (result)
    {
      uint64_t v47 = *(void *)&result[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_boundingShape];
      uint64_t v48 = *(void *)(v38 + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_persistedBoundingShape);
      uint64_t v49 = v33;
      if (v47 != v48)
      {
        v50 = *(void **)(v38 + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_renderer);
        if (v50)
        {
          id v51 = v50;
          v52 = sub_1000159E0();
          os_log_type_t v53 = sub_100015BB0();
          if (os_log_type_enabled(v52, v53))
          {
            v54 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v54 = 0;
            _os_log_impl((void *)&_mh_execute_header, v52, v53, "Acquiring extended rendering session to prevent host snapshotting during avatar image generation", v54, 2u);
            swift_slowDealloc();
          }

          NSString v55 = sub_100015AB0();
          id v56 = [v51 extendRenderingSessionForReason:v55];

          sub_1000051B4(v56);
          uint64_t v49 = v33;
        }
      }
      unint64_t result = (char *)sub_1000079E0();
      if (result)
      {
        v57 = result;
        sub_100008870(v28, v47 == v48);

        return (char *)(*(uint64_t (**)(uint64_t, uint64_t))(v39 + 8))(v28, v49);
      }
      goto LABEL_28;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void sub_1000051B4(void *a1)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_extendedRenderingSession);
  *(void *)(v1 + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_extendedRenderingSession) = a1;
  id v5 = a1;
  if (v2)
  {
    objc_msgSend(objc_msgSend(v2, "assertion"), "invalidate");
    swift_unknownObjectRelease();
  }
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_delayInvalidationAssertion);
  if (v3)
  {
    id v4 = v3;
    sub_100006F68();

    uint64_t v2 = v5;
    id v5 = v4;
  }
}

void sub_10000526C(void *a1)
{
  uint64_t v63 = sub_100002B10((uint64_t *)&unk_100023050);
  uint64_t v2 = __chkstk_darwin(v63);
  unint64_t v66 = (unint64_t)&v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v59 - v5;
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v59 - v7;
  uint64_t v65 = sub_100015780();
  uint64_t v9 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  v64 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100022A80 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_100015A00();
  uint64_t v12 = sub_100003BFC(v11, (uint64_t)qword_100022D90);
  swift_unknownObjectRetain_n();
  uint64_t v13 = sub_1000159E0();
  os_log_type_t v14 = sub_100015BB0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v61 = v12;
    uint64_t v16 = (uint8_t *)v15;
    v72[0] = (id)swift_slowAlloc();
    uint64_t v60 = v9;
    *(_DWORD *)uint64_t v16 = 136315138;
    uint64_t v62 = v6;
    id v17 = objc_msgSend(a1, "description", v16 + 4);
    uint64_t v18 = sub_100015AC0();
    uint64_t v19 = v8;
    unint64_t v21 = v20;

    *(void *)&v73[0] = sub_10001314C(v18, v21, (uint64_t *)v72);
    id v22 = v62;
    uint64_t v9 = v60;
    sub_100015CA0();
    swift_unknownObjectRelease_n();
    uint64_t v8 = v19;
    uint64_t v6 = v22;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Loading poster configuration from poster environment: %s", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  id v23 = [a1 contents];
  v72[0] = 0;
  id v24 = [v23 loadUserInfoWithError:v72];
  swift_unknownObjectRelease();
  id v25 = v72[0];
  if (v24)
  {
    uint64_t v26 = sub_100015A70();
    id v27 = v25;

    uint64_t v28 = v64;
    uint64_t v29 = v65;
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v64, enum case for AvatarPosterConfiguration.UserInfoKey.dataRepresentation(_:), v65);
    uint64_t v30 = sub_100015770();
    uint64_t v32 = v31;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v28, v29);
    *(void *)&long long v70 = v30;
    *((void *)&v70 + 1) = v32;
    swift_bridgeObjectRetain();
    sub_100015CE0();
    if (*(void *)(v26 + 16) && (unint64_t v33 = sub_100012B00((uint64_t)v72), (v34 & 1) != 0))
    {
      sub_1000087A0(*(void *)(v26 + 56) + 32 * v33, (uint64_t)&v70);
    }
    else
    {
      long long v70 = 0u;
      long long v71 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v71 + 1))
    {
      sub_1000086B4((uint64_t)v72);
      swift_bridgeObjectRelease();
      sub_1000087FC(&v70, v73);
      swift_dynamicCast();
      uint64_t v36 = v68;
      unint64_t v35 = v69;
      sub_1000158C0();
      swift_allocObject();
      sub_1000158B0();
      uint64_t v37 = sub_100015860();
      sub_10000880C((unint64_t *)&unk_1000232F0, (void (*)(uint64_t))&type metadata accessor for AvatarPosterConfiguration);
      sub_1000158A0();
      unint64_t v66 = v35;
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v8, 0, 1, v37);
      uint64_t v48 = (void *)v67;
      uint64_t v49 = v67 + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_configuration;
      swift_beginAccess();
      sub_1000085E4(v49, (uint64_t)v6);
      swift_beginAccess();
      sub_10000864C((uint64_t)v8, v49);
      swift_endAccess();
      sub_100004A68((uint64_t)v6);
      sub_100008708((uint64_t)v8, (uint64_t *)&unk_100023050);
      sub_100008708((uint64_t)v6, (uint64_t *)&unk_100023050);
      id v50 = v48;
      id v51 = sub_1000159E0();
      uint64_t v52 = (uint64_t)v6;
      os_log_type_t v53 = sub_100015BB0();
      if (os_log_type_enabled(v51, v53))
      {
        NSString v55 = (uint8_t *)swift_slowAlloc();
        uint64_t v67 = swift_slowAlloc();
        *(void *)&v73[0] = v67;
        *(_DWORD *)NSString v55 = 136315138;
        uint64_t v65 = (uint64_t)(v55 + 4);
        sub_1000085E4(v49, v52);
        uint64_t v56 = sub_100015C80();
        unint64_t v58 = v57;
        sub_100008708(v52, (uint64_t *)&unk_100023050);
        *(void *)&long long v70 = sub_10001314C(v56, v58, (uint64_t *)v73);
        sub_100015CA0();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v51, v53, "Did load poster configuration: %s", v55, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        swift_release();
      }
      else
      {
        swift_release();
      }
      sub_10000415C(v36, v66);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    id v38 = v72[0];
    sub_100015910();

    swift_willThrow();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v39 = sub_1000159E0();
    os_log_type_t v40 = sub_100015BC0();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      v72[0] = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v41 = 136315138;
      swift_getErrorValue();
      uint64_t v42 = sub_100015E60();
      *(void *)&v73[0] = sub_10001314C(v42, v43, (uint64_t *)v72);
      sub_100015CA0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "Error decoding poster configuration: %s", v41, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    uint64_t v44 = v67;
    uint64_t v45 = v66;
    sub_100004264();
    sub_100015800();
    uint64_t v46 = sub_100015860();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v6, 0, 1, v46);
    uint64_t v47 = v44 + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_configuration;
    swift_beginAccess();
    sub_1000085E4(v47, v45);
    swift_beginAccess();
    sub_10000864C((uint64_t)v6, v47);
    swift_endAccess();
    sub_100004A68(v45);
    sub_100008708((uint64_t)v6, (uint64_t *)&unk_100023050);
    sub_100008708(v45, (uint64_t *)&unk_100023050);
    swift_errorRelease();
  }
}

void sub_100005CC8(void *a1)
{
  uint64_t v2 = v1;
  if (qword_100022A80 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100015A00();
  sub_100003BFC(v4, (uint64_t)qword_100022D90);
  swift_unknownObjectRetain_n();
  uint64_t v5 = sub_1000159E0();
  os_log_type_t v6 = sub_100015BB0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    v31[0] = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    id v8 = [a1 description];
    uint64_t v9 = sub_100015AC0();
    uint64_t v29 = v2;
    unint64_t v11 = v10;

    *(void *)&long long v32 = sub_10001314C(v9, v11, (uint64_t *)v31);
    sub_100015CA0();
    swift_unknownObjectRelease_n();
    uint64_t v2 = v29;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Loading bounding shape from poster environment: %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  id v12 = [a1 contents];
  v31[0] = 0;
  id v13 = [v12 loadUserInfoWithError:v31];
  swift_unknownObjectRelease();
  id v14 = v31[0];
  if (v13)
  {
    uint64_t v15 = sub_100015A70();
    id v16 = v14;

    strcpy((char *)v30, "boundingShape");
    HIWORD(v30[1]) = -4864;
    sub_100015CE0();
    if (*(void *)(v15 + 16) && (unint64_t v17 = sub_100012B00((uint64_t)v31), (v18 & 1) != 0))
    {
      sub_1000087A0(*(void *)(v15 + 56) + 32 * v17, (uint64_t)&v32);
    }
    else
    {
      long long v32 = 0u;
      long long v33 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_1000086B4((uint64_t)v31);
    if (!*((void *)&v33 + 1))
    {
      sub_100008708((uint64_t)&v32, &qword_100022F78);
      return;
    }
    sub_100008764(0, (unint64_t *)&unk_100022F80);
    if ((swift_dynamicCast() & 1) == 0) {
      return;
    }
    uint64_t v19 = v30[0];
    id v20 = [v30[0] integerValue];
    *(void *)(v2 + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_persistedBoundingShape) = v20;
    unint64_t v21 = sub_1000159E0();
    os_log_type_t v22 = sub_100015BB0();
    if (os_log_type_enabled(v21, v22))
    {
      id v23 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v23 = 134217984;
      v31[0] = v20;
      sub_100015CA0();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Did load persistedBoundingShape: %ld", v23, 0xCu);
      swift_slowDealloc();

      return;
    }
  }
  else
  {
    id v24 = v31[0];
    sub_100015910();

    swift_willThrow();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v19 = sub_1000159E0();
    os_log_type_t v25 = sub_100015BC0();
    if (os_log_type_enabled(v19, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      v31[0] = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 136315138;
      swift_getErrorValue();
      uint64_t v27 = sub_100015E60();
      *(void *)&long long v32 = sub_10001314C(v27, v28, (uint64_t *)v31);
      sub_100015CA0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v19, v25, "Error decoding bounding shape: %s", v26, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return;
    }
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
}

id sub_100006268()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_extendedRenderingSession];
  *(void *)&v0[OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_extendedRenderingSession] = 0;

  v4.receiver = v0;
  v4.super_class = ObjectType;
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t sub_1000063BC()
{
  return type metadata accessor for AvatarPosterRenderer();
}

uint64_t type metadata accessor for AvatarPosterRenderer()
{
  uint64_t result = qword_100022E68;
  if (!qword_100022E68) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_100006410()
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v0[OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_renderer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer__backgroundViewController] = 0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_configuration];
  uint64_t v3 = v0;
  sub_100004264();
  sub_100015800();
  uint64_t v4 = sub_100015860();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v2, 0, 1, v4);
  *(void *)&v3[OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_persistedBoundingShape] = -1;
  *(void *)&v3[OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer__avatarRecordRenderView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_extendedRenderingSession] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_delayInvalidationAssertion] = 0;

  v6.receiver = v3;
  v6.super_class = ObjectType;
  return objc_msgSendSuper2(&v6, "init");
}

void sub_10000654C()
{
  sub_1000065FC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1000065FC()
{
  if (!qword_100023020)
  {
    sub_100015860();
    unint64_t v0 = sub_100015C90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100023020);
    }
  }
}

char *sub_100006654(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_100002B10(&qword_100022F20);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v2[OBJC_IVAR____TtC21AvatarPosterExtensionP33_C771079E74C2E9E4099184D8AE9CA0AA26DelayInvalidationAssertion_fallbackInvalidationTask] = 0;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  sub_100002B10(&qword_100022F28);
  uint64_t v9 = swift_allocObject();
  *(_DWORD *)(v9 + 32) = 0;
  *(void *)(v9 + 16) = sub_10000839C;
  *(void *)(v9 + 24) = v8;
  *(void *)&v2[OBJC_IVAR____TtC21AvatarPosterExtensionP33_C771079E74C2E9E4099184D8AE9CA0AA26DelayInvalidationAssertion_lock_invalidationHandler] = v9;
  unint64_t v10 = (objc_class *)type metadata accessor for DelayInvalidationAssertion();
  v19.receiver = v2;
  v19.super_class = v10;
  swift_retain();
  id v11 = objc_msgSendSuper2(&v19, "init");
  uint64_t v12 = sub_100015B80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_100015B60();
  id v14 = (char *)v11;
  swift_retain();
  uint64_t v15 = sub_100015B50();
  id v16 = (void *)swift_allocObject();
  v16[2] = v15;
  v16[3] = &protocol witness table for MainActor;
  v16[4] = v13;
  swift_release();
  uint64_t v17 = sub_100006DE0((uint64_t)v7, (uint64_t)&unk_100022F38, (uint64_t)v16);

  swift_release();
  *(void *)&v14[OBJC_IVAR____TtC21AvatarPosterExtensionP33_C771079E74C2E9E4099184D8AE9CA0AA26DelayInvalidationAssertion_fallbackInvalidationTask] = v17;
  swift_release();
  return v14;
}

uint64_t sub_100006870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a4;
  uint64_t v5 = sub_100015DA0();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  sub_100015B60();
  v4[9] = sub_100015B50();
  uint64_t v7 = sub_100015B40();
  v4[10] = v7;
  v4[11] = v6;
  return _swift_task_switch(sub_100006964, v7, v6);
}

uint64_t sub_100006964()
{
  sub_100015D90();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_100022F40 + dword_100022F40);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v1;
  void *v1 = v0;
  v1[1] = sub_100006A2C;
  return v3(5000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_100006A2C()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[7] + 8))(v2[8], v2[6]);
  uint64_t v3 = v2[11];
  uint64_t v4 = v2[10];
  if (v0) {
    uint64_t v5 = sub_100006D74;
  }
  else {
    uint64_t v5 = sub_100006BB4;
  }
  return _swift_task_switch(v5, v4, v3);
}

void sub_100006BB4()
{
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = (char *)Strong;
    uint64_t v3 = *(void *)(v0 + 104);
    sub_100015CF0(95);
    v9._object = (void *)0x800000010001A2D0;
    v9._countAndFlagsBits = 0xD000000000000023;
    sub_100015AF0(v9);
    *(_DWORD *)(v0 + 112) = 5;
    v10._countAndFlagsBits = sub_100015E10();
    sub_100015AF0(v10);
    swift_bridgeObjectRelease();
    v11._countAndFlagsBits = 0xD00000000000003ALL;
    v11._object = (void *)0x800000010001A300;
    sub_100015AF0(v11);
    uint64_t v4 = *(os_unfair_lock_s **)&v2[OBJC_IVAR____TtC21AvatarPosterExtensionP33_C771079E74C2E9E4099184D8AE9CA0AA26DelayInvalidationAssertion_lock_invalidationHandler];
    uint64_t v5 = swift_task_alloc();
    *(void *)(v5 + 16) = 0;
    *(void *)(v5 + 24) = 0xE000000000000000;
    uint64_t v6 = (uint64_t)&v4[4];
    v4 += 8;
    os_unfair_lock_lock(v4);
    sub_100008858(v6);
    os_unfair_lock_unlock(v4);
    if (v3) {
      return;
    }
    swift_bridgeObjectRelease();

    swift_task_dealloc();
  }
  swift_task_dealloc();
  uint64_t v7 = *(void (**)(void))(v0 + 8);
  v7();
}

uint64_t sub_100006D74()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100006DE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100015B80();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_100015B70();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_100008708(a1, &qword_100022F20);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100015B40();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_100006F68()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  sub_100015CF0(18);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v3 = NSStringFromClass(ObjCClassFromMetadata);
  sub_100015AC0();
  swift_bridgeObjectRelease();

  v9._object = (void *)0x800000010001A240;
  v9._countAndFlagsBits = 0xD000000000000010;
  sub_100015AF0(v9);
  uint64_t v4 = *(os_unfair_lock_s **)(v0
                            + OBJC_IVAR____TtC21AvatarPosterExtensionP33_C771079E74C2E9E4099184D8AE9CA0AA26DelayInvalidationAssertion_lock_invalidationHandler);
  uint64_t v5 = (uint64_t)&v4[4];
  uint64_t v6 = v4 + 8;
  os_unfair_lock_lock(v4 + 8);
  sub_100007484(v5);
  os_unfair_lock_unlock(v6);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v0
                 + OBJC_IVAR____TtC21AvatarPosterExtensionP33_C771079E74C2E9E4099184D8AE9CA0AA26DelayInvalidationAssertion_fallbackInvalidationTask);
  *(void *)(v1
            + OBJC_IVAR____TtC21AvatarPosterExtensionP33_C771079E74C2E9E4099184D8AE9CA0AA26DelayInvalidationAssertion_fallbackInvalidationTask) = 0;
  if (v8)
  {
    sub_100002B10(&qword_100022F18);
    sub_100015B90();
    return swift_release();
  }
  return result;
}

void sub_1000070EC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = *(void (**)(uint64_t))a1;
  if (*(void *)a1)
  {
    uint64_t v7 = qword_100022A80;
    swift_retain();
    if (v7 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_100015A00();
    sub_100003BFC(v8, (uint64_t)qword_100022D90);
    swift_bridgeObjectRetain_n();
    Swift::String v9 = sub_1000159E0();
    os_log_type_t v10 = sub_100015BD0();
    if (os_log_type_enabled(v9, v10))
    {
      Swift::String v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)Swift::String v11 = 136446210;
      swift_bridgeObjectRetain();
      sub_10001314C(a2, a3, &v17);
      sub_100015CA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "[DelayInvalidationAssertion] calling invalidationHandler for reason: %{public}s.", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v12 = swift_bridgeObjectRelease_n();
    }
    v4(v12);
    sub_1000074A0((uint64_t)v4);
    sub_1000074A0((uint64_t)v4);
  }
  else
  {
    if (qword_100022A80 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_100015A00();
    sub_100003BFC(v13, (uint64_t)qword_100022D90);
    id v14 = sub_1000159E0();
    os_log_type_t v15 = sub_100015BD0();
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "[DelayInvalidationAssertion] invalidationHandler was nil.", v16, 2u);
      swift_slowDealloc();
    }
  }
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
}

id sub_1000073DC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DelayInvalidationAssertion();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DelayInvalidationAssertion()
{
  return self;
}

void sub_100007484(uint64_t a1)
{
  sub_1000070EC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1000074A0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1000074B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_100015D80();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return _swift_task_switch(sub_1000075B4, 0, 0);
}

uint64_t sub_1000075B4()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_100015DA0();
  uint64_t v5 = sub_10000880C(&qword_100022F48, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
  sub_100015E40();
  sub_10000880C((unint64_t *)&unk_100022F50, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
  sub_100015DB0();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_100007754;
  uint64_t v8 = v0[11];
  return dispatch thunk of Clock.sleep(until:tolerance:)(v8, v0 + 2, v4, v5);
}

uint64_t sub_100007754()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    return _swift_task_switch(sub_100007910, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_100007910()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t *sub_10000797C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void *sub_1000079E0()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer__avatarRecordRenderView;
  uint64_t result = *(void **)&v1[OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer__avatarRecordRenderView];
  if (!result)
  {
    uint64_t v5 = OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_renderer;
    uint64_t v6 = *(void **)&v1[OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_renderer];
    if (v6)
    {
      id v7 = [v6 floatingView];
      [v7 bounds];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;

      id v16 = *(void **)&v1[v5];
      if (v16)
      {
        uint64_t v17 = (uint64_t)objc_msgSend(objc_msgSend(v16, "environment"), "boundingShape");
        swift_unknownObjectRelease();
      }
      else
      {
        uint64_t v17 = -1;
      }
    }
    else
    {
      uint64_t v17 = -1;
      double v11 = 0.0;
      double v9 = 0.0;
      double v15 = 0.0;
      double v13 = 0.0;
    }
    v22[3] = ObjectType;
    v22[4] = &off_10001CD80;
    v22[0] = v1;
    id v18 = objc_allocWithZone((Class)type metadata accessor for AvatarRecordRenderView());
    objc_super v19 = v1;
    id v20 = sub_10000A920(v17, (uint64_t)v22, v9, v11, v13, v15);
    unint64_t v21 = *(void **)&v1[v3];
    *(void *)&v1[v3] = v20;

    uint64_t result = *(void **)&v1[v3];
    if (!result
      || ([result setTranslatesAutoresizingMaskIntoConstraints:0], (uint64_t result = *(void **)&v1[v3]) == 0))
    {
      __break(1u);
    }
  }
  return result;
}

void sub_100007B54(void *a1)
{
  if (qword_100022A80 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100015A00();
  sub_100003BFC(v2, (uint64_t)qword_100022D90);
  swift_unknownObjectRetain_n();
  uint64_t v3 = sub_1000159E0();
  os_log_type_t v4 = sub_100015BB0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    id v6 = [a1 description];
    uint64_t v7 = sub_100015AC0();
    unint64_t v9 = v8;

    sub_10001314C(v7, v9, &v10);
    sub_100015CA0();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Updating renderer with poster environment: %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  sub_10000526C(a1);
  sub_100005CC8(a1);
}

uint64_t sub_100007D4C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100002B10((uint64_t *)&unk_100023050);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = &v18[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v3);
  uint64_t v7 = &v18[-v6];
  if (qword_100022A80 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100015A00();
  sub_100003BFC(v8, (uint64_t)qword_100022D90);
  unint64_t v9 = sub_1000159E0();
  os_log_type_t v10 = sub_100015BB0();
  if (os_log_type_enabled(v9, v10))
  {
    double v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Invalidating renderer", v11, 2u);
    swift_slowDealloc();
  }

  double v12 = *(void **)(v1 + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_renderer);
  *(void *)(v1 + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_renderer) = 0;

  double v13 = *(void **)(v1 + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer__backgroundViewController);
  *(void *)(v1 + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer__backgroundViewController) = 0;

  double v14 = *(void **)(v1 + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer__avatarRecordRenderView);
  *(void *)(v1 + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer__avatarRecordRenderView) = 0;

  uint64_t v15 = sub_100015860();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v7, 1, 1, v15);
  uint64_t v16 = v1 + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_configuration;
  swift_beginAccess();
  sub_1000085E4(v16, (uint64_t)v5);
  swift_beginAccess();
  sub_10000864C((uint64_t)v7, v16);
  swift_endAccess();
  sub_100004A68((uint64_t)v5);
  sub_100008708((uint64_t)v7, (uint64_t *)&unk_100023050);
  return sub_100008708((uint64_t)v5, (uint64_t *)&unk_100023050);
}

void sub_100007F9C(void *a1, char *a2, void (**a3)(void))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a2;
  v7[3] = a1;
  v7[4] = sub_1000082CC;
  v7[5] = v6;
  uint64_t v8 = *(void *)&a2[OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_extendedRenderingSession];
  _Block_copy(a3);
  uint64_t v9 = qword_100022A80;
  swift_retain();
  id v10 = a1;
  double v11 = a2;
  if (v8)
  {
    if (v9 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_100015A00();
    sub_100003BFC(v12, (uint64_t)qword_100022D90);
    double v13 = sub_1000159E0();
    os_log_type_t v14 = sub_100015BB0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Delaying invalidation of renderer (withCompletion)", v15, 2u);
      swift_slowDealloc();
    }

    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = sub_100008324;
    *(void *)(v16 + 24) = v7;
    id v17 = objc_allocWithZone((Class)type metadata accessor for DelayInvalidationAssertion());
    id v18 = sub_100006654((uint64_t)sub_10000839C, v16);
    id v23 = *(id *)&v11[OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_delayInvalidationAssertion];
    *(void *)&v11[OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_delayInvalidationAssertion] = v18;
    swift_release();
  }
  else
  {
    if (v9 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_100015A00();
    sub_100003BFC(v19, (uint64_t)qword_100022D90);
    id v20 = sub_1000159E0();
    os_log_type_t v21 = sub_100015BB0();
    if (os_log_type_enabled(v20, v21))
    {
      os_log_type_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Invalidating renderer (withCompletion)", v22, 2u);
      swift_slowDealloc();
    }

    sub_100007D4C();
    a3[2](a3);
    swift_release();
    swift_release();
  }
}

uint64_t sub_100008294()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000082CC()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1000082DC()
{
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100008324()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 32);
  uint64_t v2 = sub_100007D4C();
  return v1(v2);
}

uint64_t sub_100008364()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000839C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000083C4()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000083FC()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000843C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1000084F0;
  return sub_100006870(a1, v4, v5, v6);
}

uint64_t sub_1000084F0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000085E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002B10((uint64_t *)&unk_100023050);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000864C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002B10((uint64_t *)&unk_100023050);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000086B4(uint64_t a1)
{
  return a1;
}

uint64_t sub_100008708(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100002B10(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100008764(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1000087A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_1000087FC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000880C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_100008858(uint64_t a1)
{
}

uint64_t sub_100008870(uint64_t a1, int a2)
{
  LODWORD(v131) = a2;
  sub_100002B10(&qword_100022F20);
  ((void (*)(void))__chkstk_darwin)();
  v128 = &v122[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_1000157A0();
  v132 = *(void **)(v5 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v7 = &v122[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v135 = sub_100015860();
  uint64_t v8 = *(void **)(v135 - 8);
  uint64_t v9 = v8[8];
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  v127 = &v122[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = __chkstk_darwin(v10);
  v129 = &v122[-v12];
  uint64_t v13 = __chkstk_darwin(v11);
  v137 = &v122[-v14];
  uint64_t v15 = __chkstk_darwin(v13);
  v136 = &v122[-v16];
  __chkstk_darwin(v15);
  id v18 = &v122[-v17];
  uint64_t v133 = v2;
  uint64_t v126 = v2 + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_logger;
  uint64_t v19 = sub_1000159E0();
  os_log_type_t v20 = sub_100015BB0();
  if (os_log_type_enabled(v19, v20))
  {
    os_log_type_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Rendering avatar in render view", v21, 2u);
    swift_slowDealloc();
  }

  uint64_t v134 = swift_allocObject();
  swift_unknownObjectWeakInit();
  os_log_type_t v22 = (void (*)(unsigned char *, uint64_t, uint64_t))v8[2];
  id v23 = v18;
  uint64_t v24 = a1;
  uint64_t v25 = a1;
  uint64_t v26 = v18;
  uint64_t v27 = v135;
  v22(v23, v24, v135);
  v22(v136, v25, v27);
  swift_unknownObjectWeakInit();
  v130 = v22;
  v22(v137, v25, v27);
  uint64_t v28 = v25;
  sub_1000157B0();
  uint64_t v29 = v132;
  int v30 = ((uint64_t (*)(unsigned char *, uint64_t))v132[11])(v7, v5);
  if (v30 == enum case for AvatarPosterConfiguration.RenderingMode.image(_:))
  {
    long long v33 = (void (*)(unsigned char *, uint64_t))v8[1];
    uint64_t v31 = v8 + 1;
    long long v32 = v33;
    v33(v26, v27);
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      unint64_t v35 = (unsigned char *)Strong;
      v132 = v31;
      uint64_t v36 = sub_1000157E0();
      if (v37 >> 60 != 15)
      {
        uint64_t v48 = v36;
        unint64_t v49 = v37;
        sub_100009758();
        id v50 = sub_1000159E0();
        os_log_type_t v51 = sub_100015BB0();
        if (os_log_type_enabled(v50, v51))
        {
          uint64_t v52 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v52 = 0;
          _os_log_impl((void *)&_mh_execute_header, v50, v51, "Rendering image data from configuration", v52, 2u);
          uint64_t v27 = v135;
          swift_slowDealloc();
        }

        id v53 = objc_allocWithZone((Class)UIImage);
        sub_10000C56C(v48, v49);
        Class isa = sub_100015920().super.isa;
        id v55 = [v53 initWithData:isa];
        sub_100004148(v48, v49);

        uint64_t v56 = *(void **)&v35[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_avatarImage];
        *(void *)&v35[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_avatarImage] = v55;
        id v57 = v55;

        unint64_t v58 = sub_1000159E0();
        os_log_type_t v59 = sub_100015BB0();
        if (os_log_type_enabled(v58, v59))
        {
          uint64_t v60 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v60 = 0;
          _os_log_impl((void *)&_mh_execute_header, v58, v59, "Setting avatar record render view image, updating filters, and triggering new layout pass", v60, 2u);
          uint64_t v27 = v135;
          swift_slowDealloc();
        }

        v35[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_shouldUpdateLayerFilters] = 1;
        [v35 setNeedsLayout];

        sub_100004148(v48, v49);
        swift_release();

        v32(v136, v27);
        v32(v137, v27);
        return swift_unknownObjectWeakDestroy();
      }
      swift_release();
    }
    else
    {
      swift_release();
    }
    v32(v136, v27);
    v32(v137, v27);
    return swift_unknownObjectWeakDestroy();
  }
  v125 = v26;
  uint64_t v39 = v8 + 1;
  id v38 = (void (*)(unsigned char *, uint64_t))v8[1];
  if (v30 != enum case for AvatarPosterConfiguration.RenderingMode.memojiRecipe(_:))
  {
    uint64_t v46 = v135;
    v38(v136, v135);
    swift_release();
    v38(v137, v46);
    swift_unknownObjectWeakDestroy();
    v38(v125, v46);
    return ((uint64_t (*)(unsigned char *, uint64_t))v29[1])(v7, v5);
  }
  v132 = v8;
  if (v131)
  {
    uint64_t v40 = v135;
    v38(v125, v135);
    swift_beginAccess();
    uint64_t v41 = swift_unknownObjectWeakLoadStrong();
    if (v41)
    {
      uint64_t v42 = (unsigned char *)v41;
      unint64_t v43 = v38;
      uint64_t v44 = sub_1000157E0();
      if (v45 >> 60 != 15)
      {
        uint64_t v89 = v44;
        unint64_t v90 = v45;
        sub_100009758();
        v91 = sub_1000159E0();
        os_log_type_t v92 = sub_100015BB0();
        if (os_log_type_enabled(v91, v92))
        {
          v93 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v93 = 0;
          _os_log_impl((void *)&_mh_execute_header, v91, v92, "Rendering image data from configuration", v93, 2u);
          uint64_t v40 = v135;
          swift_slowDealloc();
        }

        id v94 = objc_allocWithZone((Class)UIImage);
        sub_10000C56C(v89, v90);
        Class v95 = sub_100015920().super.isa;
        id v96 = [v94 initWithData:v95];
        sub_100004148(v89, v90);

        v97 = *(void **)&v42[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_avatarImage];
        *(void *)&v42[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_avatarImage] = v96;
        id v98 = v96;

        v99 = sub_1000159E0();
        os_log_type_t v100 = sub_100015BB0();
        if (os_log_type_enabled(v99, v100))
        {
          v101 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v101 = 0;
          _os_log_impl((void *)&_mh_execute_header, v99, v100, "Setting avatar record render view image, updating filters, and triggering new layout pass", v101, 2u);
          uint64_t v40 = v135;
          swift_slowDealloc();
        }

        v42[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_shouldUpdateLayerFilters] = 1;
        [v42 setNeedsLayout];

        sub_100004148(v89, v90);
        swift_release();

        v43(v136, v40);
        v43(v137, v40);
        return swift_unknownObjectWeakDestroy();
      }
      swift_release();

      v38(v136, v40);
    }
    else
    {
      swift_release();
      v38(v136, v40);
    }
    v38(v137, v40);
    return swift_unknownObjectWeakDestroy();
  }
  uint64_t v61 = v135;
  v38(v137, v135);
  uint64_t v62 = v28;
  uint64_t v63 = sub_100015760();
  if (!v63)
  {
    v38(v136, v61);
    swift_release();
    swift_unknownObjectWeakDestroy();
    return ((uint64_t (*)(unsigned char *, uint64_t))v38)(v125, v61);
  }
  uint64_t v64 = v63;
  v137 = v38;
  uint64_t v65 = *(void *)(v133 + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_currentAvatarRecord);
  v124 = v39;
  if (!v65)
  {
    v78 = v129;
    v130(v129, v62, v61);
    goto LABEL_38;
  }
  unint64_t v66 = self;
  swift_unknownObjectRetain_n();
  swift_unknownObjectRetain();
  id v67 = [v66 avatarForRecord:v64];
  id v68 = [v67 dataRepresentation];

  uint64_t v69 = sub_100015930();
  uint64_t v131 = v62;
  unint64_t v71 = v70;

  id v72 = [v66 avatarForRecord:v65];
  id v73 = [v72 dataRepresentation];

  uint64_t v74 = sub_100015930();
  unint64_t v76 = v75;

  LOBYTE(v73) = sub_100013AD4(v69, v71, v74, v76);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_10000415C(v74, v76);
  unint64_t v77 = v71;
  uint64_t v62 = v131;
  sub_10000415C(v69, v77);
  swift_unknownObjectRelease();
  v78 = v129;
  v130(v129, v62, v61);
  if ((v73 & 1) == 0)
  {
LABEL_38:
    ((void (*)(unsigned char *, uint64_t))v137)(v78, v61);
    uint64_t v86 = v61;
    v88 = v125;
    goto LABEL_39;
  }
  uint64_t v79 = sub_1000157C0();
  uint64_t v81 = v79;
  unint64_t v82 = v80;
  uint64_t v83 = v133 + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_lastPoseData;
  uint64_t v85 = *(void *)(v133 + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_lastPoseData);
  unint64_t v84 = *(void *)(v133 + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_lastPoseData + 8);
  if (v80 >> 60 == 15)
  {
    if (v84 >> 60 == 15)
    {
      *(void *)uint64_t v83 = v79;
      *(void *)(v83 + 8) = v80;
      sub_100004148(v85, v84);
      uint64_t v86 = v135;
      v87 = (void (*)(unsigned char *, uint64_t))v137;
      ((void (*)(unsigned char *, uint64_t))v137)(v78, v135);
      v88 = v125;
LABEL_45:
      v87(v136, v86);
      swift_release();
      swift_unknownObjectRelease();
      swift_unknownObjectWeakDestroy();
      return ((uint64_t (*)(unsigned char *, uint64_t))v87)(v88, v86);
    }
    goto LABEL_37;
  }
  if (v84 >> 60 == 15)
  {
LABEL_37:
    sub_10000C558(*(void *)v83, *(void *)(v83 + 8));
    sub_10000C558(v81, v82);
    sub_100004148(v81, v82);
    sub_100004148(v85, v84);
    uint64_t v102 = *(void *)v83;
    unint64_t v103 = *(void *)(v83 + 8);
    *(void *)uint64_t v83 = v81;
    *(void *)(v83 + 8) = v82;
    sub_100004148(v102, v103);
    uint64_t v61 = v135;
    goto LABEL_38;
  }
  sub_10000C558(*(void *)v83, *(void *)(v83 + 8));
  sub_10000C558(v81, v82);
  int v123 = sub_100013AD4(v81, v82, v85, v84);
  sub_100004148(v85, v84);
  sub_100004148(v81, v82);
  uint64_t v120 = *(void *)v83;
  unint64_t v121 = *(void *)(v83 + 8);
  *(void *)uint64_t v83 = v81;
  *(void *)(v83 + 8) = v82;
  sub_100004148(v120, v121);
  uint64_t v86 = v135;
  v87 = (void (*)(unsigned char *, uint64_t))v137;
  ((void (*)(unsigned char *, uint64_t))v137)(v78, v135);
  v88 = v125;
  if (v123) {
    goto LABEL_45;
  }
LABEL_39:
  v104 = sub_1000159E0();
  os_log_type_t v105 = sub_100015BB0();
  if (os_log_type_enabled(v104, v105))
  {
    v106 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v106 = 0;
    _os_log_impl((void *)&_mh_execute_header, v104, v105, "Canceling any ongoing avatar sticker generation task, before stating a new one", v106, 2u);
    swift_slowDealloc();
  }
  uint64_t v135 = v64;

  sub_100009758();
  uint64_t v107 = v86;
  ((void (*)(unsigned char *, uint64_t))v137)(v88, v86);
  uint64_t v131 = OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_imageGenerationTask;
  if (*(void *)(v133 + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_imageGenerationTask))
  {
    swift_retain();
    sub_100015B90();
    swift_release();
  }
  uint64_t v108 = sub_100015B80();
  uint64_t v109 = (uint64_t)v128;
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v108 - 8) + 56))(v128, 1, 1, v108);
  uint64_t v110 = swift_allocObject();
  uint64_t v111 = v133;
  swift_unknownObjectWeakInit();
  v112 = v127;
  uint64_t v113 = v62;
  uint64_t v114 = v107;
  v130(v127, v113, v107);
  sub_100015B60();
  swift_retain();
  uint64_t v115 = sub_100015B50();
  v116 = v132;
  unint64_t v117 = (*((unsigned __int8 *)v132 + 80) + 40) & ~(unint64_t)*((unsigned __int8 *)v132 + 80);
  v118 = (char *)swift_allocObject();
  *((void *)v118 + 2) = v115;
  *((void *)v118 + 3) = &protocol witness table for MainActor;
  *((void *)v118 + 4) = v110;
  ((void (*)(char *, unsigned char *, uint64_t))v116[4])(&v118[v117], v112, v114);
  swift_release();
  uint64_t v119 = sub_10000A4C0(v109, (uint64_t)&unk_100023038, (uint64_t)v118);
  swift_release();
  ((void (*)(unsigned char *, uint64_t))v137)(v136, v114);
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();
  *(void *)(v111 + v131) = v119;
  return swift_release();
}

void sub_100009758()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (char *)Strong;
    *(void *)(Strong + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_currentAvatarRecord) = sub_100015760();
    swift_unknownObjectRelease();
    uint64_t v2 = sub_1000157C0();
    uint64_t v3 = (uint64_t *)&v1[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_lastPoseData];
    uint64_t v4 = *(void *)&v1[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_lastPoseData];
    unint64_t v5 = *(void *)&v1[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_lastPoseData + 8];
    uint64_t *v3 = v2;
    v3[1] = v6;
    sub_100004148(v4, v5);
  }
}

uint64_t sub_1000097EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[10] = a4;
  v5[11] = a5;
  sub_100002B10((uint64_t *)&unk_100023050);
  v5[12] = swift_task_alloc();
  sub_100015B60();
  v5[13] = sub_100015B50();
  uint64_t v7 = sub_100015B40();
  v5[14] = v7;
  v5[15] = v6;
  return _swift_task_switch(sub_1000098B4, v7, v6);
}

uint64_t sub_1000098B4()
{
  uint64_t v31 = v0;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  v0[16] = Strong;
  if (Strong)
  {
    uint64_t v2 = (char *)Strong;
    *(double *)&uint64_t v3 = COERCE_DOUBLE(sub_10000A2E4());
    if ((v5 & 1) == 0)
    {
      double v6 = *(double *)&v3;
      double v7 = v4;
      v0[17] = OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_logger;
      uint64_t v8 = sub_1000159E0();
      os_log_type_t v9 = sub_100015BB0();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = (uint8_t *)swift_slowAlloc();
        uint64_t v30 = swift_slowAlloc();
        *(_DWORD *)uint64_t v10 = 136315138;
        uint64_t v11 = sub_100015C10();
        v0[9] = sub_10001314C(v11, v12, &v30);
        sub_100015CA0();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Generating avatar sticker image with requested size: %s", v10, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      id v13 = sub_10000A460();
      [v13 setHidden:1];

      double v14 = *(double *)&v2[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_constants + 8];
      uint64_t v29 = (uint64_t (*)(uint64_t, double, double, double))((char *)&dword_100022CF0 + dword_100022CF0);
      uint64_t v15 = (void *)swift_task_alloc();
      v0[18] = v15;
      *uint64_t v15 = v0;
      v15[1] = sub_100009CE8;
      uint64_t v16 = v0[11];
      return v29(v16, v6, v7, v14);
    }
    swift_release();
    id v18 = sub_1000159E0();
    os_log_type_t v19 = sub_100015BB0();
    if (os_log_type_enabled(v18, v19))
    {
      os_log_type_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Trying to generate sticker while containing view has empty size, postponing sticker generation", v20, 2u);
      swift_slowDealloc();
    }
    uint64_t v22 = v0[11];
    uint64_t v21 = v0[12];

    uint64_t v23 = sub_100015860();
    uint64_t v24 = *(void *)(v23 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v21, v22, v23);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
    uint64_t v25 = (uint64_t)&v2[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_postponedRenderingConfiguration];
    swift_beginAccess();
    sub_10000CA58(v21, v25);
    swift_endAccess();
    *(void *)&v2[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_currentAvatarRecord] = 0;
    swift_unknownObjectRelease();
    uint64_t v26 = *(void *)&v2[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_lastPoseData];
    unint64_t v27 = *(void *)&v2[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_lastPoseData + 8];
    *(_OWORD *)&v2[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_lastPoseData] = xmmword_100016D40;
    sub_100004148(v26, v27);
  }
  else
  {
    swift_release();
  }
  swift_task_dealloc();
  uint64_t v28 = (uint64_t (*)(void))v0[1];
  return v28();
}

uint64_t sub_100009CE8(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 152) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 120);
  uint64_t v4 = *(void *)(v2 + 112);
  return _swift_task_switch(sub_100009E10, v4, v3);
}

uint64_t sub_100009E10()
{
  uint64_t v41 = v0;
  uint64_t v1 = *(void *)(v0 + 152);
  swift_release();
  if (v1)
  {
    id v2 = *(id *)(v0 + 152);
    uint64_t v3 = sub_1000159E0();
    os_log_type_t v4 = sub_100015BB0();
    if (os_log_type_enabled(v3, v4))
    {
      char v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      *(_DWORD *)char v5 = 136315138;
      objc_msgSend(v2, "size", v40);
      uint64_t v6 = sub_100015C10();
      *(void *)(v0 + 64) = sub_10001314C(v6, v7, &v40);
      sub_100015CA0();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Finished generating avatar sticker image with size: %s", v5, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v28 = *(void *)(v0 + 128);
    uint64_t v29 = *(void **)(v28 + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_avatarImage);
    *(void *)(v28 + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_avatarImage) = *(void *)(v0 + 152);
    id v30 = v2;

    uint64_t v31 = sub_1000159E0();
    os_log_type_t v32 = sub_100015BB0();
    if (os_log_type_enabled(v31, v32))
    {
      long long v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Setting avatar record render view image, updating filters, and triggering new layout pass", v33, 2u);
      swift_slowDealloc();
    }
    char v34 = *(unsigned char **)(v0 + 128);

    v34[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_shouldUpdateLayerFilters] = 1;
    [v34 setNeedsLayout];
  }
  else
  {
    uint64_t v8 = sub_1000159E0();
    os_log_type_t v9 = sub_100015BC0();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Sticker generator returned no image, attempting to fallback to the avatarImageData", v10, 2u);
      swift_slowDealloc();
    }

    uint64_t v11 = sub_1000157E0();
    if (v12 >> 60 != 15)
    {
      uint64_t v13 = v11;
      unint64_t v14 = v12;
      uint64_t v15 = sub_1000159E0();
      os_log_type_t v16 = sub_100015BD0();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "Found avatarImageData from configuration, attempting to use it.", v17, 2u);
        swift_slowDealloc();
      }
      uint64_t v18 = *(void *)(v0 + 128);

      id v19 = objc_allocWithZone((Class)UIImage);
      sub_10000C56C(v13, v14);
      Class isa = sub_100015920().super.isa;
      id v21 = [v19 initWithData:isa];
      sub_100004148(v13, v14);

      uint64_t v22 = *(void **)(v18 + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_avatarImage);
      *(void *)(v18 + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_avatarImage) = v21;
      id v23 = v21;

      uint64_t v24 = sub_1000159E0();
      os_log_type_t v25 = sub_100015BB0();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "Setting avatar record render view image, updating filters, and triggering new layout pass", v26, 2u);
        swift_slowDealloc();
      }
      unint64_t v27 = *(unsigned char **)(v0 + 128);

      v27[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_shouldUpdateLayerFilters] = 1;
      [v27 setNeedsLayout];

      sub_100004148(v13, v14);
    }
  }
  unint64_t v35 = *(void **)(v0 + 152);
  uint64_t v36 = *(void **)(v0 + 128);
  id v37 = sub_10000A460();
  [v37 setHidden:0];

  swift_task_dealloc();
  id v38 = *(uint64_t (**)(void))(v0 + 8);
  return v38();
}

uint64_t sub_10000A2E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100015790();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  [v1 bounds];
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  double v10 = CGRectGetWidth(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGRectGetHeight(v19);
  uint64_t v11 = *(void *)&v1[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_boundingShape];
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double v12 = CGRectGetHeight(v20);
  if (v11 != 2)
  {
    sub_100015BE0();
    sub_100015850();
    double v14 = v13;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    double v12 = v12 * v14;
  }
  if (v12 <= 0.0 || v10 <= 0.0) {
    return 0;
  }
  else {
    return *(void *)&v10;
  }
}

id sub_10000A460()
{
  uint64_t v1 = OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView____lazy_storage___avatarImageView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView____lazy_storage___avatarImageView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView____lazy_storage___avatarImageView);
  }
  else
  {
    sub_10000B62C();
    uint64_t v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_10000A4C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100015B80();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100015B70();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100008708(a1, &qword_100022F20);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100015B40();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_10000A66C()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v3 = sub_1000159E0();
  os_log_type_t v4 = sub_100015BB0();
  if (os_log_type_enabled(v3, v4))
  {
    char v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Canceling any ongoing avatar sticker generation task, before tearing down the render view", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_imageGenerationTask;
  if (*(void *)&v1[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_imageGenerationTask])
  {
    swift_retain();
    sub_100015B90();
    swift_release();
  }
  *(void *)&v1[v6] = 0;
  swift_release();
  v8.receiver = v1;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, "dealloc");
}

uint64_t sub_10000A8CC()
{
  return type metadata accessor for AvatarRecordRenderView();
}

uint64_t type metadata accessor for AvatarRecordRenderView()
{
  uint64_t result = qword_100023010;
  if (!qword_100023010) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_10000A920(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v7 = v6;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v15 = &v7[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_postponedRenderingConfiguration];
  uint64_t v16 = sub_100015860();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  *(_OWORD *)&v7[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_lastPoseData] = xmmword_100016D40;
  uint64_t v17 = v7;
  sub_1000159F0();
  *(void *)&v17[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_imageGenerationTask] = 0;
  *(void *)&v17[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_avatarImage] = 0;
  *(void *)&v17[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_currentAvatarRecord] = 0;
  v17[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_shouldUpdateLayerFilters] = 0;
  *(void *)&v17[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView____lazy_storage___avatarImageView] = 0;
  *(void *)&v17[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView____lazy_storage___bodyBlurLayer] = 0;
  *(void *)&v17[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView____lazy_storage___bodyMaskLayer] = 0;
  *(void *)&v17[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_boundingShape] = a1;
  CGRect v18 = &v17[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_constants];
  *(void *)CGRect v18 = a1;
  *(_OWORD *)(v18 + 8) = xmmword_100016D50;
  *(_OWORD *)(v18 + 24) = xmmword_100016D60;
  *(_OWORD *)(v18 + 40) = xmmword_100016D70;
  sub_10000CAC0(a2, (uint64_t)&v17[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_imageViewDelegate], &qword_100022C48);

  v21.receiver = v17;
  v21.super_class = ObjectType;
  id v19 = objc_msgSendSuper2(&v21, "initWithFrame:", a3, a4, a5, a6);
  sub_10000AB38();

  sub_100008708(a2, &qword_100022C48);
  return v19;
}

void sub_10000AB38()
{
  id v1 = [self clearColor];
  [v0 setBackgroundColor:v1];

  id v2 = sub_10000A460();
  [v0 addSubview:v2];

  [v0 frame];
  v60.origin.CGFloat x = 0.0;
  v60.origin.CGFloat y = 0.0;
  v60.size.CGFloat width = 0.0;
  v60.size.CGFloat height = 0.0;
  if (CGRectEqualToRect(v56, v60))
  {
    id v3 = [self mainScreen];
    [v3 bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
  }
  else
  {
    [v0 frame];
    CGFloat v5 = v12;
    CGFloat v7 = v13;
    CGFloat v9 = v14;
    CGFloat v11 = v15;
  }
  v57.origin.CGFloat x = v5;
  v57.origin.CGFloat y = v7;
  v57.size.CGFloat width = v9;
  v57.size.CGFloat height = v11;
  double Height = CGRectGetHeight(v57);
  uint64_t v17 = *(void *)&v0[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_constants];
  double v18 = 0.12;
  if (v17 != 2) {
    double v18 = 0.0;
  }
  double v19 = -(Height * v18);
  id v20 = sub_10000A460();
  id v21 = [v20 bottomAnchor];

  id v22 = [v0 bottomAnchor];
  id v23 = [v21 constraintEqualToAnchor:v22 constant:v19];

  LODWORD(v24) = 1132068864;
  [v23 setPriority:v24];
  [v0 frame];
  v61.origin.CGFloat x = 0.0;
  v61.origin.CGFloat y = 0.0;
  v61.size.CGFloat width = 0.0;
  v61.size.CGFloat height = 0.0;
  if (CGRectEqualToRect(v58, v61))
  {
    id v25 = [self mainScreen];
    [v25 bounds];
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
  }
  else
  {
    [v0 frame];
    CGFloat v27 = v34;
    CGFloat v29 = v35;
    CGFloat v31 = v36;
    CGFloat v33 = v37;
  }
  v59.origin.CGFloat x = v27;
  v59.origin.CGFloat y = v29;
  v59.size.CGFloat width = v31;
  v59.size.CGFloat height = v33;
  double v38 = dbl_100016D80[v17 == 2] * CGRectGetHeight(v59);
  uint64_t v39 = self;
  sub_100002B10(&qword_100022AF0);
  uint64_t v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_100016AB0;
  id v41 = sub_10000A460();
  id v42 = [v41 topAnchor];

  id v43 = [v0 topAnchor];
  id v44 = [v42 constraintEqualToAnchor:v43 constant:v38];

  *(void *)(v40 + 32) = v44;
  *(void *)(v40 + 40) = v23;
  id v45 = v23;
  id v46 = sub_10000A460();
  id v47 = [v46 centerXAnchor];

  id v48 = [v0 centerXAnchor];
  id v49 = [v47 constraintEqualToAnchor:v48];

  *(void *)(v40 + 48) = v49;
  id v50 = sub_10000A460();
  id v51 = [v50 widthAnchor];

  id v52 = [v0 widthAnchor];
  id v53 = [v51 constraintEqualToAnchor:v52];

  *(void *)(v40 + 56) = v53;
  sub_100015B30();
  sub_100008764(0, (unint64_t *)&qword_100022AF8);
  Class isa = sub_100015B10().super.isa;
  swift_bridgeObjectRelease();
  [v39 activateConstraints:isa];
}

void sub_10000AFDC()
{
  id v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_100002B10((uint64_t *)&unk_100023050);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  double v6 = &v48[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  double v8 = &v48[-v7];
  uint64_t v9 = sub_100015860();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  double v12 = &v48[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v49.receiver = v1;
  v49.super_class = ObjectType;
  objc_msgSendSuper2(&v49, "layoutSubviews");
  uint64_t v13 = (uint64_t)&v1[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_postponedRenderingConfiguration];
  swift_beginAccess();
  sub_10000CAC0(v13, (uint64_t)v8, (uint64_t *)&unk_100023050);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_100008708((uint64_t)v8, (uint64_t *)&unk_100023050);
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v12, v8, v9);
    double v14 = sub_1000159E0();
    os_log_type_t v15 = sub_100015BB0();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Trying to render postponed rendering configuration", v16, 2u);
      swift_slowDealloc();
    }

    sub_100008870((uint64_t)v12, 0);
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v6, 1, 1, v9);
    swift_beginAccess();
    sub_10000CA58((uint64_t)v6, v13);
    swift_endAccess();
  }
  if (v1[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_shouldUpdateLayerFilters] == 1)
  {
    v1[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_shouldUpdateLayerFilters] = 0;
    id v17 = sub_10000A460();
    uint64_t v18 = OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_avatarImage;
    id v19 = *(id *)&v1[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_avatarImage];
    [v17 setImage:v19];

    id v20 = *(void **)&v1[v18];
    if (!v20)
    {
LABEL_14:
      id v38 = sub_10000B580(&OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView____lazy_storage___bodyBlurLayer, (uint64_t (*)(uint64_t))sub_10000B888);
      id v39 = [v38 superlayer];

      if (!v39) {
        return;
      }
      id v40 = sub_10000B580(&OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView____lazy_storage___bodyBlurLayer, (uint64_t (*)(uint64_t))sub_10000B888);
      [v40 removeFromSuperlayer];
      goto LABEL_16;
    }
    [v20 size];
    double v22 = v21;
    double v24 = v23;
    double v25 = COERCE_DOUBLE(sub_10000A2E4());
    if ((v27 & 1) != 0
      || v26 / v25 + *(double *)&v1[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_constants + 16] >= v24 / v22
      || (v28 = sub_10000B580(&OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView____lazy_storage___bodyBlurLayer, (uint64_t (*)(uint64_t))sub_10000B888), id v29 = [v28 superlayer], v29, v28, v29))
    {
      double v30 = *(void **)&v1[v18];
      if (!v30) {
        goto LABEL_14;
      }
      [v30 size];
      double v32 = v31;
      double v34 = v33;
      double v35 = COERCE_DOUBLE(sub_10000A2E4());
      if ((v37 & 1) != 0
        || v36 / v35 + *(double *)&v1[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_constants + 16] >= v34 / v32)
      {
        goto LABEL_14;
      }
    }
    else
    {
      id v41 = [v1 layer];
      id v42 = sub_10000B580(&OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView____lazy_storage___bodyBlurLayer, (uint64_t (*)(uint64_t))sub_10000B888);
      [v41 addSublayer:v42];

      id v43 = sub_10000A460();
      id v44 = [v43 layer];

      id v45 = [v44 mask];
      if (!v45)
      {
        id v46 = sub_10000A460();
        id v47 = [v46 layer];

        id v40 = sub_10000B580(&OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView____lazy_storage___bodyMaskLayer, (uint64_t (*)(uint64_t))sub_10000BE90);
        [v47 setMask:v40];

LABEL_16:
      }
    }
  }
}

id sub_10000B580(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    id v5 = *(id *)(v2 + *a1);
  }
  else
  {
    double v6 = (void *)a2(v2);
    uint64_t v7 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v6;
    id v5 = v6;

    uint64_t v4 = 0;
  }
  id v8 = v4;
  return v5;
}

void sub_10000B62C()
{
  sub_10000CAC0(v0 + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_imageViewDelegate, (uint64_t)v20, &qword_100022C48);
  id v1 = (objc_class *)type metadata accessor for AvatarPosterImageView();
  uint64_t v2 = (char *)objc_allocWithZone(v1);
  *(void *)&v2[OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_innerImageView] = 0;
  sub_10000CAC0((uint64_t)v20, (uint64_t)&v2[OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_delegate], &qword_100022C48);
  v19.receiver = v2;
  v19.super_class = v1;
  uint64_t v3 = (char *)objc_msgSendSuper2(&v19, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v18.receiver = v3;
  v18.super_class = v1;
  id v4 = objc_msgSendSuper2(&v18, "image");
  v17.receiver = v3;
  v17.super_class = v1;
  id v5 = objc_msgSendSuper2(&v17, "highlightedImage");
  id v6 = [objc_allocWithZone((Class)UIImageView) initWithImage:v4 highlightedImage:v5];

  uint64_t v7 = OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_innerImageView;
  id v8 = *(void **)&v3[OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_innerImageView];
  *(void *)&v3[OBJC_IVAR____TtC21AvatarPosterExtension21AvatarPosterImageView_innerImageView] = v6;

  uint64_t v9 = *(void **)&v3[v7];
  if (!v9) {
    goto LABEL_6;
  }
  id v10 = v9;
  [v3 bounds];
  objc_msgSend(v10, "setFrame:");

  uint64_t v11 = *(void **)&v3[v7];
  if (!v11) {
    goto LABEL_6;
  }
  [v11 setAutoresizingMask:18];
  double v12 = *(void **)&v3[v7];
  if (v12
    && (id v13 = v12,
        objc_msgSend(v13, "setContentMode:", objc_msgSend(v3, "contentMode")),
        v13,
        *(void *)&v3[v7]))
  {
    objc_msgSend(v3, "addSubview:");
    sub_100008708((uint64_t)v20, &qword_100022C48);
    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v14 = self;
    os_log_type_t v15 = v3;
    id v16 = [v14 clearColor];
    [v15 setBackgroundColor:v16];

    [v15 setContentMode:1];
  }
  else
  {
LABEL_6:
    __break(1u);
  }
}

id sub_10000B888(char *a1)
{
  id v51 = a1;
  uint64_t v49 = sub_100015790();
  uint64_t v47 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v3 = (char *)v46 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [objc_allocWithZone((Class)CAGradientLayer) init];
  [a1 bounds];
  objc_msgSend(v4, "setFrame:");
  uint64_t v50 = sub_100002B10((uint64_t *)&unk_100023060);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100016D90;
  id v6 = self;
  id v7 = [v6 whiteColor];
  double v8 = 0.0;
  id v9 = [v7 colorWithAlphaComponent:0.0];

  id v10 = [v9 CGColor];
  type metadata accessor for CGColor(0);
  uint64_t v12 = v11;
  *(void *)(v5 + 56) = v11;
  *(void *)(v5 + 32) = v10;
  id v13 = [v6 whiteColor];
  id v14 = [v13 colorWithAlphaComponent:0.0];

  id v15 = [v14 CGColor];
  *(void *)(v5 + 88) = v12;
  *(void *)(v5 + 64) = v15;
  id v16 = [v6 whiteColor];
  id v17 = [v16 CGColor];

  *(void *)(v5 + 120) = v12;
  *(void *)(v5 + 96) = v17;
  id v18 = [v6 whiteColor];
  id v19 = [v18 CGColor];

  *(void *)(v5 + 152) = v12;
  *(void *)(v5 + 128) = v19;
  id v48 = (char *)&type metadata for Any + 8;
  Class isa = sub_100015B10().super.isa;
  swift_bridgeObjectRelease();
  [v4 setColors:isa];

  sub_100002B10(&qword_100022AF0);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_100016AB0;
  sub_100008764(0, (unint64_t *)&unk_100022F80);
  *(NSNumber *)(v21 + 32) = sub_100015C40(0.0);
  v46[1] = &v51[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_constants];
  uint64_t v22 = *(void *)&v51[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_constants];
  double v23 = *(double *)&v51[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_constants + 32];
  sub_100015BE0();
  sub_100015850();
  double v25 = v24;
  double v26 = *(void (**)(char *, uint64_t))(v47 + 8);
  uint64_t v27 = v49;
  v26(v3, v49);
  if (v22 == 2) {
    double v8 = 0.12;
  }
  double v28 = dbl_100016D80[v22 == 2];
  *(void *)(v21 + 40) = [objc_allocWithZone((Class)NSNumber) initWithDouble:v28 + v25 - v8 - v23];
  sub_100015BE0();
  sub_100015850();
  double v30 = v29;
  v26(v3, v27);
  *(void *)(v21 + 48) = [objc_allocWithZone((Class)NSNumber) initWithDouble:v28 + v30 - v8];
  *(NSNumber *)(v21 + 56) = sub_100015C40(1.0);
  uint64_t v52 = v21;
  sub_100015B30();
  Class v31 = sub_100015B10().super.isa;
  swift_bridgeObjectRelease();
  double v32 = v4;
  [v4 setLocations:v31];

  id v33 = [objc_allocWithZone((Class)CABackdropLayer) init];
  id v34 = v51;
  [v51 bounds];
  objc_msgSend(v33, "setBackdropRect:");
  sub_100015AC0();
  id v35 = objc_allocWithZone((Class)CAFilter);
  NSString v36 = sub_100015AB0();
  swift_bridgeObjectRelease();
  id v37 = [v35 initWithType:v36];

  [v34 bounds];
  Class v38 = sub_100015C00().super.isa;
  [v37 setValue:v38 forKey:kCAFilterInputBounds];

  Class v39 = sub_100015BA0().super.super.isa;
  [v37 setValue:v39 forKey:kCAFilterInputRadius];

  uint64_t v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_100016DA0;
  *(void *)(v40 + 56) = sub_100008764(0, (unint64_t *)&unk_100023070);
  *(void *)(v40 + 32) = v37;
  id v41 = v33;
  id v42 = v37;
  Class v43 = sub_100015B10().super.isa;
  swift_bridgeObjectRelease();
  [v41 setFilters:v43];

  id v44 = v41;
  [v44 setMask:v32];

  return v44;
}

id sub_10000BE90(uint64_t a1)
{
  uint64_t v48 = a1;
  uint64_t v1 = sub_100015790();
  uint64_t v49 = *(void *)(v1 - 8);
  uint64_t v50 = v1;
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v46 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [objc_allocWithZone((Class)CAGradientLayer) init];
  id v5 = sub_10000A460();
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v4, "setFrame:", v7, v9, v11, v13);
  id v47 = v4;
  sub_100002B10((uint64_t *)&unk_100023060);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100016D90;
  id v15 = self;
  id v16 = [v15 whiteColor];
  id v17 = [v16 CGColor];

  type metadata accessor for CGColor(0);
  uint64_t v19 = v18;
  *(void *)(v14 + 56) = v18;
  *(void *)(v14 + 32) = v17;
  id v20 = [v15 whiteColor];
  id v21 = [v20 CGColor];

  *(void *)(v14 + 88) = v19;
  *(void *)(v14 + 64) = v21;
  id v22 = [v15 whiteColor];
  double v23 = 0.0;
  id v24 = [v22 colorWithAlphaComponent:0.0];

  id v25 = [v24 CGColor];
  *(void *)(v14 + 120) = v19;
  *(void *)(v14 + 96) = v25;
  id v26 = [v15 whiteColor];
  id v27 = [v26 colorWithAlphaComponent:0.0];

  id v28 = [v27 CGColor];
  *(void *)(v14 + 152) = v19;
  *(void *)(v14 + 128) = v28;
  Class isa = sub_100015B10().super.isa;
  swift_bridgeObjectRelease();
  [v4 setColors:isa];

  sub_100002B10(&qword_100022AF0);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_100016AB0;
  sub_100008764(0, (unint64_t *)&unk_100022F80);
  *(NSNumber *)(v30 + 32) = sub_100015C40(0.0);
  uint64_t v31 = v48 + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_constants;
  uint64_t v32 = *(void *)(v48 + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_constants);
  double v33 = *(double *)(v48 + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_constants + 32);
  double v34 = *(double *)(v48 + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_constants + 48);
  sub_100015BE0();
  sub_100015850();
  double v36 = v35;
  uint64_t v37 = v50;
  Class v38 = *(void (**)(char *, uint64_t))(v49 + 8);
  v38(v3, v50);
  double v39 = dbl_100016D80[v32 == 2];
  if (v32 == 2) {
    double v23 = 0.12;
  }
  *(void *)(v30 + 40) = [objc_allocWithZone((Class)NSNumber) initWithDouble:v34 + v39 + v36 - v23 - v33];
  double v40 = *(double *)(v31 + 40);
  sub_100015BE0();
  sub_100015850();
  double v42 = v41;
  v38(v3, v37);
  *(void *)(v30 + 48) = [objc_allocWithZone((Class)NSNumber) initWithDouble:v40 + v34 + v39 + v42 - v23 - v33];
  *(NSNumber *)(v30 + 56) = sub_100015C40(1.0);
  uint64_t v51 = v30;
  sub_100015B30();
  Class v43 = sub_100015B10().super.isa;
  swift_bridgeObjectRelease();
  id v44 = v47;
  [v47 setLocations:v43];

  return v44;
}

void sub_10000C358()
{
  sub_1000065FC();
  if (v0 <= 0x3F)
  {
    sub_100015A00();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for AvatarRecordRenderView.Constants(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 initializeWithCopy for AvatarRecordRenderView.Constants(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for AvatarRecordRenderView.Constants(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 56)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AvatarRecordRenderView.Constants(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 56) = v3;
  return result;
}

ValueMetadata *type metadata accessor for AvatarRecordRenderView.Constants()
{
  return &type metadata for AvatarRecordRenderView.Constants;
}

uint64_t sub_10000C520()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000C558(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000C56C(a1, a2);
  }
  return a1;
}

uint64_t sub_10000C56C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_10000C5C4()
{
  uint64_t v1 = sub_100015860();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000C698(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100015860() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  double v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *double v9 = v2;
  v9[1] = sub_1000084F0;
  return sub_1000097EC(a1, v5, v6, v7, v8);
}

uint64_t sub_10000C794(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000C870;
  return v6(a1);
}

uint64_t sub_10000C870()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000C968()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C9A0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000084F0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100023040 + dword_100023040);
  return v6(a1, v4);
}

uint64_t sub_10000CA58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002B10((uint64_t *)&unk_100023050);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000CAC0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100002B10(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_10000CB24()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_postponedRenderingConfiguration];
  uint64_t v2 = sub_100015860();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  *(_OWORD *)&v0[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_lastPoseData] = xmmword_100016D40;
  sub_1000159F0();
  *(void *)&v0[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_imageGenerationTask] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_avatarImage] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_currentAvatarRecord] = 0;
  v0[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_shouldUpdateLayerFilters] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView____lazy_storage___avatarImageView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView____lazy_storage___bodyBlurLayer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView____lazy_storage___bodyMaskLayer] = 0;

  sub_100015DD0();
  __break(1u);
}

id sub_10000CC7C()
{
  uint64_t v1 = OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor____lazy_storage___avatarStore;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor____lazy_storage___avatarStore);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor____lazy_storage___avatarStore);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)AVTAvatarStore) init];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_10000CCF0()
{
  uint64_t v1 = OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor____lazy_storage___defaultAvatar;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor____lazy_storage___defaultAvatar);
  uint64_t v3 = v2;
  if (v2 == 1)
  {
    uint64_t v3 = sub_10000CD60();
    uint64_t v4 = *(void *)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    swift_unknownObjectRetain();
    sub_100014ADC(v4);
  }
  sub_100014AEC(v2);
  return v3;
}

uint64_t sub_10000CD60()
{
  id v0 = sub_10000CC7C();
  id v1 = [self requestForStorePrimaryAvatar];
  id v14 = 0;
  id v2 = [v0 avatarsForFetchRequest:v1 error:&v14];

  id v3 = v14;
  if (v2)
  {
    sub_100002B10(&qword_100023230);
    unint64_t v4 = sub_100015B20();
    id v5 = v3;

    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_100015DE0();
      swift_bridgeObjectRelease();
      if (v6)
      {
LABEL_4:
        if ((v4 & 0xC000000000000001) != 0)
        {
          uint64_t v6 = sub_100015D10();
        }
        else
        {
          if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            __break(1u);
          }
          uint64_t v6 = *(void *)(v4 + 32);
          swift_unknownObjectRetain();
        }
      }
    }
    else
    {
      uint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v6) {
        goto LABEL_4;
      }
    }
    swift_bridgeObjectRelease();
    return v6;
  }
  id v7 = v14;
  sub_100015910();

  swift_willThrow();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v8 = sub_1000159E0();
  os_log_type_t v9 = sub_100015BC0();
  if (os_log_type_enabled(v8, v9))
  {
    double v10 = (uint8_t *)swift_slowAlloc();
    id v14 = (id)swift_slowAlloc();
    *(_DWORD *)double v10 = 136315138;
    swift_getErrorValue();
    uint64_t v11 = sub_100015E60();
    sub_10001314C(v11, v12, (uint64_t *)&v14);
    sub_100015CA0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Could not load primary avatar. %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();

    swift_errorRelease();
    swift_errorRelease();
  }
  return 0;
}

void sub_10000D060(void *a1, void *a2)
{
  uint64_t v3 = v2;
  swift_unknownObjectRetain_n();
  uint64_t v6 = sub_1000159E0();
  os_log_type_t v7 = sub_100015BB0();
  if (os_log_type_enabled(v6, v7))
  {
    id v15 = a1;
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    id v9 = [a2 description];
    uint64_t v10 = sub_100015AC0();
    unint64_t v12 = v11;

    sub_10001314C(v10, v12, &v16);
    sub_100015CA0();
    swift_unknownObjectRelease_n();
    a1 = v15;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Initializing editor with poster environment: %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  double v13 = *(void **)(v3 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_editor);
  *(void *)(v3 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_editor) = a1;

  id v14 = a1;
  sub_10000D230(a2);
}

void sub_10000D230(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v78 = sub_100002B10((uint64_t *)&unk_100023050);
  uint64_t v4 = __chkstk_darwin(v78);
  uint64_t v6 = (uint8_t *)v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  id v9 = (char *)v75 - v8;
  __chkstk_darwin(v7);
  unint64_t v76 = (char *)v75 - v10;
  uint64_t v81 = sub_100015780();
  uint64_t v80 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  unint64_t v79 = (unint64_t)v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (uint8_t *)&v1[OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_logger];
  swift_unknownObjectRetain_n();
  uint64_t v83 = v12;
  double v13 = sub_1000159E0();
  os_log_type_t v14 = sub_100015BB0();
  BOOL v15 = os_log_type_enabled(v13, v14);
  unint64_t v82 = v6;
  if (v15)
  {
    uint64_t v16 = swift_slowAlloc();
    unint64_t v77 = v2;
    id v17 = (uint8_t *)v16;
    v86[0] = (id)swift_slowAlloc();
    *(_DWORD *)id v17 = 136315138;
    v75[1] = v17 + 4;
    id v18 = [a1 description];
    uint64_t v19 = sub_100015AC0();
    id v20 = v9;
    unint64_t v22 = v21;

    *(void *)&long long v87 = sub_10001314C(v19, v22, (uint64_t *)v86);
    uint64_t v6 = v82;
    sub_100015CA0();
    swift_unknownObjectRelease_n();
    id v9 = v20;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Loading poster configuration from poster environment: %s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v2 = v77;
    swift_slowDealloc();
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  id v23 = [a1 sourceContents];
  v86[0] = 0;
  id v24 = [v23 loadUserInfoWithError:v86];
  swift_unknownObjectRelease();
  id v25 = v86[0];
  if (v24)
  {
    uint64_t v26 = sub_100015A70();
    id v27 = v25;

    uint64_t v28 = v80;
    unint64_t v29 = v79;
    uint64_t v30 = v81;
    (*(void (**)(unint64_t, void, uint64_t))(v80 + 104))(v79, enum case for AvatarPosterConfiguration.UserInfoKey.dataRepresentation(_:), v81);
    uint64_t v31 = sub_100015770();
    unint64_t v33 = v32;
    (*(void (**)(unint64_t, uint64_t))(v28 + 8))(v29, v30);
    uint64_t v84 = v31;
    unint64_t v85 = v33;
    sub_100015CE0();
    if (*(void *)(v26 + 16) && (unint64_t v34 = sub_100012B00((uint64_t)v86), (v35 & 1) != 0))
    {
      sub_1000087A0(*(void *)(v26 + 56) + 32 * v34, (uint64_t)&v87);
    }
    else
    {
      long long v87 = 0u;
      long long v88 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_1000086B4((uint64_t)v86);
    if (*((void *)&v88 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v36 = (uint64_t)v9;
        uint64_t v37 = v84;
        unint64_t v38 = v85;
        sub_1000158C0();
        swift_allocObject();
        uint64_t v39 = sub_1000158B0();
        uint64_t v40 = sub_100015860();
        sub_1000151B4((unint64_t *)&unk_1000232F0, (void (*)(uint64_t))&type metadata accessor for AvatarPosterConfiguration);
        uint64_t v41 = (uint64_t)v76;
        uint64_t v81 = v37;
        uint64_t v80 = v39;
        sub_1000158A0();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v41, 0, 1, v40);
        uint64_t v64 = v2;
        uint64_t v65 = (uint64_t)v2 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_configuration;
        swift_beginAccess();
        sub_10000CAC0(v65, v36, (uint64_t *)&unk_100023050);
        swift_beginAccess();
        sub_10000864C(v41, v65);
        swift_endAccess();
        sub_10000FF24(v36);
        sub_100008708(v41, (uint64_t *)&unk_100023050);
        sub_100008708(v36, (uint64_t *)&unk_100023050);
        id v66 = v64;
        id v67 = sub_1000159E0();
        os_log_type_t v68 = sub_100015BB0();
        if (os_log_type_enabled(v67, v68))
        {
          uint64_t v70 = swift_slowAlloc();
          unint64_t v79 = v38;
          unint64_t v71 = (uint8_t *)v70;
          *(void *)&long long v87 = swift_slowAlloc();
          *(_DWORD *)unint64_t v71 = 136315138;
          uint64_t v83 = v71 + 4;
          sub_10000CAC0(v65, v36, (uint64_t *)&unk_100023050);
          uint64_t v72 = sub_100015C80();
          unint64_t v74 = v73;
          sub_100008708(v36, (uint64_t *)&unk_100023050);
          uint64_t v84 = sub_10001314C(v72, v74, (uint64_t *)&v87);
          sub_100015CA0();

          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v67, v68, "Did load poster configuration: %s", v71, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
          swift_release();
          sub_10000415C(v81, v79);
        }
        else
        {
          swift_release();
          sub_10000415C(v81, v38);
        }
        return;
      }
    }
    else
    {
      sub_100008708((uint64_t)&v87, &qword_100022F78);
    }
    sub_100004264();
    sub_100015800();
    uint64_t v48 = sub_100015860();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v9, 0, 1, v48);
    uint64_t v49 = (uint64_t)v2 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_configuration;
    swift_beginAccess();
    sub_10000CAC0(v49, (uint64_t)v6, (uint64_t *)&unk_100023050);
    swift_beginAccess();
    sub_10000864C((uint64_t)v9, v49);
    swift_endAccess();
    sub_10000FF24((uint64_t)v6);
    sub_100008708((uint64_t)v9, (uint64_t *)&unk_100023050);
    sub_100008708((uint64_t)v6, (uint64_t *)&unk_100023050);
    id v50 = v2;
    uint64_t v51 = sub_1000159E0();
    os_log_type_t v52 = sub_100015BB0();
    if (os_log_type_enabled(v51, v52))
    {
      id v53 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v87 = swift_slowAlloc();
      *(_DWORD *)id v53 = 136315138;
      uint64_t v54 = (uint64_t)v9;
      unint64_t v82 = v53 + 4;
      sub_10000CAC0(v49, (uint64_t)v9, (uint64_t *)&unk_100023050);
      uint64_t v55 = sub_100015C80();
      unint64_t v57 = v56;
      sub_100008708(v54, (uint64_t *)&unk_100023050);
      uint64_t v84 = sub_10001314C(v55, v57, (uint64_t *)&v87);
      sub_100015CA0();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "Creating new poster configuration: %s", v53, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    CGRect v58 = sub_1000159E0();
    os_log_type_t v59 = sub_100015BB0();
    if (os_log_type_enabled(v58, v59))
    {
      CGRect v60 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)CGRect v60 = 0;
      _os_log_impl((void *)&_mh_execute_header, v58, v59, "Presenting avatar picker for new poster configuration", v60, 2u);
      swift_slowDealloc();
    }

    sub_100010AF4();
  }
  else
  {
    id v42 = v86[0];
    sub_100015910();

    swift_willThrow();
    swift_errorRetain();
    swift_errorRetain();
    Class v43 = sub_1000159E0();
    os_log_type_t v44 = sub_100015BC0();
    if (os_log_type_enabled(v43, v44))
    {
      id v45 = (uint8_t *)swift_slowAlloc();
      v86[0] = (id)swift_slowAlloc();
      *(_DWORD *)id v45 = 136315138;
      swift_getErrorValue();
      uint64_t v46 = sub_100015E60();
      *(void *)&long long v87 = sub_10001314C(v46, v47, (uint64_t *)v86);
      sub_100015CA0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Error loading user info from environment: %s", v45, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
    }
    sub_100004264();
    sub_100015800();
    uint64_t v61 = sub_100015860();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v61 - 8) + 56))(v9, 0, 1, v61);
    uint64_t v62 = (uint64_t)v2 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_configuration;
    swift_beginAccess();
    uint64_t v63 = (uint64_t)v82;
    sub_10000CAC0(v62, (uint64_t)v82, (uint64_t *)&unk_100023050);
    swift_beginAccess();
    sub_10000864C((uint64_t)v9, v62);
    swift_endAccess();
    sub_10000FF24(v63);
    sub_100008708((uint64_t)v9, (uint64_t *)&unk_100023050);
    sub_100008708(v63, (uint64_t *)&unk_100023050);
    swift_errorRelease();
  }
}

uint64_t sub_10000E30C(uint64_t a1)
{
  v2[59] = a1;
  v2[60] = v1;
  uint64_t v3 = sub_100015780();
  v2[61] = v3;
  v2[62] = *(void *)(v3 - 8);
  v2[63] = swift_task_alloc();
  v2[64] = swift_task_alloc();
  uint64_t v4 = sub_100015860();
  v2[65] = v4;
  v2[66] = *(void *)(v4 - 8);
  v2[67] = swift_task_alloc();
  v2[68] = sub_100002B10((uint64_t *)&unk_100023050);
  v2[69] = swift_task_alloc();
  v2[70] = swift_task_alloc();
  v2[71] = swift_task_alloc();
  v2[72] = swift_task_alloc();
  sub_100015B60();
  v2[73] = sub_100015B50();
  uint64_t v6 = sub_100015B40();
  return _swift_task_switch(sub_10000E4FC, v6, v5);
}

uint64_t sub_10000E4FC()
{
  uint64_t v91 = v0;
  swift_release();
  uint64_t v1 = sub_1000159E0();
  os_log_type_t v2 = sub_100015BB0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Finalizing editing session", v3, 2u);
    swift_slowDealloc();
  }

  uint64_t v4 = (char *)sub_100013D6C();
  if (!v4) {
    __break(1u);
  }
  uint64_t v5 = *(void **)&v4[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_avatarImage];
  p_vtable = (void **)(&OBJC_METACLASS____TtC21AvatarPosterExtension22AvatarRecordRenderView + 24);
  if (v5)
  {
    id v7 = [v5 HEICRepresentation];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = sub_100015930();
      unint64_t v86 = v10;

      uint64_t v11 = sub_1000159E0();
      os_log_type_t v12 = sub_100015BB0();
      if (os_log_type_enabled(v11, v12))
      {
        double v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)double v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Setting configuration image data from avatar record render view", v13, 2u);
        swift_slowDealloc();
      }
      uint64_t v14 = *(void *)(v0 + 576);
      uint64_t v15 = *(void *)(v0 + 528);
      uint64_t v16 = *(void *)(v0 + 520);
      uint64_t v17 = *(void *)(v0 + 480);

      uint64_t v18 = v17 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_configuration;
      swift_beginAccess();
      sub_10000CAC0(v18, v14, (uint64_t *)&unk_100023050);
      int v19 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v14, 1, v16);
      uint64_t v20 = *(void *)(v0 + 576);
      uint64_t v21 = *(void *)(v0 + 568);
      if (v19)
      {
        uint64_t v22 = *(void *)(v0 + 560);
        sub_10000CAC0(*(void *)(v0 + 576), *(void *)(v0 + 568), (uint64_t *)&unk_100023050);
        sub_10000CAC0(v18, v22, (uint64_t *)&unk_100023050);
        swift_beginAccess();
        sub_10000864C(v21, v18);
        swift_endAccess();
        sub_10000FF24(v22);
        sub_100008708(v21, (uint64_t *)&unk_100023050);
        sub_100008708(v22, (uint64_t *)&unk_100023050);
        sub_10000415C(v9, v86);
        sub_100008708(v20, (uint64_t *)&unk_100023050);
      }
      else
      {
        sub_10000C56C(v9, v86);
        sub_1000157F0();
        sub_10000CAC0(v18, v21, (uint64_t *)&unk_100023050);
        swift_beginAccess();
        sub_10000864C(v20, v18);
        swift_endAccess();
        sub_10000FF24(v21);
        sub_100008708(v20, (uint64_t *)&unk_100023050);
        sub_100008708(v21, (uint64_t *)&unk_100023050);
        sub_10000415C(v9, v86);
      }
      p_vtable = &OBJC_METACLASS____TtC21AvatarPosterExtension22AvatarRecordRenderView.vtable;
    }
  }
  uint64_t v23 = *(void *)(v0 + 552);
  uint64_t v24 = *(void *)(v0 + 528);
  uint64_t v25 = *(void *)(v0 + 520);
  uint64_t v26 = (uint64_t)p_vtable[150] + *(void *)(v0 + 480);
  swift_beginAccess();
  sub_10000CAC0(v26, v23, (uint64_t *)&unk_100023050);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v23, 1, v25) == 1)
  {
    sub_100008708(*(void *)(v0 + 552), (uint64_t *)&unk_100023050);
    id v27 = sub_1000159E0();
    os_log_type_t v28 = sub_100015BC0();
    if (os_log_type_enabled(v27, v28))
    {
      unint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Configuration is unexpectedly nil, failed to finalize editing", v29, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 528) + 32))(*(void *)(v0 + 536), *(void *)(v0 + 552), *(void *)(v0 + 520));
    sub_100015900();
    swift_allocObject();
    sub_1000158F0();
    sub_1000158D0();
    *(void *)(v0 + 456) = sub_100015830();
    sub_100002B10(&qword_100023298);
    sub_100015040();
    uint64_t v83 = sub_1000158E0();
    unint64_t v84 = v30;
    swift_bridgeObjectRelease();
    sub_1000151B4(&qword_1000232B0, (void (*)(uint64_t))&type metadata accessor for AvatarPosterConfiguration);
    uint64_t v31 = sub_1000158E0();
    uint64_t v43 = *(void *)(v0 + 512);
    uint64_t v76 = *(void *)(v0 + 504);
    unint64_t v81 = v44;
    uint64_t v82 = v31;
    uint64_t v46 = *(void *)(v0 + 488);
    uint64_t v45 = *(void *)(v0 + 496);
    id v77 = *(id *)(v0 + 472);
    id v78 = objc_msgSend(objc_msgSend(v77, "environment"), "targetConfiguration");
    swift_unknownObjectRelease();
    sub_100002B10((uint64_t *)&unk_1000232B8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100016E90;
    uint64_t v48 = v45;
    unint64_t v75 = *(void (**)(uint64_t, void, uint64_t))(v45 + 104);
    v75(v43, enum case for AvatarPosterConfiguration.UserInfoKey.backgroundColorDescription(_:), v46);
    uint64_t v49 = sub_100015770();
    uint64_t v51 = v50;
    os_log_type_t v52 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
    v52(v43, v46);
    *(void *)(v0 + 384) = v49;
    *(void *)(v0 + 392) = v51;
    sub_100015CE0();
    *(void *)(inited + 96) = &type metadata for Data;
    *(void *)(inited + 72) = v83;
    *(void *)(inited + 80) = v84;
    v75(v76, enum case for AvatarPosterConfiguration.UserInfoKey.dataRepresentation(_:), v46);
    sub_10000C56C(v83, v84);
    uint64_t v53 = sub_100015770();
    uint64_t v55 = v54;
    v52(v76, v46);
    *(void *)(v0 + 416) = v53;
    *(void *)(v0 + 424) = v55;
    sub_100015CE0();
    *(void *)(inited + 168) = &type metadata for Data;
    *(void *)(inited + 144) = v82;
    *(void *)(inited + 152) = v81;
    strcpy((char *)(v0 + 400), "boundingShape");
    *(_WORD *)(v0 + 414) = -4864;
    sub_10000C56C(v82, v81);
    sub_100015CE0();
    uint64_t v56 = sub_100008764(0, (unint64_t *)&unk_100022F80);
    id v57 = objc_msgSend(objc_msgSend(v77, "environment"), "boundingShape");
    swift_unknownObjectRelease();
    v58.super.super.Class isa = sub_100015C50((Swift::Int)v57).super.super.isa;
    *(void *)(inited + 240) = v56;
    *(NSNumber *)(inited + 216) = v58;
    sub_10000F1C4(inited);
    Class isa = sub_100015A60().super.isa;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 432) = 0;
    unsigned int v60 = [v78 storeUserInfo:isa error:v0 + 432];

    id v61 = *(id *)(v0 + 432);
    if (v60)
    {
      id v62 = *(id *)(v0 + 480);
      uint64_t v63 = sub_1000159E0();
      os_log_type_t v64 = sub_100015BB0();
      if (os_log_type_enabled(v63, v64))
      {
        uint64_t v65 = *(void *)(v0 + 568);
        uint64_t v89 = *(void *)(v0 + 536);
        uint64_t v80 = *(void *)(v0 + 528);
        uint64_t v87 = *(void *)(v0 + 520);
        unint64_t v79 = *(void **)(v0 + 480);
        id v66 = (uint8_t *)swift_slowAlloc();
        v90[0] = swift_slowAlloc();
        *(_DWORD *)id v66 = 136315138;
        sub_10000CAC0(v26, v65, (uint64_t *)&unk_100023050);
        uint64_t v67 = sub_100015C80();
        unint64_t v69 = v68;
        sub_100008708(v65, (uint64_t *)&unk_100023050);
        *(void *)(v0 + 440) = sub_10001314C(v67, v69, v90);
        sub_100015CA0();
        swift_bridgeObjectRelease();

        _os_log_impl((void *)&_mh_execute_header, v63, v64, "Saving poster configuration: %s", v66, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        swift_release();

        sub_10000415C(v82, v81);
        sub_10000415C(v83, v84);
        (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v89, v87);
      }
      else
      {
        uint64_t v71 = *(void *)(v0 + 536);
        uint64_t v72 = *(void *)(v0 + 528);
        uint64_t v73 = *(void *)(v0 + 520);
        unint64_t v74 = *(void **)(v0 + 480);
        sub_10000415C(v83, v84);
        sub_10000415C(v82, v81);

        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v71, v73);
      }
    }
    else
    {
      uint64_t v70 = v61;
      sub_100015910();

      swift_willThrow();
      sub_10000415C(v83, v84);
      sub_10000415C(v82, v81);
      swift_release();
      swift_errorRetain();
      swift_errorRetain();
      unint64_t v32 = sub_1000159E0();
      os_log_type_t v33 = sub_100015BC0();
      BOOL v34 = os_log_type_enabled(v32, v33);
      uint64_t v35 = *(void *)(v0 + 536);
      uint64_t v36 = *(void *)(v0 + 528);
      uint64_t v37 = *(void *)(v0 + 520);
      if (v34)
      {
        uint64_t v88 = *(void *)(v0 + 536);
        uint64_t v85 = *(void *)(v0 + 520);
        unint64_t v38 = (uint8_t *)swift_slowAlloc();
        v90[0] = swift_slowAlloc();
        *(_DWORD *)unint64_t v38 = 136315138;
        swift_getErrorValue();
        uint64_t v39 = sub_100015E60();
        *(void *)(v0 + 448) = sub_10001314C(v39, v40, v90);
        sub_100015CA0();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v32, v33, "Error finalizing editing: %s", v38, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_errorRelease();
        (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v88, v85);
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();

        (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
      }
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
  return v41();
}

unint64_t sub_10000F1C4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100002B10(&qword_1000232C8);
  uint64_t v2 = sub_100015DF0();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10000CAC0(v6, (uint64_t)v15, &qword_1000232D0);
    unint64_t result = sub_100012B00((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_1000087FC(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10000F484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_100015B60();
  v3[5] = sub_100015B50();
  uint64_t v5 = sub_100015B40();
  return _swift_task_switch(sub_10000F520, v5, v4);
}

uint64_t sub_10000F520()
{
  uint64_t v1 = (void *)v0[4];
  uint64_t v3 = (void *)v0[2];
  uint64_t v2 = (const void *)v0[3];
  swift_release();
  v0[6] = _Block_copy(v2);
  id v4 = v3;
  id v5 = v1;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[7] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_10000F5E4;
  uint64_t v7 = v0[2];
  return sub_10000E30C(v7);
}

uint64_t sub_10000F5E4()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 48);
  uint64_t v2 = *(void **)(*v0 + 32);
  uint64_t v3 = *(void **)(*v0 + 16);
  uint64_t v6 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  id v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_10000F79C(void *a1)
{
  uint64_t v2 = sub_100015950();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_100015AA0();
  __chkstk_darwin(v3 - 8);
  sub_100002B10(&qword_100022AF0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100016EA0;
  sub_100015A90();
  sub_100015940();
  sub_100015AD0();
  swift_bridgeObjectRetain();
  NSString v5 = sub_100015AB0();
  id v6 = [self _systemImageNamed:v5];

  sub_100008764(0, &qword_100023248);
  sub_100015AB0();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  id v7 = (id)sub_100015C70();
  NSString v8 = sub_100015AB0();
  swift_bridgeObjectRelease();
  [v7 setAccessibilityLabel:v8];

  *(void *)(v4 + 32) = v7;
  *(void *)(v4 + 40) = [a1 depthEffectMenu];
  sub_100015B30();
  return v4;
}

uint64_t sub_10000FA68()
{
  uint64_t v0 = sub_100015950();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100015AA0();
  __chkstk_darwin(v1 - 8);
  sub_100002B10(&qword_100022AF0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100016EB0;
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_100015A90();
  sub_100015940();
  uint64_t v4 = sub_100015AD0();
  uint64_t v6 = v5;
  swift_bridgeObjectRetain();
  sub_100011084();
  sub_100008764(0, &qword_100023248);
  sub_100015AB0();
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  NSString v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = v3;
  v8[4] = v4;
  v8[5] = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  id v9 = (id)sub_100015C70();
  NSString v10 = sub_100015AB0();
  swift_bridgeObjectRelease();
  [v9 setAccessibilityLabel:v10];
  swift_release();

  *(void *)(v2 + 32) = v9;
  sub_100015B30();
  return v2;
}

Class sub_10000FD30(void *a1, uint64_t a2, void *a3, uint64_t (*a4)(id))
{
  id v6 = a3;
  id v7 = a1;
  uint64_t v8 = a4(v6);

  if (v8)
  {
    sub_100008764(0, &qword_100023240);
    v9.super.Class isa = sub_100015B10().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  return v9.super.isa;
}

id sub_10000FF24(uint64_t a1)
{
  uint64_t v3 = sub_1000157A0();
  uint64_t v103 = *(void *)(v3 - 8);
  uint64_t v104 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v102 = (char *)&v97 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v101 = (char *)&v97 - v6;
  uint64_t v7 = sub_100002B10((uint64_t *)&unk_100023050);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  NSString v10 = (char *)&v97 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v97 - v11;
  uint64_t v13 = sub_100015860();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  long long v17 = (char *)&v97 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v97 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  os_log_type_t v105 = (char *)&v97 - v22;
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v97 - v23;
  sub_10000CAC0(a1, (uint64_t)v12, (uint64_t *)&unk_100023050);
  uint64_t v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v25(v12, 1, v13) == 1) {
    return (id)sub_100008708((uint64_t)v12, (uint64_t *)&unk_100023050);
  }
  v97 = v17;
  id v98 = v20;
  id v27 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  v27(v24, v12, v13);
  uint64_t v28 = v1 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_configuration;
  swift_beginAccess();
  sub_10000CAC0(v28, (uint64_t)v10, (uint64_t *)&unk_100023050);
  if (v25(v10, 1, v13) == 1)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v24, v13);
    return (id)sub_100008708((uint64_t)v10, (uint64_t *)&unk_100023050);
  }
  v27(v105, v10, v13);
  uint64_t v100 = v1;
  uint64_t v99 = v1 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_logger;
  unint64_t v29 = sub_1000159E0();
  os_log_type_t v30 = sub_100015BB0();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Configuration changed, updating views", v31, 2u);
    swift_slowDealloc();
  }

  unint64_t v32 = v24;
  uint64_t v33 = sub_100015830();
  uint64_t v34 = (uint64_t)v105;
  uint64_t v35 = sub_100015830();
  char v36 = sub_10001294C(v33, v35);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v37 = v14;
  if (v36)
  {
LABEL_14:
    uint64_t v48 = v101;
    sub_1000157B0();
    uint64_t v50 = v102;
    uint64_t v49 = v103;
    uint64_t v51 = v104;
    (*(void (**)(char *, void, uint64_t))(v103 + 104))(v102, enum case for AvatarPosterConfiguration.RenderingMode.none(_:), v104);
    sub_1000151B4((unint64_t *)&unk_100023218, (void (*)(uint64_t))&type metadata accessor for AvatarPosterConfiguration.RenderingMode);
    char v52 = sub_100015A80();
    uint64_t v53 = *(void (**)(char *, uint64_t))(v49 + 8);
    v53(v50, v51);
    v53(v48, v51);
    if (v52)
    {
      uint64_t v54 = sub_1000159E0();
      os_log_type_t v55 = sub_100015BB0();
      if (os_log_type_enabled(v54, v55))
      {
        uint64_t v56 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v56 = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, v55, "No avatar currently selected, displaying avatar picker", v56, 2u);
        swift_slowDealloc();
      }

      sub_100010AF4();
      goto LABEL_31;
    }
    uint64_t v57 = sub_100015810();
    unint64_t v59 = v58;
    sub_100004148(v57, v58);
    if (v59 >> 60 == 15)
    {
      uint64_t v60 = sub_1000157E0();
      unint64_t v62 = v61;
      uint64_t v64 = sub_1000157E0();
      unint64_t v65 = v63;
      if (v62 >> 60 == 15)
      {
        if (v63 >> 60 == 15) {
          goto LABEL_31;
        }
      }
      else if (v63 >> 60 != 15)
      {
        sub_10000C558(v60, v62);
        char v82 = sub_100013AD4(v60, v62, v64, v65);
        sub_100004148(v64, v65);
        sub_100004148(v60, v62);
        sub_100004148(v60, v62);
        if (v82) {
          goto LABEL_31;
        }
LABEL_27:
        unint64_t v75 = sub_1000159E0();
        os_log_type_t v76 = sub_100015BB0();
        if (os_log_type_enabled(v75, v76))
        {
          id v77 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v77 = 0;
          _os_log_impl((void *)&_mh_execute_header, v75, v76, "Avatar image data changed, rendering configuration in record render view", v77, 2u);
          swift_slowDealloc();
        }

        id result = sub_100013D6C();
        if (result)
        {
          id v78 = result;
          sub_100008870(v34, 0);

LABEL_31:
          unint64_t v79 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
          v79(v34, v13);
          return (id)((uint64_t (*)(char *, uint64_t))v79)(v32, v13);
        }
        goto LABEL_54;
      }
      sub_100004148(v60, v62);
      sub_100004148(v64, v65);
      goto LABEL_27;
    }
    uint64_t v66 = sub_100015810();
    unint64_t v68 = v67;
    uint64_t v70 = sub_100015810();
    unint64_t v71 = v69;
    if (v68 >> 60 == 15)
    {
      if (v69 >> 60 == 15)
      {
        uint64_t v72 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
        uint64_t v73 = v98;
        v72(v98, v32, v13);
        unint64_t v74 = v97;
        v72(v97, (char *)v34, v13);
        goto LABEL_38;
      }
    }
    else if (v69 >> 60 != 15)
    {
      sub_10000C558(v66, v68);
      char v83 = sub_100013AD4(v66, v68, v70, v71);
      sub_100004148(v70, v71);
      sub_100004148(v66, v68);
      sub_100004148(v66, v68);
      unint64_t v84 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
      uint64_t v73 = v98;
      v84(v98, v32, v13);
      unint64_t v74 = v97;
      v84(v97, (char *)v34, v13);
      if (v83)
      {
LABEL_38:
        uint64_t v85 = sub_1000157C0();
        unint64_t v87 = v86;
        uint64_t v88 = sub_1000157C0();
        uint64_t v90 = v88;
        unint64_t v91 = v89;
        if (v87 >> 60 == 15)
        {
          uint64_t v104 = v88;
          unint64_t v81 = *(void (**)(char *, uint64_t))(v37 + 8);
          v81(v74, v13);
          v81(v73, v13);
          if (v91 >> 60 == 15)
          {
            sub_100004148(v85, v87);
            uint64_t v34 = (uint64_t)v105;
LABEL_48:
            v81((char *)v34, v13);
            return (id)((uint64_t (*)(char *, uint64_t))v81)(v32, v13);
          }
        }
        else
        {
          if (v89 >> 60 != 15)
          {
            sub_10000C558(v85, v87);
            char v96 = sub_100013AD4(v85, v87, v90, v91);
            sub_100004148(v90, v91);
            unint64_t v81 = *(void (**)(char *, uint64_t))(v37 + 8);
            v81(v97, v13);
            v81(v98, v13);
            sub_100004148(v85, v87);
            sub_100004148(v85, v87);
            uint64_t v34 = (uint64_t)v105;
            if (v96) {
              goto LABEL_48;
            }
LABEL_44:
            uint64_t v92 = sub_1000159E0();
            os_log_type_t v93 = sub_100015BB0();
            if (os_log_type_enabled(v92, v93))
            {
              id v94 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)id v94 = 0;
              _os_log_impl((void *)&_mh_execute_header, v92, v93, "Avatar record data changed, rendering configuration in record render view", v94, 2u);
              swift_slowDealloc();
            }

            id result = sub_100013D6C();
            if (result)
            {
              id v95 = result;
              sub_100008870(v34, 0);

              goto LABEL_48;
            }
            goto LABEL_52;
          }
          uint64_t v104 = v88;
          sub_10000C56C(v85, v87);
          unint64_t v81 = *(void (**)(char *, uint64_t))(v37 + 8);
          v81(v97, v13);
          v81(v98, v13);
          sub_100004148(v85, v87);
        }
        sub_100004148(v85, v87);
        sub_100004148(v104, v91);
        uint64_t v34 = (uint64_t)v105;
        goto LABEL_44;
      }
LABEL_34:
      unint64_t v81 = *(void (**)(char *, uint64_t))(v37 + 8);
      v81(v74, v13);
      v81(v73, v13);
      goto LABEL_44;
    }
    sub_100004148(v66, v68);
    sub_100004148(v70, v71);
    uint64_t v80 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
    uint64_t v73 = v98;
    v80(v98, v32, v13);
    unint64_t v74 = v97;
    v80(v97, (char *)v34, v13);
    goto LABEL_34;
  }
  unint64_t v38 = sub_1000159E0();
  os_log_type_t v39 = sub_100015BB0();
  if (os_log_type_enabled(v38, v39))
  {
    unint64_t v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v40 = 0;
    _os_log_impl((void *)&_mh_execute_header, v38, v39, "Background color changed, updating background view", v40, 2u);
    swift_slowDealloc();
  }

  uint64_t v41 = OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor__backgroundViewController;
  id result = *(id *)(v100 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor__backgroundViewController);
  if (!result)
  {
    id v42 = [objc_allocWithZone((Class)UIViewController) init];
    uint64_t v43 = v100;
    unint64_t v44 = *(void **)(v100 + v41);
    *(void *)(v100 + v41) = v42;

    id result = *(id *)(v43 + v41);
    if (!result) {
      goto LABEL_53;
    }
  }
  id result = [result view];
  if (result)
  {
    uint64_t v45 = result;
    sub_100008764(0, &qword_100023210);
    v46._rawValue = (void *)sub_100015830();
    Class isa = sub_100015C20(v46).super.isa;
    [v45 setBackgroundColor:isa];

    goto LABEL_14;
  }
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
  return result;
}

void sub_100010AF4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100015950();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_100015AA0();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = sub_100015860();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v1 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_configuration;
  swift_beginAccess();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4)
    || ((*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4),
        uint64_t v9 = sub_100015760(),
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4),
        !v9))
  {
    uint64_t v9 = sub_10000CCF0();
    if (!v9)
    {
      NSString v10 = sub_1000159E0();
      os_log_type_t v11 = sub_100015BC0();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Could not find an avatar to present.", v12, 2u);
        swift_slowDealloc();
      }

      return;
    }
  }
  id v13 = [objc_allocWithZone((Class)AVTCombinedPickerViewController) initWithSelectedRecord:v9];
  [v13 setDelegate:v1];
  id v14 = [self effectWithStyle:8];
  id v15 = [objc_allocWithZone((Class)UIVisualEffectView) initWithEffect:v14];

  id v16 = [v13 view];
  if (!v16)
  {
    __break(1u);
    goto LABEL_16;
  }
  long long v17 = v16;
  [v16 insertSubview:v15 atIndex:0];

  id v18 = [v13 view];
  if (!v18)
  {
LABEL_16:
    __break(1u);
    return;
  }
  uint64_t v19 = v18;
  sub_100002828(v18);

  sub_100015A90();
  sub_100015940();
  sub_100015AD0();
  id v20 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:v13];
  NSString v21 = sub_100015AB0();
  swift_bridgeObjectRelease();
  [v20 setTitle:v21];

  id v22 = [v20 sheetPresentationController];
  uint64_t v23 = v22;
  if (v22)
  {
    [v22 setDelegate:v1];
    sub_100002B10(&qword_100022AF0);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_100016EB0;
    uint64_t v25 = self;
    id v26 = v23;
    *(void *)(v24 + 32) = [v25 largeDetent];
    v31[1] = v24;
    sub_100015B30();
    sub_100008764(0, &qword_100023228);
    Class isa = sub_100015B10().super.isa;
    swift_bridgeObjectRelease();
    [v26 setDetents:isa];

    id v28 = v26;
    PRSheetCornerRadius();
    sub_100015BF0();
  }
  unint64_t v29 = *(void **)(v1 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_editor);
  if (v29)
  {
    id v30 = v29;
    [v30 presentViewController:v20 animated:1 completion:0];
  }
  swift_unknownObjectRelease();
}

void sub_100011030()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_100010AF4();
  }
}

uint64_t sub_100011084()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100002B10((uint64_t *)&unk_100023050);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&aBlock[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100015860();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&aBlock[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (uint64_t)v1 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_configuration;
  swift_beginAccess();
  sub_10000CAC0(v9, (uint64_t)v4, (uint64_t *)&unk_100023050);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100008708((uint64_t)v4, (uint64_t *)&unk_100023050);
    NSString v10 = sub_1000159E0();
    os_log_type_t v11 = sub_100015BC0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Current configuration is unexpectedly nil, fall back on random background color", v12, 2u);
      swift_slowDealloc();
    }

    Class isa = (void *)sub_100004264();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    sub_100008764(0, &qword_100023210);
    v14._rawValue = (void *)sub_100015830();
    Class isa = sub_100015C20(v14).super.isa;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  id v15 = objc_msgSend(objc_allocWithZone((Class)UIGraphicsImageRenderer), "initWithSize:", 35.0, 35.0);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = isa;
  *(void *)(v16 + 24) = 0x4008000000000000;
  *(void *)(v16 + 32) = v1;
  __asm { FMOV            V0.2D, #29.0 }
  *(_OWORD *)(v16 + 40) = _Q0;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = sub_100014C2C;
  *(void *)(v22 + 24) = v16;
  aBlock[4] = sub_100014C50;
  aBlock[5] = v22;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100012108;
  aBlock[3] = &unk_10001D128;
  uint64_t v23 = _Block_copy(aBlock);
  id v24 = isa;
  id v25 = v1;
  swift_retain();
  swift_release();
  id v26 = [v15 imageWithActions:v23];

  _Block_release(v23);
  LOBYTE(v15) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v15 & 1) == 0) {
    return (uint64_t)v26;
  }
  __break(1u);
  return result;
}

void sub_100011454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = sub_100015970();
  uint64_t v54 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100002B10((uint64_t *)&unk_100023050);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100015860();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v18 = (void *)Strong;
    swift_beginAccess();
    uint64_t v19 = swift_unknownObjectWeakLoadStrong();
    if (v19)
    {
      id v20 = (void *)v19;
      uint64_t v53 = a4;
      uint64_t v21 = (uint64_t)v18 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_configuration;
      swift_beginAccess();
      sub_10000CAC0(v21, (uint64_t)v12, (uint64_t *)&unk_100023050);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
      {

        sub_100008708((uint64_t)v12, (uint64_t *)&unk_100023050);
      }
      else
      {
        uint64_t v50 = a5;
        uint64_t v51 = v20;
        (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
        sub_100008764(0, &qword_100023210);
        char v52 = v16;
        v22._rawValue = (void *)sub_100015830();
        Class isa = sub_100015C20(v22).super.isa;
        id v48 = [objc_allocWithZone((Class)PREditorColorPickerConfiguration) init];
        uint64_t v23 = sub_100015980();
        uint64_t v24 = *(void *)(v23 + 16);
        if (v24)
        {
          uint64_t v45 = v18;
          uint64_t v46 = v14;
          uint64_t v47 = v13;
          aBlock[0] = &_swiftEmptyArrayStorage;
          sub_100015D50();
          uint64_t v25 = v7;
          uint64_t v26 = v54 + 16;
          uint64_t v54 = *(void *)(v54 + 16);
          unint64_t v27 = (*(unsigned __int8 *)(v26 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 64);
          v44[1] = v23;
          unint64_t v28 = v23 + v27;
          uint64_t v29 = *(void *)(v26 + 56);
          do
          {
            ((void (*)(char *, unint64_t, uint64_t))v54)(v9, v28, v25);
            sub_100015960();
            (*(void (**)(char *, uint64_t))(v26 - 8))(v9, v25);
            sub_100015D30();
            sub_100015D60();
            sub_100015D70();
            sub_100015D40();
            v28 += v29;
            --v24;
          }
          while (v24);
          id v30 = (void *)aBlock[0];
          swift_bridgeObjectRelease();
          uint64_t v13 = v47;
          uint64_t v14 = v46;
          id v18 = v45;
        }
        else
        {
          swift_bridgeObjectRelease();
          id v30 = &_swiftEmptyArrayStorage;
        }
        sub_100011A1C((unint64_t)v30);
        swift_bridgeObjectRelease();
        id v31 = objc_allocWithZone((Class)PREditorColorPalette);
        Class v32 = sub_100015B10().super.isa;
        swift_bridgeObjectRelease();
        id v33 = [v31 initWithColors:v32 localizedName:0 showsColorWell:0];

        NSString v34 = sub_100015AB0();
        id v35 = v48;
        [v48 setPrompt:v34];

        [v35 setColorPalette:v33];
        id v36 = objc_allocWithZone((Class)PRPosterColor);
        Class v37 = isa;
        id v38 = [v36 initWithColor:isa];
        [v35 setSelectedColor:v38];

        uint64_t v39 = swift_allocObject();
        unint64_t v40 = v51;
        *(void *)(v39 + 16) = v18;
        *(void *)(v39 + 24) = v40;
        aBlock[4] = sub_100014BCC;
        aBlock[5] = v39;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_100011EB4;
        aBlock[3] = &unk_10001D0B0;
        uint64_t v41 = _Block_copy(aBlock);
        id v42 = v18;
        id v43 = v40;
        swift_release();
        [v43 presentColorPickerWithConfiguration:v35 changeHandler:v41];
        _Block_release(v41);

        (*(void (**)(char *, uint64_t))(v14 + 8))(v52, v13);
      }
    }
    else
    {
    }
  }
}

uint64_t sub_100011A1C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100015DE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  uint64_t v13 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_1000137B4(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        sub_100015D10();
        sub_100008764(0, &qword_100023210);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000137B4(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_1000137B4(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v7 + 1;
        sub_1000087FC(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      sub_100008764(0, &qword_100023210);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000137B4(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = v3[2];
        unint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_1000137B4(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v11 + 1;
        sub_1000087FC(v12, &v3[4 * v11 + 4]);
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

id sub_100011C80(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_100002B10((uint64_t *)&unk_100023050);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __chkstk_darwin(v6);
  unint64_t v11 = &v17[-v10];
  __chkstk_darwin(v9);
  uint64_t v13 = &v17[-v12];
  uint64_t v14 = a2 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_configuration;
  swift_beginAccess();
  sub_10000CAC0(v14, (uint64_t)v13, (uint64_t *)&unk_100023050);
  uint64_t v15 = sub_100015860();
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v13, 1, v15))
  {
    sub_10000CAC0((uint64_t)v13, (uint64_t)v11, (uint64_t *)&unk_100023050);
    sub_10000CAC0(v14, (uint64_t)v8, (uint64_t *)&unk_100023050);
    swift_beginAccess();
    sub_10000864C((uint64_t)v11, v14);
    swift_endAccess();
    sub_10000FF24((uint64_t)v8);
    sub_100008708((uint64_t)v11, (uint64_t *)&unk_100023050);
  }
  else
  {
    sub_100015C30();
    sub_100015840();
    sub_10000CAC0(v14, (uint64_t)v11, (uint64_t *)&unk_100023050);
    swift_beginAccess();
    sub_10000864C((uint64_t)v13, v14);
    swift_endAccess();
    sub_10000FF24((uint64_t)v11);
    uint64_t v8 = v13;
    uint64_t v13 = v11;
  }
  sub_100008708((uint64_t)v8, (uint64_t *)&unk_100023050);
  sub_100008708((uint64_t)v13, (uint64_t *)&unk_100023050);
  return [a3 updateActions];
}

void sub_100011EB4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_100011F1C(void *a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v10 = (CGContext *)[a1 CGContext];
  unint64_t v11 = (CGColor *)[a2 CGColor];
  CGContextSetFillColorWithColor(v10, v11);

  uint64_t v12 = (CGContext *)[a1 CGContext];
  CGContextSetLineWidth(v12, a3);

  uint64_t v13 = (CGContext *)[a1 CGContext];
  id v14 = [self systemBackgroundColor];
  id v15 = [self traitCollectionWithUserInterfaceStyle:1];
  id v16 = [v14 resolvedColorWithTraitCollection:v15];

  long long v17 = (CGColor *)[v16 CGColor];
  CGContextSetStrokeColorWithColor(v13, v17);

  id v18 = (CGContext *)[a1 CGContext];
  v21.origin.CGFloat x = a3;
  v21.origin.CGFloat y = a3;
  v21.size.CGFloat width = a4;
  v21.size.CGFloat height = a5;
  CGContextAddEllipseInRect(v18, v21);

  uint64_t v19 = (CGContext *)[a1 CGContext];
  CGContextDrawPath(v19, kCGPathFillStroke);
}

void sub_100012108(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

id sub_100012154()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v0[OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_editor] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor__backgroundViewController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor____lazy_storage___avatarStore] = 0;
  uint64_t v2 = v0;
  sub_1000159F0();
  *(void *)&v2[OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor____lazy_storage___defaultAvatar] = 1;
  *(void *)&v2[OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor__avatarRecordRenderView] = 0;
  id v3 = &v2[OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_configuration];
  sub_100004264();
  sub_100015800();
  uint64_t v4 = sub_100015860();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 0, 1, v4);
  *(_OWORD *)&v2[OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_constants] = xmmword_100016EC0;

  v6.receiver = v2;
  v6.super_class = ObjectType;
  return objc_msgSendSuper2(&v6, "init");
}

uint64_t sub_1000123A4()
{
  return type metadata accessor for AvatarPosterEditor();
}

uint64_t type metadata accessor for AvatarPosterEditor()
{
  uint64_t result = qword_100023200;
  if (!qword_100023200) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000123F8()
{
  sub_100015A00();
  if (v0 <= 0x3F)
  {
    sub_1000065FC();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

ValueMetadata *type metadata accessor for AvatarPosterEditor.Constants()
{
  return &type metadata for AvatarPosterEditor.Constants;
}

id sub_1000124F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  NSString v9 = sub_100015AB0();
  swift_bridgeObjectRelease();
  NSString v10 = sub_100015AB0();
  swift_bridgeObjectRelease();
  uint64_t v11 = a6[3];
  if (v11)
  {
    uint64_t v12 = sub_100003B68(a6, a6[3]);
    uint64_t v13 = *(void *)(v11 - 8);
    __chkstk_darwin(v12);
    id v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    uint64_t v16 = sub_100015E20();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
    sub_100003BAC((uint64_t)a6);
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = [v6 initWithIdentifier:v9 displayName:v10 initialTimeFontConfiguration:a5 initialTitleColor:v16];

  swift_unknownObjectRelease();
  return v17;
}

uint64_t sub_10001268C(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10001269C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1000126D8@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_10000C56C(a2, a3);
      NSString v10 = (char *)sub_100015870();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_100015890();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_100015880();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x10001293CLL);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_10000415C(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      id v17 = (char *)sub_100015870();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_100015890();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_100015880();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_10001294C(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v4 << 6);
      goto LABEL_24;
    }
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v12 >= v9) {
      return 1;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v9) {
        return 1;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v9) {
          return 1;
        }
        unint64_t v13 = *(void *)(v5 + 8 * v4);
        if (!v13)
        {
          int64_t v4 = v12 + 3;
          if (v12 + 3 >= v9) {
            return 1;
          }
          unint64_t v13 = *(void *)(v5 + 8 * v4);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_24:
    uint64_t v15 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v11);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    double v18 = *(double *)(*(void *)(v3 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    unint64_t v19 = sub_100012B44(v16, v17);
    char v21 = v20;
    uint64_t result = swift_bridgeObjectRelease();
    if ((v21 & 1) == 0 || *(double *)(*(void *)(a2 + 56) + 8 * v19) != v18) {
      return 0;
    }
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v9) {
    return 1;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v9) {
      return 1;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_23;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

unint64_t sub_100012B00(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100015CC0(*(void *)(v2 + 40));
  return sub_100012BBC(a1, v4);
}

unint64_t sub_100012B44(uint64_t a1, uint64_t a2)
{
  sub_100015E70();
  sub_100015AE0();
  Swift::Int v4 = sub_100015E80();
  return sub_100012C84(a1, a2, v4);
}

unint64_t sub_100012BBC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100015158(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100015CD0();
      sub_1000086B4((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100012C84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100015E30() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100015E30() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100012D68(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_100015208;
  return v6();
}

uint64_t sub_100012E34(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_100015208;
  return v7();
}

uint64_t sub_100012F00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100015B80();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100015B70();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100008708(a1, &qword_100022F20);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100015B40();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1000130AC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000130D4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10001314C(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_100015CA0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10001314C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100013220(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000087A0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1000087A0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100003BAC((uint64_t)v12);
  return v7;
}

uint64_t sub_100013220(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_100015CB0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000133DC(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_100015D20();
  if (!v8)
  {
    sub_100015DC0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100015E00();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1000133DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100013474(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100013654(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100013654(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100013474(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_1000135EC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100015D00();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100015DC0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100015B00();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100015E00();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100015DC0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000135EC(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100002B10(&qword_100023238);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100013654(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100002B10(&qword_100023238);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100015E00();
  __break(1u);
  return result;
}

unsigned char **sub_1000137A4(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_1000137B4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000137D4(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_1000137D4(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100002B10((uint64_t *)&unk_100023060);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  BOOL v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100015E00();
  __break(1u);
  return result;
}

uint64_t sub_100013944(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_1000126D8((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_100013A1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_100015870();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_100015890();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_100015880();
  sub_1000126D8(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_100013AD4(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x100013D3CLL);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_10000C56C(a3, a4);
                  sub_10000C56C(a1, a2);
                  char v17 = sub_100013A1C((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_10000415C(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_10000C56C(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_100013A1C(v21, v22, v20, a3, a4);
                  sub_10000415C(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_10000C56C(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_10000C56C(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_100013944(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_10000415C(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

void *sub_100013D6C()
{
  uint64_t v1 = OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor__avatarRecordRenderView;
  uint64_t result = *(void **)(v0 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor__avatarRecordRenderView);
  if (!result)
  {
    uint64_t v3 = v0;
    uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_editor);
    if (v4)
    {
      uint64_t v5 = (uint64_t)objc_msgSend(objc_msgSend(v4, "environment"), "boundingShape");
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v5 = -1;
    }
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v11 = 0;
    id v6 = objc_allocWithZone((Class)type metadata accessor for AvatarRecordRenderView());
    id v7 = sub_10000A920(v5, (uint64_t)&v9, 0.0, 0.0, 0.0, 0.0);
    uint64_t v8 = *(void **)(v3 + v1);
    *(void *)(v3 + v1) = v7;

    uint64_t result = *(void **)(v3 + v1);
    if (!result
      || (objc_msgSend(result, "setTranslatesAutoresizingMaskIntoConstraints:", 0, v9, v10, v11),
          (uint64_t result = *(void **)(v3 + v1)) == 0))
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_100013E60()
{
  uint64_t v0 = sub_100015950();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100015AA0();
  __chkstk_darwin(v1 - 8);
  sub_100002B10(&qword_100022AF0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100016EB0;
  sub_100015A90();
  sub_100015940();
  uint64_t v3 = sub_100015AD0();
  uint64_t v5 = v4;
  id v6 = [self vibrantMaterialColor];
  v9[3] = sub_100008764(0, (unint64_t *)&qword_1000232E0);
  v9[0] = v6;
  id v7 = objc_allocWithZone((Class)PREditingLook);
  *(void *)(v2 + 32) = sub_1000124F4(0x6C61727574614ELL, 0xE700000000000000, v3, v5, 0, v9);
  v9[0] = v2;
  sub_100015B30();
  return v9[0];
}

void sub_100014030(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000159E0();
  os_log_type_t v5 = sub_100015BB0();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Populating views", v6, 2u);
    swift_slowDealloc();
  }

  id v7 = [a1 backgroundView];
  uint64_t v8 = OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor__backgroundViewController;
  long long v9 = *(void **)(v2 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor__backgroundViewController);
  if (!v9)
  {
    id v10 = [objc_allocWithZone((Class)UIViewController) init];
    uint64_t v11 = *(void **)(v2 + v8);
    *(void *)(v2 + v8) = v10;

    long long v9 = *(void **)(v2 + v8);
    if (!v9) {
      goto LABEL_18;
    }
  }
  id v12 = [v9 view];
  if (!v12)
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v13 = v12;
  [v7 addSubview:v12];

  uint64_t v14 = *(void **)(v2 + v8);
  if (!v14)
  {
    id v15 = [objc_allocWithZone((Class)UIViewController) init];
    uint64_t v16 = *(void **)(v2 + v8);
    *(void *)(v2 + v8) = v15;

    uint64_t v14 = *(void **)(v2 + v8);
    if (!v14) {
      goto LABEL_19;
    }
  }
  id v17 = [v14 view];
  if (!v17) {
    goto LABEL_15;
  }
  uint64_t v18 = v17;
  id v19 = [a1 backgroundView];
  sub_100002828(v19);

  id v20 = [a1 floatingView];
  uint64_t v21 = sub_100013D6C();
  if (!v21)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  [v20 addSubview:v21];

  uint64_t v22 = sub_100013D6C();
  if (!v22)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    return;
  }
  id v23 = v22;
  id v24 = [a1 floatingView];
  sub_100002828(v24);
}

uint64_t sub_100014288()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100002B10((uint64_t *)&unk_100023050);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  os_log_type_t v5 = &v17[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v3);
  id v7 = &v17[-v6];
  uint64_t v8 = sub_1000159E0();
  os_log_type_t v9 = sub_100015BB0();
  if (os_log_type_enabled(v8, v9))
  {
    id v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Invalidating editor", v10, 2u);
    swift_slowDealloc();
  }

  uint64_t v11 = *(void **)(v1 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_editor);
  *(void *)(v1 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_editor) = 0;

  id v12 = *(void **)(v1 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor__backgroundViewController);
  *(void *)(v1 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor__backgroundViewController) = 0;

  uint64_t v13 = *(void **)(v1 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor__avatarRecordRenderView);
  *(void *)(v1 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor__avatarRecordRenderView) = 0;

  uint64_t v14 = sub_100015860();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v7, 1, 1, v14);
  uint64_t v15 = v1 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_configuration;
  swift_beginAccess();
  sub_10000CAC0(v15, (uint64_t)v5, (uint64_t *)&unk_100023050);
  swift_beginAccess();
  sub_10000864C((uint64_t)v7, v15);
  swift_endAccess();
  sub_10000FF24((uint64_t)v5);
  sub_100008708((uint64_t)v7, (uint64_t *)&unk_100023050);
  return sub_100008708((uint64_t)v5, (uint64_t *)&unk_100023050);
}

id sub_1000144A0(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = a2;
  uint64_t v4 = sub_100002B10((uint64_t *)&unk_100023050);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  id v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  id v10 = (char *)&v23 - v9;
  __chkstk_darwin(v8);
  id v12 = (char *)&v23 - v11;
  uint64_t v13 = sub_100015860();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = v2;
  uint64_t v17 = v2 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_configuration;
  swift_beginAccess();
  sub_10000CAC0(v17, (uint64_t)v12, (uint64_t *)&unk_100023050);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_100008708((uint64_t)v12, (uint64_t *)&unk_100023050);
    uint64_t v18 = v24;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
    id v19 = [self dataFromAvatarRecord:a1];
    sub_100015930();

    sub_100015820();
    id v20 = [self dataForPoseConfiguration:v23];
    if (v20)
    {
      uint64_t v21 = v20;
      sub_100015930();
    }
    sub_1000157D0();
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v10, v16, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v10, 0, 1, v13);
    sub_10000CAC0(v17, (uint64_t)v7, (uint64_t *)&unk_100023050);
    swift_beginAccess();
    sub_10000864C((uint64_t)v10, v17);
    swift_endAccess();
    uint64_t v18 = v24;
    sub_10000FF24((uint64_t)v7);
    sub_100008708((uint64_t)v10, (uint64_t *)&unk_100023050);
    sub_100008708((uint64_t)v7, (uint64_t *)&unk_100023050);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  id result = *(id *)(v18 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_editor);
  if (result) {
    return [result dismissViewControllerAnimated:1 completion:0];
  }
  return result;
}

id sub_100014808()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_editor;
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_editor);
  if (v3) {
    [v3 dismissViewControllerAnimated:1 completion:0];
  }
  uint64_t v4 = v0 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_configuration;
  swift_beginAccess();
  uint64_t v5 = sub_100015860();
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);
  if (v6(v4, 1, v5)) {
    goto LABEL_4;
  }
  uint64_t v7 = sub_100015810();
  unint64_t v9 = v8;
  swift_endAccess();
  if (v9 >> 60 != 15)
  {
    sub_100004148(v7, v9);
    swift_beginAccess();
    if (v6(v4, 1, v5))
    {
LABEL_4:
      swift_endAccess();
      goto LABEL_6;
    }
    uint64_t v11 = sub_1000157C0();
    unint64_t v13 = v12;
    swift_endAccess();
    if (v13 >> 60 != 15) {
      return (id)sub_100004148(v11, v13);
    }
  }
LABEL_6:
  id result = *(id *)(v1 + v2);
  if (result) {
    return [result requestDismissalWithAction:0];
  }
  return result;
}

id sub_100014980()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_configuration;
  swift_beginAccess();
  uint64_t v3 = sub_100015860();
  uint64_t v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 48);
  if (v4(v2, 1, v3)) {
    goto LABEL_2;
  }
  uint64_t v5 = sub_100015810();
  unint64_t v7 = v6;
  swift_endAccess();
  if (v7 >> 60 != 15)
  {
    sub_100004148(v5, v7);
    swift_beginAccess();
    if (v4(v2, 1, v3))
    {
LABEL_2:
      swift_endAccess();
      goto LABEL_4;
    }
    uint64_t v9 = sub_1000157C0();
    unint64_t v11 = v10;
    swift_endAccess();
    if (v11 >> 60 != 15) {
      return (id)sub_100004148(v9, v11);
    }
  }
LABEL_4:
  id result = *(id *)(v1 + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_editor);
  if (result) {
    return [result requestDismissalWithAction:0];
  }
  return result;
}

uint64_t sub_100014ADC(uint64_t result)
{
  if (result != 1) {
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_100014AEC(uint64_t result)
{
  if (result != 1) {
    return swift_unknownObjectRetain();
  }
  return result;
}

uint64_t sub_100014B00()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100014B38()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 48, 7);
}

void sub_100014B80(uint64_t a1)
{
  sub_100011454(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_100014B8C()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_100014BCC(uint64_t a1)
{
  return sub_100011C80(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_100014BD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100014BE4()
{
  return swift_release();
}

uint64_t sub_100014BEC()
{
  return _swift_deallocObject(v0, 56, 7);
}

void sub_100014C2C(void *a1)
{
  sub_100011F1C(a1, *(void **)(v1 + 16), *(CGFloat *)(v1 + 24), *(CGFloat *)(v1 + 40), *(CGFloat *)(v1 + 48));
}

uint64_t sub_100014C40()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100014C50()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_100014C78()
{
}

uint64_t sub_100014C80()
{
  _Block_release(*(const void **)(v0 + 24));
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100014CC8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1000084F0;
  unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100023250 + dword_100023250);
  return v6(v2, v3, v4);
}

uint64_t sub_100014D80()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100015208;
  unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100023260 + dword_100023260);
  return v6(v2, v3, v4);
}

uint64_t sub_100014E44()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100014E84(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unint64_t v6 = (int *)v1[4];
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *unint64_t v7 = v2;
  v7[1] = sub_100015208;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100023270 + dword_100023270);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_100014F50()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100014F88(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000084F0;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100023280 + dword_100023280);
  return v6(a1, v4);
}

unint64_t sub_100015040()
{
  unint64_t result = qword_1000232A0;
  if (!qword_1000232A0)
  {
    sub_1000150BC(&qword_100023298);
    sub_100015104();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000232A0);
  }
  return result;
}

uint64_t sub_1000150BC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100015104()
{
  unint64_t result = qword_1000232A8;
  if (!qword_1000232A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000232A8);
  }
  return result;
}

uint64_t sub_100015158(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1000151B4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001520C@<X0>(uint64_t *a1@<X8>)
{
  sub_100015A40();
  swift_allocObject();
  sub_100015A50();
  sub_100015A10();
  swift_allocObject();
  swift_retain();
  sub_100015A20();
  sub_100002B10(&qword_100023380);
  sub_1000159A0();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100016F70;
  sub_10001569C(&qword_100023388, (void (*)(uint64_t))&type metadata accessor for PRRenderingConfiguration);
  swift_retain();
  swift_retain();
  sub_100015990();
  sub_10001569C(&qword_100023390, (void (*)(uint64_t))&type metadata accessor for PREditingConfiguration);
  swift_retain();
  sub_100015990();
  swift_release_n();
  uint64_t result = swift_release_n();
  *a1 = v2;
  return result;
}

id sub_100015434()
{
  return sub_100015464((uint64_t (*)(void))type metadata accessor for AvatarPosterRenderer);
}

id sub_10001544C()
{
  return sub_100015464((uint64_t (*)(void))type metadata accessor for AvatarPosterEditor);
}

id sub_100015464(uint64_t (*a1)(void))
{
  id v1 = objc_allocWithZone((Class)a1(0));
  return [v1 init];
}

uint64_t sub_1000154A4()
{
  return swift_release();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100015600()
{
  unint64_t result = qword_100023360;
  if (!qword_100023360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100023360);
  }
  return result;
}

ValueMetadata *type metadata accessor for AvatarPosterExtension()
{
  return &type metadata for AvatarPosterExtension;
}

uint64_t sub_100015664()
{
  return *(void *)(*(void *)(swift_getOpaqueTypeConformance2() + 8) + 8);
}

uint64_t sub_10001569C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000156E4()
{
  return sub_100015718(&qword_100023398);
}

uint64_t sub_100015718(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000150BC(&qword_100023370);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100015760()
{
  return AvatarPosterConfiguration.avatarRecord.getter();
}

uint64_t sub_100015770()
{
  return AvatarPosterConfiguration.UserInfoKey.rawValue.getter();
}

uint64_t sub_100015780()
{
  return type metadata accessor for AvatarPosterConfiguration.UserInfoKey();
}

uint64_t sub_100015790()
{
  return type metadata accessor for AvatarPosterConfiguration.BoundingShape();
}

uint64_t sub_1000157A0()
{
  return type metadata accessor for AvatarPosterConfiguration.RenderingMode();
}

uint64_t sub_1000157B0()
{
  return AvatarPosterConfiguration.renderingMode.getter();
}

uint64_t sub_1000157C0()
{
  return AvatarPosterConfiguration.avatarPoseData.getter();
}

uint64_t sub_1000157D0()
{
  return AvatarPosterConfiguration.avatarPoseData.setter();
}

uint64_t sub_1000157E0()
{
  return AvatarPosterConfiguration.avatarImageData.getter();
}

uint64_t sub_1000157F0()
{
  return AvatarPosterConfiguration.avatarImageData.setter();
}

uint64_t sub_100015800()
{
  return AvatarPosterConfiguration.init(backgroundColor:avatarRecordData:avatarPoseData:hasBody:avatarImageData:)();
}

uint64_t sub_100015810()
{
  return AvatarPosterConfiguration.avatarRecordData.getter();
}

uint64_t sub_100015820()
{
  return AvatarPosterConfiguration.avatarRecordData.setter();
}

uint64_t sub_100015830()
{
  return AvatarPosterConfiguration.backgroundColorDescription.getter();
}

uint64_t sub_100015840()
{
  return AvatarPosterConfiguration.backgroundColorDescription.setter();
}

uint64_t sub_100015850()
{
  return static AvatarPosterConfiguration.stickerWaistLineHeightFraction(forBoundingShape:)();
}

uint64_t sub_100015860()
{
  return type metadata accessor for AvatarPosterConfiguration();
}

uint64_t sub_100015870()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_100015880()
{
  return __DataStorage._length.getter();
}

uint64_t sub_100015890()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_1000158A0()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t sub_1000158B0()
{
  return PropertyListDecoder.init()();
}

uint64_t sub_1000158C0()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t sub_1000158D0()
{
  return dispatch thunk of PropertyListEncoder.outputFormat.setter();
}

uint64_t sub_1000158E0()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t sub_1000158F0()
{
  return PropertyListEncoder.init()();
}

uint64_t sub_100015900()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t sub_100015910()
{
  return _convertNSErrorToError(_:)();
}

NSData sub_100015920()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100015930()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100015940()
{
  return static Locale.current.getter();
}

uint64_t sub_100015950()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100015960()
{
  return AvatarPosterBackgroundColor.bottomColor.getter();
}

uint64_t sub_100015970()
{
  return type metadata accessor for AvatarPosterBackgroundColor();
}

uint64_t sub_100015980()
{
  return AvatarPosterBackgroundColors.getter();
}

uint64_t sub_100015990()
{
  return _AnySceneConfiguration.init<A>(erasing:)();
}

uint64_t sub_1000159A0()
{
  return type metadata accessor for _AnySceneConfiguration();
}

uint64_t sub_1000159B0()
{
  return static _AppExtension<>.main()();
}

uint64_t sub_1000159C0()
{
  return _AppExtension.hostAuditToken.getter();
}

uint64_t sub_1000159D0()
{
  return static _SceneBuilder.buildBlock<A>(_:)();
}

uint64_t sub_1000159E0()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000159F0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100015A00()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100015A10()
{
  return type metadata accessor for PREditingConfiguration();
}

uint64_t sub_100015A20()
{
  return PREditingConfiguration.init(_:)();
}

uint64_t sub_100015A30()
{
  return PRProviderConfiguration.init(updatingDelegate:content:)();
}

uint64_t sub_100015A40()
{
  return type metadata accessor for PRRenderingConfiguration();
}

uint64_t sub_100015A50()
{
  return PRRenderingConfiguration.init(_:)();
}

NSDictionary sub_100015A60()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100015A70()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100015A80()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_100015A90()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100015AA0()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_100015AB0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100015AC0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100015AD0()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_100015AE0()
{
  return String.hash(into:)();
}

void sub_100015AF0(Swift::String a1)
{
}

Swift::Int sub_100015B00()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_100015B10()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100015B20()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100015B30()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100015B40()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100015B50()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100015B60()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100015B70()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100015B80()
{
  return type metadata accessor for TaskPriority();
}

void sub_100015B90()
{
}

NSNumber sub_100015BA0()
{
  return Double._bridgeToObjectiveC()();
}

uint64_t sub_100015BB0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100015BC0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100015BD0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100015BE0()
{
  return PRPosterBoundingShape.contactsUIBoundingShape.getter();
}

uint64_t sub_100015BF0()
{
  return UISheetPresentationController.preferredCornerRadius.setter();
}

NSValue sub_100015C00()
{
  return CGRect._bridgeToObjectiveC()();
}

uint64_t sub_100015C10()
{
  return CGSize.debugDescription.getter();
}

UIColor sub_100015C20(Swift::OpaquePointer avatarColorDescription)
{
  return UIColor.init(avatarColorDescription:)(avatarColorDescription);
}

uint64_t sub_100015C30()
{
  return UIColor.avatarColorDescription.getter();
}

NSNumber sub_100015C40(Swift::Double floatLiteral)
{
  return NSNumber.init(floatLiteral:)(floatLiteral);
}

NSNumber sub_100015C50(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t sub_100015C60()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100015C70()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t sub_100015C80()
{
  return Optional.debugDescription.getter();
}

uint64_t sub_100015C90()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100015CA0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100015CB0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

Swift::Int sub_100015CC0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100015CD0()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100015CE0()
{
  return AnyHashable.init<A>(_:)();
}

void sub_100015CF0(Swift::Int a1)
{
}

uint64_t sub_100015D00()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100015D10()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100015D20()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100015D30()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100015D40()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100015D50()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100015D60()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100015D70()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100015D80()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t sub_100015D90()
{
  return ContinuousClock.init()();
}

uint64_t sub_100015DA0()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t sub_100015DB0()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t sub_100015DC0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100015DD0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100015DE0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100015DF0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100015E00()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100015E10()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100015E20()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_100015E30()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100015E40()
{
  return dispatch thunk of Clock.now.getter();
}

uint64_t sub_100015E60()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100015E70()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100015E80()
{
  return Hasher._finalize()();
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return _CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, space, bitmapInfo);
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return _CGImageCreateWithImageInRect(image, rect);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return _CGImageGetHeight(image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return _CGImageGetWidth(image);
}

void CGImageRelease(CGImageRef image)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectIntegral(CGRect rect)
{
  return _CGRectIntegral(rect);
}

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return _CGSizeEqualToSize(size1, size2);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PRSheetCornerRadius()
{
  return _PRSheetCornerRadius();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend_drawAtPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawAtPoint:");
}

id objc_msgSend_imageOrientation(void *a1, const char *a2, ...)
{
  return _[a1 imageOrientation];
}

id objc_msgSend_imageWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithCGImage:scale:orientation:");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_setMinimumHorizontalMargin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumHorizontalMargin:");
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSize:");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_transparencyInsetsForImage_requiringFullOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transparencyInsetsForImage:requiringFullOpacity:");
}

id objc_msgSend_trimmedImageByTrimmingTransparentPixelsFromImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trimmedImageByTrimmingTransparentPixelsFromImage:");
}