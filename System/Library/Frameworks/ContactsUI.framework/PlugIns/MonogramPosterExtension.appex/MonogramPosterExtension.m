void *sub_100001EB8()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSString v7;
  id v8;
  void *v9;
  NSString v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSString v21;
  id v22;
  void *v23;
  NSString v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v33;

  v0[7] = 0x4200000042000000;
  v0[8] = 0;
  v0[9] = 0;
  v0[10] = 70;
  v1 = swift_unknownObjectRetain();
  v2 = sub_100009950(v1);
  v3 = objc_allocWithZone((Class)MTLRenderPipelineDescriptor);
  swift_retain();
  v4 = [v3 init];
  v5 = (void *)v2[3];
  if (!v5)
  {
    __break(1u);
    goto LABEL_17;
  }
  v6 = v4;
  swift_unknownObjectRetain();
  v7 = sub_100016330();
  v8 = [v5 newFunctionWithName:v7];

  swift_unknownObjectRelease();
  [v6 setVertexFunction:v8];
  swift_unknownObjectRelease();
  v9 = (void *)v2[3];
  if (!v9)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  swift_unknownObjectRetain();
  v10 = sub_100016330();
  v11 = [v9 newFunctionWithName:v10];

  swift_unknownObjectRelease();
  [v6 setFragmentFunction:v11];
  swift_unknownObjectRelease();
  v12 = [v6 colorAttachments];
  v13 = [v12 objectAtIndexedSubscript:0];

  if (!v13)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  [v13 setPixelFormat:v2[10]];

  v14 = (void *)v2[2];
  if (!v14)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v33 = 0;
  v15 = [v14 newRenderPipelineStateWithDescriptor:v6 error:&v33];
  if (v15)
  {
    v16 = v33;
  }
  else
  {
    v17 = v33;
    sub_1000160D0();

    swift_willThrow();
    swift_errorRelease();
  }
  v2[8] = v15;
  swift_unknownObjectRelease();
  v18 = [objc_allocWithZone((Class)MTLRenderPipelineDescriptor) init];
  v19 = (void *)v2[3];
  if (!v19) {
    goto LABEL_20;
  }
  v20 = v18;
  swift_unknownObjectRetain();
  v21 = sub_100016330();
  v22 = [v19 newFunctionWithName:v21];

  swift_unknownObjectRelease();
  [v20 setVertexFunction:v22];
  swift_unknownObjectRelease();
  v23 = (void *)v2[3];
  if (!v23)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_unknownObjectRetain();
  v24 = sub_100016330();
  v25 = [v23 newFunctionWithName:v24];

  swift_unknownObjectRelease();
  [v20 setFragmentFunction:v25];
  swift_unknownObjectRelease();
  v26 = [v20 colorAttachments];
  v27 = [v26 objectAtIndexedSubscript:0];

  if (!v27)
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
  }
  [v27 setPixelFormat:v2[10]];

  v28 = (void *)v2[2];
  if (!v28) {
    goto LABEL_23;
  }
  v33 = 0;
  v29 = [v28 newRenderPipelineStateWithDescriptor:v20 error:&v33];
  if (v29)
  {
    v30 = v33;

    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    v31 = v33;
    sub_1000160D0();

    swift_willThrow();
    swift_release();
    swift_unknownObjectRelease();
    swift_errorRelease();
  }
  v2[9] = v29;
  swift_unknownObjectRelease();
  return v2;
}

void sub_100002340(void *a1)
{
  if (a1)
  {
    v2 = *(void **)(v1 + 32);
    if (!v2)
    {
      __break(1u);
      goto LABEL_37;
    }
    swift_unknownObjectRetain();
    id v4 = [v2 commandBuffer];
    if (v4)
    {
      v5 = v4;
      id v6 = objc_msgSend(self, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", *(void *)(v1 + 80), objc_msgSend(a1, "width"), objc_msgSend(a1, "height"), 0);
      [v6 setUsage:7];
      [v6 setStorageMode:2];
      v7 = *(void **)(v1 + 16);
      if (v7)
      {
        id v8 = [v7 newTextureWithDescriptor:v6];
        id v9 = [objc_allocWithZone((Class)MTLRenderPassDescriptor) init];
        id v10 = [v9 colorAttachments];
        id v11 = [v10 objectAtIndexedSubscript:0];

        if (v11)
        {
          [v11 setTexture:v8];

          id v12 = [v5 renderCommandEncoderWithDescriptor:v9];
          if (v12)
          {
            if (!*(void *)(v1 + 64))
            {
LABEL_45:
              __break(1u);
              goto LABEL_46;
            }
            v13 = v12;
            objc_msgSend(v12, "setRenderPipelineState:");
            [v13 setVertexBuffer:*(void *)(v1 + 40) offset:0 atIndex:0];
            [v13 setVertexBuffer:*(void *)(v1 + 48) offset:0 atIndex:1];
            [v13 setFragmentTexture:a1 atIndex:0];
            [v13 drawPrimitives:4 vertexStart:0 vertexCount:4];
            [v13 endEncoding];
            swift_unknownObjectRelease();
          }
          v14 = *(void **)(v1 + 16);
          if (v14)
          {
            id v15 = [v14 newTextureWithDescriptor:v6];
            id v16 = [v5 blitCommandEncoder];
            if (v16)
            {
              if (!v8)
              {
LABEL_46:
                __break(1u);
                goto LABEL_47;
              }
              if (!v15)
              {
LABEL_47:
                __break(1u);
LABEL_48:
                __break(1u);
                return;
              }
              v17 = v16;
              [v16 copyFromTexture:v8 toTexture:v15];
              [v17 endEncoding];
              swift_unknownObjectRelease();
            }
            uint64_t v18 = *(void *)(v1 + 16);
            if (v18)
            {
              id v43 = [objc_allocWithZone((Class)MPSImageMultiply) initWithDevice:v18];
              v19 = *(void **)(v1 + 16);
              if (v19)
              {
                id v20 = [v19 newTextureWithDescriptor:v6];
                float v21 = *(float *)(v1 + 56);
                id v44 = v5;
                v42 = v9;
                if (v21 >= 1.0)
                {
                  do
                  {
                    uint64_t v22 = *(void *)(v1 + 16);
                    if (!v22)
                    {
                      __break(1u);
LABEL_33:
                      __break(1u);
LABEL_34:
                      __break(1u);
LABEL_35:
                      __break(1u);
                    }
                    id v23 = objc_allocWithZone((Class)MPSImageGaussianBlur);
                    *(float *)&double v24 = v21;
                    id v25 = [v23 initWithDevice:v22 sigma:v24];
                    [v25 setEdgeMode:1];
                    if (!v15) {
                      goto LABEL_33;
                    }
                    if (!v20) {
                      goto LABEL_34;
                    }
                    [v25 encodeToCommandBuffer:v5 sourceTexture:v15 destinationTexture:v20];
                    if (!v8) {
                      goto LABEL_35;
                    }
                    swift_unknownObjectRetain();
                    swift_unknownObjectRetain();
                    swift_unknownObjectRetain();
                    [v43 encodeToCommandBuffer:v5 primaryTexture:v20 secondaryTexture:v8 destinationTexture:v15];
                    swift_unknownObjectRelease();
                    swift_unknownObjectRelease();
                    swift_unknownObjectRelease();

                    float v21 = v21 * 0.5;
                  }
                  while (v21 >= 1.0);
                  float v21 = *(float *)(v1 + 56);
                }
                *(float *)(v1 + 60) = v21;
                v26 = *(void **)(v1 + 16);
                if (v26)
                {
                  id v27 = [v26 newTextureWithDescriptor:v6];
                  if (v27)
                  {
                    v28 = v27;
                    id v29 = [v27 width];
                    id v30 = [v28 height];
                    v31.i64[0] = (uint64_t)v29;
                    v31.i64[1] = (uint64_t)v30;
                    __asm { FMOV            V1.2S, #1.0 }
                    *(float32x2_t *)v31.i8 = vdiv_f32(_D1, vcvt_f32_f64(vcvtq_f64_s64(v31)));
                    v31.i64[1] = *(unsigned int *)(v1 + 60);
                    int64x2_t v45 = v31;
                    id v37 = [objc_allocWithZone((Class)MTLRenderPassDescriptor) init];
                    id v38 = [v37 colorAttachments];
                    id v39 = [v38 objectAtIndexedSubscript:0];

                    if (v39)
                    {
                      [v39 setTexture:v28];

                      id v40 = [v44 renderCommandEncoderWithDescriptor:v37];
                      if (!v40)
                      {
LABEL_29:
                        [v44 commit];
                        [v44 waitUntilCompleted];

                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();

                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        return;
                      }
                      if (*(void *)(v1 + 72))
                      {
                        v41 = v40;
                        objc_msgSend(v40, "setRenderPipelineState:");
                        [v41 setVertexBuffer:*(void *)(v1 + 40) offset:0 atIndex:0];
                        [v41 setVertexBuffer:*(void *)(v1 + 48) offset:0 atIndex:1];
                        [v41 setFragmentTexture:v15 atIndex:0];
                        [v41 setFragmentTexture:v8 atIndex:1];
                        [v41 setFragmentBytes:&v45 length:16 atIndex:0];
                        [v41 drawPrimitives:4 vertexStart:0 vertexCount:4];
                        [v41 endEncoding];
                        swift_unknownObjectRelease();
                        goto LABEL_29;
                      }
                      goto LABEL_48;
                    }
                    goto LABEL_44;
                  }
LABEL_43:
                  __break(1u);
LABEL_44:
                  __break(1u);
                  goto LABEL_45;
                }
LABEL_42:
                __break(1u);
                goto LABEL_43;
              }
LABEL_41:
              __break(1u);
              goto LABEL_42;
            }
LABEL_40:
            __break(1u);
            goto LABEL_41;
          }
LABEL_39:
          __break(1u);
          goto LABEL_40;
        }
LABEL_38:
        __break(1u);
        goto LABEL_39;
      }
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    swift_unknownObjectRelease();
  }
}

uint64_t sub_1000029DC()
{
  swift_unknownObjectRelease();

  return swift_unknownObjectRelease();
}

uint64_t sub_100002A0C()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_100002A5C()
{
  sub_100002A0C();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NormalGenerator()
{
  return self;
}

void type metadata accessor for simd_quatf(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for SimulationUniforms(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_100002B00(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_100002B14(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100002B34(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 56) = 0;
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
  *(unsigned char *)(result + 64) = v3;
  return result;
}

void type metadata accessor for simd_float4x4(uint64_t a1)
{
}

void type metadata accessor for MTLPixelFormat(uint64_t a1)
{
}

uint64_t sub_100002B98(uint64_t a1, uint64_t a2)
{
  return sub_100002D04(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100002BB0(uint64_t a1, id *a2)
{
  uint64_t result = sub_100016340();
  *a2 = 0;
  return result;
}

uint64_t sub_100002C28(uint64_t a1, id *a2)
{
  char v3 = sub_100016350();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100002CA8@<X0>(void *a1@<X8>)
{
  sub_100016360();
  NSString v2 = sub_100016330();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100002CEC(uint64_t a1, uint64_t a2)
{
  return sub_100002D04(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100002D04(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_100016360();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100002D48()
{
  sub_100016360();
  sub_1000163A0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100002D9C()
{
  sub_100016360();
  sub_100016690();
  sub_1000163A0();
  Swift::Int v0 = sub_1000166C0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100002E10()
{
  uint64_t v0 = sub_100016360();
  uint64_t v2 = v1;
  if (v0 == sub_100016360() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_100016670();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100002E9C@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100016330();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100002EE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100016360();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100002F10(uint64_t a1)
{
  uint64_t v2 = sub_1000030F8(&qword_100029940);
  uint64_t v3 = sub_1000030F8(&qword_100028E20);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

__n128 sub_100002FA8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100002FB4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100002FD4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

__n128 sub_100003014(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100003020(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100003040(uint64_t result, int a2, int a3)
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

void type metadata accessor for Key(uint64_t a1)
{
}

uint64_t sub_100003090()
{
  return sub_1000030F8(&qword_100028E00);
}

uint64_t sub_1000030C4()
{
  return sub_1000030F8(&qword_100028E08);
}

uint64_t sub_1000030F8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Key(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000313C()
{
  return sub_1000030F8((unint64_t *)&unk_100028E10);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_100003184(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1000031D8@<X0>(uint64_t *a1@<X8>)
{
  sub_1000162D0();
  swift_allocObject();
  sub_1000162E0();
  sub_1000162A0();
  swift_allocObject();
  swift_retain();
  sub_1000162B0();
  sub_1000036B4(&qword_100028F10);
  sub_100016110();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100017370;
  sub_1000036F8(&qword_100028F18, (void (*)(uint64_t))&type metadata accessor for PRRenderingConfiguration);
  swift_retain();
  swift_retain();
  sub_100016100();
  sub_1000036F8(&qword_100028F20, (void (*)(uint64_t))&type metadata accessor for PREditingConfiguration);
  swift_retain();
  sub_100016100();
  swift_release_n();
  uint64_t result = swift_release_n();
  *a1 = v2;
  return result;
}

id sub_100003400()
{
  return sub_100003430((uint64_t (*)(void))type metadata accessor for MonogramPosterRenderer);
}

id sub_100003418()
{
  return sub_100003430((uint64_t (*)(void))type metadata accessor for MonogramPosterEditor);
}

id sub_100003430(uint64_t (*a1)(void))
{
  id v1 = objc_allocWithZone((Class)a1(0));

  return [v1 init];
}

uint64_t sub_100003474()
{
  return swift_release();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000035D0()
{
  unint64_t result = qword_100028EF0;
  if (!qword_100028EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028EF0);
  }
  return result;
}

uint64_t sub_100003624(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

ValueMetadata *type metadata accessor for MonogramPosterExtension()
{
  return &type metadata for MonogramPosterExtension;
}

uint64_t sub_10000367C()
{
  return *(void *)(*(void *)(swift_getOpaqueTypeConformance2() + 8) + 8);
}

uint64_t sub_1000036B4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000036F8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100003740()
{
  return sub_100003774(&qword_100028F28);
}

uint64_t sub_100003774(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003624(&qword_100028F00);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1000037BC()
{
  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for MonogramPosterBackgroundViewController();
  objc_msgSendSuper2(&v16, "viewDidLoad");
  id v1 = [v0 view];
  if (!v1)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v2 = v1;
  [v1 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  id v11 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BackgroundSimulationView(0)), "initWithFrame:", v4, v6, v8, v10);
  uint64_t v12 = OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_simulationView;
  v13 = *(void **)&v0[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_simulationView];
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_simulationView] = v11;

  id v14 = [v0 view];
  if (!v14)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (*(void *)&v0[v12])
  {
    id v15 = v14;
    objc_msgSend(v14, "addSubview:");

    return;
  }
LABEL_7:
  __break(1u);
}

void sub_100003920()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_topBackgroundColor);
  uint64_t v3 = OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_backgroundColor;
  double v4 = *(void **)(v0 + OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_backgroundColor);
  id v5 = v2;
  id v6 = v4;
  sub_100007DC8();

  if (qword_100028B30 != -1) {
    swift_once();
  }
  double v7 = (void *)swift_bridgeObjectRetain();
  sub_1000082F4(v7);
  long double __x = v8;
  swift_bridgeObjectRelease();
  pow(__x, 10.0);
  pow(1.0 - __x, 10.0);
  if (qword_100028B38 != -1) {
    swift_once();
  }
  double v9 = (void *)swift_bridgeObjectRetain();
  sub_1000082F4(v9);
  float64x2_t __xa = v10;
  swift_bridgeObjectRelease();
  v11.f64[0] = sub_10000853C((float64x2_t)0, 0.0, __xa);
  float64x2_t v12 = v11;
  __asm { FMOV            V0.2D, #1.0 }
  float64_t v18 = sub_1000085F0(_Q0, _Q0.f64[0], v12);
  id v22 = [objc_allocWithZone((Class)UIColor) initWithRed:v18 green:v19 blue:v20 alpha:v21];
  id v23 = *(id *)(v1 + v3);
  id v24 = v5;
  id v25 = v23;
  id v26 = v22;
  id v27 = v24;
  id v28 = v25;
  id v29 = v26;
  id v30 = sub_100016270();
  os_log_type_t v31 = sub_100016490();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = swift_slowAlloc();
    uint64_t __xb = v1;
    v33 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v32 = 138412802;
    id v34 = v27;
    sub_100016520();
    void *v33 = v27;

    *(_WORD *)(v32 + 12) = 2112;
    id v35 = v29;
    sub_100016520();
    v33[1] = v29;

    *(_WORD *)(v32 + 22) = 2112;
    id v36 = v28;
    sub_100016520();
    v33[2] = v28;

    _os_log_impl((void *)&_mh_execute_header, v30, v31, "Updating background layer with top color: %@, mid color: %@, bottom color: %@", (uint8_t *)v32, 0x20u);
    sub_1000036B4(&qword_100028FA0);
    swift_arrayDestroy();
    uint64_t v1 = __xb;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v37 = *(void **)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_simulationView);
  if (v37 && (id v38 = [v37 layer]) != 0)
  {
    id v39 = v38;
    type metadata accessor for BackgroundSimulationLayer(0);
    id v40 = (void *)swift_dynamicCastClass();
    if (v40)
    {
      id v41 = v39;
      sub_100007468(v27, v29, v28);
    }
  }
  else
  {
    id v40 = 0;
  }
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_1000048A0(v27, v29, v28);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

id sub_100003D80(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_simulationView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v6 = OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_backgroundColor;
  double v7 = self;
  double v8 = v3;
  *(void *)&v3[v6] = [v7 grayColor];
  uint64_t v9 = OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_topBackgroundColor;
  *(void *)&v8[v9] = [v7 grayColor];
  v8[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_isSnapshot] = 0;
  *(void *)&v8[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController__backgroundColorLayer] = 0;
  sub_100016280();

  if (a2)
  {
    NSString v10 = sub_100016330();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  v13.receiver = v8;
  v13.super_class = (Class)type metadata accessor for MonogramPosterBackgroundViewController();
  id v11 = objc_msgSendSuper2(&v13, "initWithNibName:bundle:", v10, a3);

  return v11;
}

id sub_100003F5C(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_simulationView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v3 = OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_backgroundColor;
  double v4 = self;
  id v5 = v1;
  *(void *)&v1[v3] = [v4 grayColor];
  uint64_t v6 = OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_topBackgroundColor;
  *(void *)&v5[v6] = [v4 grayColor];
  v5[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_isSnapshot] = 0;
  *(void *)&v5[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController__backgroundColorLayer] = 0;
  sub_100016280();

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for MonogramPosterBackgroundViewController();
  id v7 = objc_msgSendSuper2(&v9, "initWithCoder:", a1);

  return v7;
}

id sub_1000040C4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MonogramPosterBackgroundViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000041BC()
{
  return type metadata accessor for MonogramPosterBackgroundViewController();
}

uint64_t type metadata accessor for MonogramPosterBackgroundViewController()
{
  uint64_t result = qword_100028F90;
  if (!qword_100028F90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100004210()
{
  uint64_t result = sub_100016290();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000042D0(uint64_t a1)
{
  return a1;
}

void sub_1000042F8(void *a1)
{
  [v1 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v3 = self;
  sub_1000036B4(&qword_100029910);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000174A0;
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
  sub_100016410();
  sub_100004550();
  Class isa = sub_100016400().super.isa;
  swift_bridgeObjectRelease();
  [v3 activateConstraints:isa];
}

unint64_t sub_100004550()
{
  unint64_t result = qword_100028FA8;
  if (!qword_100028FA8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100028FA8);
  }
  return result;
}

void sub_100004590()
{
  unint64_t v1 = v0;
  objc_super v2 = sub_100016270();
  os_log_type_t v3 = sub_100016490();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 67109120;
    sub_100016520();

    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Updating monogram layer with isSnapshot: %{BOOL}d", v4, 8u);
    swift_slowDealloc();
  }
  else
  {
  }
  id v5 = *(void **)&v1[OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_simulationView];
  if (v5)
  {
    unint64_t v6 = v1[OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_isSnapshot];
    id v7 = v5;
    sub_100005868((id)v6);
  }
}

void sub_1000046B4()
{
  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for MonogramPosterViewController();
  objc_msgSendSuper2(&v16, "viewDidLoad");
  id v1 = [v0 view];
  if (!v1)
  {
    __break(1u);
    goto LABEL_6;
  }
  objc_super v2 = v1;
  [v1 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  id v11 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MonogramSimulationView(0)), "initWithFrame:", v4, v6, v8, v10);
  uint64_t v12 = OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_simulationView;
  id v13 = *(void **)&v0[OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_simulationView];
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_simulationView] = v11;

  id v14 = [v0 view];
  if (!v14)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (*(void *)&v0[v12])
  {
    id v15 = v14;
    objc_msgSend(v14, "addSubview:");

    sub_100004FCC();
    return;
  }
LABEL_7:
  __break(1u);
}

void sub_1000048A0(void *a1, void *a2, void *a3)
{
  uint64_t v4 = v3;
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = v7;
  id v11 = v8;
  id v12 = v9;
  id v13 = sub_100016270();
  os_log_type_t v14 = sub_100016490();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315650;
    id v16 = [v10 debugDescription];
    uint64_t v31 = v4;
    uint64_t v17 = sub_100016360();
    unint64_t v19 = v18;

    sub_1000152CC(v17, v19, &v33);
    sub_100016520();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    id v20 = [v11 debugDescription];
    uint64_t v21 = sub_100016360();
    id v32 = v10;
    unint64_t v23 = v22;

    sub_1000152CC(v21, v23, &v33);
    sub_100016520();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 22) = 2080;
    id v24 = [v12 debugDescription];
    uint64_t v25 = sub_100016360();
    unint64_t v27 = v26;

    uint64_t v4 = v31;
    sub_1000152CC(v25, v27, &v33);
    id v10 = v32;
    sub_100016520();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Updating monogram layer with top color: %s, mid color: %s, bottom color: %s", (uint8_t *)v15, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v28 = *(void **)(v4 + OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_simulationView);
  if (v28)
  {
    id v29 = [v28 layer];
    if (v29)
    {
      id v30 = v29;
      type metadata accessor for BackgroundSimulationLayer(0);
      if (swift_dynamicCastClass()) {
        sub_100007468(v10, v11, v12);
      }
    }
  }
}

void sub_100004BB8()
{
  id v1 = v0;
  id v2 = [v0 view];
  if (v2)
  {
    uint64_t v3 = v2;
    [v2 bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    v18.origin.x = v5;
    v18.origin.y = v7;
    v18.size.width = v9;
    v18.size.height = v11;
    double Width = CGRectGetWidth(v18);
    id v16 = sub_100009B74(Width);
    id v13 = *(void **)&v1[OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_simulationView];
    if (v13)
    {
      id v14 = [v13 layer];
      if (v14)
      {
        uint64_t v15 = v14;
        type metadata accessor for MonogramSimulationLayer(0);
        if (swift_dynamicCastClass()) {
          sub_1000094C4(v16);
        }
      }
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_100004CC4()
{
  id v1 = [v0 view];
  if (!v1)
  {
    __break(1u);
    goto LABEL_14;
  }
  id v2 = v1;
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_hiddenLabel];
  [v1 addSubview:v3];

  id v4 = [v0 view];
  if (!v4)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  CGFloat v5 = v4;
  [v4 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v34.origin.x = v7;
  v34.origin.y = v9;
  v34.size.width = v11;
  v34.size.height = v13;
  double Height = CGRectGetHeight(v34);
  id v15 = [v0 view];
  if (!v15)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return;
  }
  id v16 = v15;
  id v17 = [v15 window];

  if (v17)
  {
    [v17 bounds];
    double Height = CGRectGetHeight(v35);
  }
  sub_1000036B4(&qword_100029910);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1000174C0;
  id v19 = [v3 centerXAnchor];
  id v20 = [v0 view];
  if (!v20) {
    goto LABEL_16;
  }
  uint64_t v21 = v20;
  id v22 = [v20 centerXAnchor];

  id v23 = [v19 constraintEqualToAnchor:v22];
  *(void *)(v18 + 32) = v23;
  v32[3] = sub_10000582C(0, &qword_100029018);
  v32[0] = v3;
  id v24 = v3;
  id v25 = [v0 view];
  if (v25)
  {
    id v26 = v25;
    *((void *)&v31 + 1) = sub_10000582C(0, (unint64_t *)&unk_100029620);
    *(void *)&long long v30 = v26;
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
  }
  sub_10000582C(0, (unint64_t *)&qword_100028FA8);
  sub_100016230();
  *(void *)(v18 + 40) = sub_10000A154(v32, 10, 0, &v30, 4, 1.0, -(Height * (1.0 - v27)));
  v32[0] = v18;
  sub_100016410();
  id v28 = self;
  Class isa = sub_100016400().super.isa;
  swift_bridgeObjectRelease();
  [v28 activateConstraints:isa];
}

void sub_100004FCC()
{
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_hiddenLabel);
  swift_bridgeObjectRetain();
  NSString v2 = sub_100016330();
  swift_bridgeObjectRelease();
  int v3 = CNStringContainsChineseJapaneseKoreanCharacters();

  if (v3) {
    double v4 = 180.0;
  }
  else {
    double v4 = 210.0;
  }
  id v5 = [*(id *)(v0 + OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_monogramFont) fontDescriptor];
  id v6 = [self fontWithDescriptor:v5 size:v4];

  [v1 setFont:v6];
  [v1 setTextAlignment:1];
  [v1 setTranslatesAutoresizingMaskIntoConstraints:0];
  CGFloat v7 = self;
  id v8 = [v7 whiteColor];
  [v1 setTintColor:v8];

  id v9 = [v7 whiteColor];
  [v1 setTextColor:v9];
}

id sub_100005180(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_simulationView] = 0;
  id v6 = self;
  uint64_t v7 = PRPosterRoleIncomingCall;
  id v8 = v3;
  id v9 = objc_msgSend(v6, "pr_defaultTimeFontForRole:", v7);
  if (!v9) {
    id v9 = objc_msgSend(v6, "pr_defaultTimeFont");
  }
  *(void *)&v8[OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_monogramFont] = v9;
  double v10 = &v8[OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_monogramString];
  *(void *)double v10 = 0;
  *((void *)v10 + 1) = 0xE000000000000000;
  v8[OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_isSnapshot] = 0;
  sub_100016280();
  uint64_t v11 = OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_hiddenLabel;
  *(void *)&v8[v11] = [objc_allocWithZone((Class)UILabel) init];

  if (a2)
  {
    NSString v12 = sub_100016330();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }
  v15.receiver = v8;
  v15.super_class = (Class)type metadata accessor for MonogramPosterViewController();
  id v13 = objc_msgSendSuper2(&v15, "initWithNibName:bundle:", v12, a3);

  return v13;
}

id sub_10000537C(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_simulationView] = 0;
  int v3 = self;
  uint64_t v4 = PRPosterRoleIncomingCall;
  id v5 = v1;
  id v6 = objc_msgSend(v3, "pr_defaultTimeFontForRole:", v4);
  if (!v6) {
    id v6 = objc_msgSend(v3, "pr_defaultTimeFont");
  }
  *(void *)&v5[OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_monogramFont] = v6;
  uint64_t v7 = &v5[OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_monogramString];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0xE000000000000000;
  v5[OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_isSnapshot] = 0;
  sub_100016280();
  uint64_t v8 = OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_hiddenLabel;
  *(void *)&v5[v8] = [objc_allocWithZone((Class)UILabel) init];

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for MonogramPosterViewController();
  id v9 = objc_msgSendSuper2(&v11, "initWithCoder:", a1);

  return v9;
}

id sub_1000054FC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MonogramPosterViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000055E8()
{
  return type metadata accessor for MonogramPosterViewController();
}

uint64_t type metadata accessor for MonogramPosterViewController()
{
  uint64_t result = qword_100029008;
  if (!qword_100029008) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000563C()
{
  uint64_t result = sub_100016290();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_1000056F8(void *a1)
{
  uint64_t v2 = OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_monogramFont;
  int v3 = *(void **)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_monogramFont);
  *(void *)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_monogramFont) = a1;
  id v4 = a1;

  id v5 = *(void **)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_hiddenLabel);
  swift_bridgeObjectRetain();
  NSString v6 = sub_100016330();
  swift_bridgeObjectRelease();
  int v7 = CNStringContainsChineseJapaneseKoreanCharacters();

  if (v7) {
    double v8 = 180.0;
  }
  else {
    double v8 = 210.0;
  }
  id v9 = [*(id *)(v1 + v2) fontDescriptor];
  id v10 = [self fontWithDescriptor:v9 size:v8];

  [v5 setFont:v10];
}

uint64_t sub_10000582C(uint64_t a1, unint64_t *a2)
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

id sub_100005868(id result)
{
  *(unsigned char *)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension24BackgroundSimulationView_isSnapshot) = (_BYTE)result;
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension24BackgroundSimulationView_motion);
  if (v2)
  {
    int v3 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC23MonogramPosterExtension6Motion_isSnapshot);
    *(unsigned char *)(v2 + OBJC_IVAR____TtC23MonogramPosterExtension6Motion_isSnapshot) = result & 1;
    if (v3 != (result & 1))
    {
      id v4 = *(void **)(v2 + OBJC_IVAR____TtC23MonogramPosterExtension6Motion_motion);
      id v5 = &selRef_stopDeviceMotionUpdates;
      if ((result & 1) == 0) {
        id v5 = &selRef_startDeviceMotionUpdates;
      }
      return [v4 *v5];
    }
  }
  return result;
}

id sub_1000058DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100016270();
  os_log_type_t v3 = sub_1000164C0();
  if (os_log_type_enabled(v2, v3))
  {
    id v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Deinit", v4, 2u);
    swift_slowDealloc();
  }

  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for BackgroundSimulationView(0);
  return objc_msgSendSuper2(&v6, "dealloc");
}

uint64_t sub_100005B14()
{
  return type metadata accessor for BackgroundSimulationView(0);
}

uint64_t type metadata accessor for BackgroundSimulationView(uint64_t a1)
{
  return sub_1000065CC(a1, (uint64_t *)&unk_100029050);
}

char *sub_100005B3C(double a1, double a2, double a3, double a4)
{
  id v9 = v4;
  sub_100016280();
  *(void *)&v9[OBJC_IVAR____TtC23MonogramPosterExtension24BackgroundSimulationView_motion] = 0;
  v9[OBJC_IVAR____TtC23MonogramPosterExtension24BackgroundSimulationView_isSnapshot] = 0;

  v20.receiver = v9;
  v20.super_class = (Class)type metadata accessor for BackgroundSimulationView(0);
  id v10 = (char *)objc_msgSendSuper2(&v20, "initWithFrame:", a1, a2, a3, a4);
  id v11 = [v10 layer];
  id v12 = [self mainScreen];
  [v12 scale];
  double v14 = v13;

  [v11 setContentsScale:v14];
  id v15 = [v10 layer];
  [v15 setAllowsDisplayCompositing:0];

  type metadata accessor for Motion();
  swift_allocObject();
  uint64_t v16 = sub_10000B504();

  uint64_t v17 = OBJC_IVAR____TtC23MonogramPosterExtension24BackgroundSimulationView_motion;
  *(void *)&v10[OBJC_IVAR____TtC23MonogramPosterExtension24BackgroundSimulationView_motion] = v16;
  swift_release();
  uint64_t v18 = *(void *)&v10[v17];
  if (v18)
  {
    *(void *)(v18 + OBJC_IVAR____TtC23MonogramPosterExtension6Motion_delegate + 8) = &off_1000213E0;
    swift_unknownObjectWeakAssign();
  }
  return v10;
}

uint64_t sub_100005E18()
{
  uint64_t result = sub_100016290();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_100005EBC(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4)
{
  id v13 = [v4 layer];
  type metadata accessor for BackgroundSimulationLayer(0);
  uint64_t v5 = swift_dynamicCastClass();
  if (v5)
  {
    objc_super v6 = (__n128 *)(v5 + OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_rotationMatrix);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0x3CF5C28Fu);
    if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v7, vabdq_f32(*(float32x4_t *)(v5+ OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_rotationMatrix+ 16), a2)), (int8x16_t)vcgeq_f32(v7, vabdq_f32(*(float32x4_t *)(v5+ OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_rotationMatrix), a1))), vandq_s8((int8x16_t)vcgeq_f32(v7, vabdq_f32(*(float32x4_t *)(v5
                                                                   + OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_rotationMatrix
                                                                   + 32),
                                                    a3)),
                                     (int8x16_t)vcgeq_f32(v7, vabdq_f32(*(float32x4_t *)(v5+ OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_rotationMatrix+ 48), a4))))) & 0x80000000) == 0)
    {
      *objc_super v6 = (__n128)a1;
      v6[1] = (__n128)a2;
      v6[2] = (__n128)a3;
      v6[3] = (__n128)a4;
      id v8 = [v4 layer];
      [v8 setNeedsDisplay];
    }
  }
}

uint64_t (*sub_100005FD8())()
{
  return j__swift_endAccess;
}

char *sub_100006038()
{
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_commandQueue] = 0;
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_renderPassDescriptor] = 0;
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_cardVertexCoordsBuffer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_cardTextureCoordsBuffer] = 0;
  uint64_t v1 = (uint64_t)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_uniforms];
  sub_1000078A0((uint64_t)v29);
  sub_10000781C((uint64_t)v29, v1);
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_uniformsBuffer] = 0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_rotationMatrix];
  *(_OWORD *)uint64_t v2 = xmmword_100017550;
  *((_OWORD *)v2 + 1) = xmmword_100017560;
  *((_OWORD *)v2 + 2) = xmmword_100017570;
  *((_OWORD *)v2 + 3) = xmmword_100017580;
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_normalTexture] = 0;
  os_log_type_t v3 = v0;
  sub_100016280();
  v3[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_isRenderingPaused] = 0;

  v28.receiver = v3;
  v28.super_class = (Class)type metadata accessor for BackgroundSimulationLayer(0);
  id v4 = (char *)objc_msgSendSuper2(&v28, "init");
  id v5 = [v4 device];
  if (!v5)
  {

    return v4;
  }
  objc_super v6 = v5;
  id v7 = [v5 newCommandQueue];
  *(void *)&v4[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_commandQueue] = v7;
  swift_unknownObjectRelease();
  id v8 = [objc_allocWithZone((Class)MTLRenderPassDescriptor) init];
  uint64_t v9 = OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_renderPassDescriptor;
  id v10 = *(void **)&v4[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_renderPassDescriptor];
  *(void *)&v4[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_renderPassDescriptor] = v8;

  uint64_t result = *(char **)&v4[v9];
  if (result)
  {
    uint64_t result = (char *)[result depthAttachment];
    if (result)
    {
      id v12 = result;
      [result setStoreAction:0];

      __asm { FMOV            V8.2S, #1.0 }
      v26[0] = 0x3F800000BF800000;
      v26[1] = _D8;
      __asm { FMOV            V0.2S, #-1.0 }
      v26[2] = _D0;
      v26[3] = 0xBF8000003F800000;
      id v19 = [v6 newBufferWithBytes:v26 length:32 options:0];
      *(void *)&v4[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_cardVertexCoordsBuffer] = v19;
      swift_unknownObjectRelease();
      v25[0] = 0;
      v25[1] = 1065353216;
      v25[2] = 0x3F80000000000000;
      v25[3] = _D8;
      id v20 = [v6 newBufferWithBytes:v25 length:32 options:0];
      *(void *)&v4[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_cardTextureCoordsBuffer] = v20;
      swift_unknownObjectRelease();
      v27[0] = xmmword_100017550;
      v27[1] = xmmword_100017560;
      v27[2] = xmmword_100017570;
      v27[3] = xmmword_100017580;
      memset(&v27[4], 0, 80);
      sub_100007A1C((uint64_t)v27);
      uint64_t v21 = (uint64_t)&v4[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_uniforms];
      swift_beginAccess();
      sub_10000781C((uint64_t)v27, v21);
      swift_beginAccess();
      id v22 = [v6 newBufferWithBytes:v21 length:144 options:0];
      swift_endAccess();
      *(void *)&v4[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_uniformsBuffer] = v22;
      swift_unknownObjectRelease();
      id v23 = v4;
      CGColorSpaceRef v24 = CGColorSpaceCreateWithName(kCGColorSpaceExtendedDisplayP3);
      [v23 setColorspace:v24];
      swift_unknownObjectRelease();

      return v4;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_100006408()
{
  id result = *(id *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_cardVertexCoordsBuffer];
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  [result setPurgeableState:4];
  id result = *(id *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_cardTextureCoordsBuffer];
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  [result setPurgeableState:4];
  id result = *(id *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_uniformsBuffer];
  if (result)
  {
    [result setPurgeableState:4];
    v2.receiver = v0;
    v2.super_class = (Class)type metadata accessor for BackgroundSimulationLayer(0);
    return objc_msgSendSuper2(&v2, "dealloc");
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_1000065A4()
{
  return type metadata accessor for BackgroundSimulationLayer(0);
}

uint64_t type metadata accessor for BackgroundSimulationLayer(uint64_t a1)
{
  return sub_1000065CC(a1, qword_1000290C8);
}

uint64_t sub_1000065CC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000662C()
{
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_commandQueue] = 0;
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_renderPassDescriptor] = 0;
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_cardVertexCoordsBuffer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_cardTextureCoordsBuffer] = 0;
  uint64_t v1 = (uint64_t)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_uniforms];
  sub_1000078A0((uint64_t)v3);
  sub_10000781C((uint64_t)v3, v1);
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_uniformsBuffer] = 0;
  objc_super v2 = &v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_rotationMatrix];
  _OWORD *v2 = xmmword_100017550;
  v2[1] = xmmword_100017560;
  v2[2] = xmmword_100017570;
  v2[3] = xmmword_100017580;
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_normalTexture] = 0;
  sub_100016280();
  v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_isRenderingPaused] = 0;

  sub_100016610();
  __break(1u);
}

uint64_t sub_1000067C0()
{
  sub_1000036B4((uint64_t *)&unk_1000290E0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100017590;
  *(void *)(v1 + 32) = *(void *)(v0
                                   + OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_normalTexture);
  uint64_t v3 = v1;
  sub_100016410();
  swift_unknownObjectRetain();
  return v3;
}

unint64_t sub_100006834()
{
  return 0xD000000000000022;
}

uint64_t sub_100006850(void *a1)
{
  uint64_t v3 = sub_100005FD8();
  id v5 = (_OWORD *)v4;
  sub_10000781C(v4, (uint64_t)v19);
  sub_10000781C((uint64_t)v19, (uint64_t)v20);
  if (sub_100007884((uint64_t)v20) != 1)
  {
    long long v6 = *(_OWORD *)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_rotationMatrix + 16);
    long long v7 = *(_OWORD *)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_rotationMatrix + 32);
    long long v8 = *(_OWORD *)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_rotationMatrix + 48);
    _OWORD *v5 = *(_OWORD *)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_rotationMatrix);
    v5[1] = v6;
    v5[2] = v7;
    v5[3] = v8;
  }
  ((void (*)(unsigned char *, void))v3)(v18, 0);
  uint64_t v9 = sub_100005FD8();
  uint64_t v11 = v10;
  sub_10000781C(v10, (uint64_t)v17);
  sub_10000781C((uint64_t)v17, (uint64_t)v18);
  if (sub_100007884((uint64_t)v18) != 1)
  {
    id v12 = objc_msgSend(objc_msgSend(a1, "texture"), "width");
    swift_unknownObjectRelease();
    id v13 = objc_msgSend(objc_msgSend(a1, "texture"), "height");
    swift_unknownObjectRelease();
    *(float *)&unint64_t v14 = (float)(uint64_t)v12;
    *((float *)&v14 + 1) = (float)(uint64_t)v13;
    *(_OWORD *)(v11 + 64) = v14;
  }
  return ((uint64_t (*)(unsigned char *, void))v9)(v16, 0);
}

void sub_1000069D0(char *a1)
{
  if ((a1[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_isRenderingPaused] & 1) == 0)
  {
    uint64_t v1 = &a1[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_logger];
    objc_super v2 = a1;
    uint64_t v40 = (uint64_t)v1;
    uint64_t v3 = sub_100016270();
    os_log_type_t v4 = sub_1000164A0();
    if (os_log_type_enabled(v3, v4))
    {
      id v5 = (uint8_t *)swift_slowAlloc();
      v39[0] = swift_slowAlloc();
      *(_DWORD *)id v5 = 136315138;
      id v6 = [v2 debugDescription];
      long long v7 = v2;
      uint64_t v8 = sub_100016360();
      unint64_t v10 = v9;

      uint64_t v11 = v8;
      objc_super v2 = v7;
      __src[0] = sub_1000152CC(v11, v10, v39);
      sub_100016520();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Performing Metal rendering in: %s", v5, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v12 = *(void **)&v2[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_commandQueue];
    if (v12)
    {
      id v13 = [v12 commandBuffer];
      if (v13)
      {
        unint64_t v14 = v13;
        if (([v2 isDrawableAvailable] & 1) == 0)
        {
          CGRect v35 = sub_100016270();
          os_log_type_t v36 = sub_1000164C0();
          if (os_log_type_enabled(v35, v36))
          {
            id v37 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v37 = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, v36, "BackgroundSimulationLayer: skipping render because no drawable available", v37, 2u);
            swift_slowDealloc();
          }

          goto LABEL_24;
        }
        id v15 = [v2 nextDrawable];
        if (v15)
        {
          uint64_t v16 = v15;
          sub_1000070A8();
          if (v17)
          {
            uint64_t v18 = v17;
            (*(void (**)(void *))((swift_isaMask & *(void *)v2) + 0x188))(v16);
            uint64_t v40 = OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_uniformsBuffer;
            id v19 = *(void **)&v2[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_uniformsBuffer];
            if (v19)
            {
              id v20 = [(id)swift_unknownObjectRetain() contents];
              id v21 = v19;
              uint64_t v22 = (uint64_t)&v2[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_uniforms];
              swift_beginAccess();
              sub_10000781C(v22, (uint64_t)v39);
              sub_10000781C((uint64_t)v39, (uint64_t)__src);
              memmove(v20, __src, 0x90uLL);
            }
            uint64_t v23 = OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_renderPassDescriptor;
            CGColorSpaceRef v24 = *(void **)&v2[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_renderPassDescriptor];
            if (v24)
            {
              id v25 = [v24 colorAttachments];
              id v26 = [v25 objectAtIndexedSubscript:0];

              if (v26)
              {
                objc_msgSend(v26, "setTexture:", objc_msgSend(v16, "texture"));

                swift_unknownObjectRelease();
                if (*(void *)&v2[v23])
                {
                  id v27 = objc_msgSend(v14, "renderCommandEncoderWithDescriptor:");
                  if (v27)
                  {
                    objc_super v28 = v27;
                    [v27 setRenderPipelineState:v18];
                    [v28 setVertexBuffer:*(void *)&v2[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_cardVertexCoordsBuffer] offset:0 atIndex:0];
                    id v29 = [v28 setVertexBuffer:*(void *)&v2[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_cardTextureCoordsBuffer] offset:0 atIndex:1];
                    long long v30 = v2;
                    uint64_t v31 = (*(uint64_t (**)(id))((swift_isaMask & *(void *)v2) + 0x178))(v29);
                    uint64_t v32 = *(void *)(v31 + 16);
                    if (v32)
                    {
                      uint64_t v33 = 0;
                      do
                      {
                        uint64_t v34 = v33 + 1;
                        objc_msgSend(v28, "setFragmentTexture:atIndex:", *(void *)(v31 + 32 + 8 * v33));
                        uint64_t v33 = v34;
                      }
                      while (v32 != v34);
                    }
                    swift_bridgeObjectRelease();
                    [v28 setFragmentBuffer:*(void *)((char *)v30 + v40) offset:0 atIndex:0];
                    [v28 drawPrimitives:4 vertexStart:0 vertexCount:4];
                    [v28 endEncoding];
                    swift_unknownObjectRelease();
                  }
                  [v14 presentDrawable:v16];
                  [v14 commit];
                  [v14 waitUntilCompleted];
                  swift_unknownObjectRelease();
                  swift_unknownObjectRelease();
                  goto LABEL_24;
                }
LABEL_29:
                __break(1u);
                return;
              }
            }
            else
            {
              __break(1u);
            }
            __break(1u);
            goto LABEL_29;
          }
          swift_unknownObjectRelease();
        }
LABEL_24:
        swift_unknownObjectRelease();
      }
    }
  }
}

uint64_t sub_100006FE8()
{
  uint64_t result = sub_100016290();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_1000070A8()
{
  id v1 = [v0 device];
  if (v1)
  {
    objc_super v2 = v1;
    id v3 = [v1 newDefaultLibrary];
    if (v3)
    {
      os_log_type_t v4 = v3;
      id v5 = [objc_allocWithZone((Class)MTLRenderPipelineDescriptor) init];
      NSString v6 = sub_100016330();
      id v7 = [v4 newFunctionWithName:v6];

      [v5 setVertexFunction:v7];
      uint64_t v8 = swift_unknownObjectRelease();
      (*(void (**)(uint64_t))((swift_isaMask & *v0) + 0x180))(v8);
      NSString v9 = sub_100016330();
      swift_bridgeObjectRelease();
      id v10 = [v4 newFunctionWithName:v9];

      [v5 setFragmentFunction:v10];
      swift_unknownObjectRelease();
      id v11 = [v5 colorAttachments];
      id v12 = [v11 objectAtIndexedSubscript:0];

      if (!v12)
      {
        __break(1u);
        return;
      }
      objc_msgSend(v12, "setPixelFormat:", objc_msgSend(v0, "pixelFormat"));

      id v16 = 0;
      id v13 = [v2 newRenderPipelineStateWithDescriptor:v5 error:&v16];
      id v14 = v16;
      if (v13)
      {
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();

        return;
      }
      id v15 = v14;
      sub_1000160D0();

      swift_willThrow();
      swift_errorRelease();
      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
  }
}

void sub_100007334(void *a1)
{
  objc_super v2 = v1;
  CGColorRef v4 = (CGColorRef)[a1 CGColor];
  id v5 = (CGColorSpace *)[v2 colorspace];
  if (v5)
  {
    NSString v6 = v5;
    id v7 = (CGColor *)[a1 CGColor];
    CGColorRef CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v6, kCGRenderingIntentDefault, v7, 0);

    if (CopyByMatchingToColorSpace)
    {

      CGColorRef v4 = CopyByMatchingToColorSpace;
    }
  }
  uint64_t v9 = sub_100016480();
  if (!v9)
  {

    return;
  }
  unint64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    if (v10 != 1)
    {
      if (v10 >= 3)
      {

        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_12;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_12:
  __break(1u);
}

id sub_100007468(void *a1, void *a2, void *a3)
{
  sub_100007334(a1);
  long long v30 = v7;
  uint64_t v8 = &v3[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_uniforms];
  swift_beginAccess();
  sub_10000781C((uint64_t)v8, (uint64_t)v45);
  sub_10000781C((uint64_t)v45, (uint64_t)v46);
  if (sub_100007884((uint64_t)v46) == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v9 = 0;
    long long v10 = v47;
    long long v11 = v30;
  }
  while (1)
  {
    long long v35 = v11;
    float v13 = *(float *)((unint64_t)&v35 & 0xFFFFFFFFFFFFFFF3 | (4 * (v9 & 3)));
    long long v36 = v10;
    float v14 = *(float *)((unint64_t)&v36 & 0xFFFFFFFFFFFFFFF3 | (4 * (v9 & 3)));
    BOOL v12 = v13 == v14;
    if (v9 == 2) {
      break;
    }
    while (1)
    {
      ++v9;
      if (v12) {
        break;
      }
      if (v9 == 2) {
        goto LABEL_11;
      }
      BOOL v12 = 0;
    }
  }
  if (v13 == v14)
  {
    int v4 = 0;
  }
  else
  {
LABEL_11:
    sub_10000781C((uint64_t)v8, (uint64_t)v42);
    sub_10000781C((uint64_t)v42, (uint64_t)v43);
    if (sub_100007884((uint64_t)v43) == 1) {
      goto LABEL_18;
    }
    *((_OWORD *)v8 + 6) = v30;
    int v4 = 1;
  }
  sub_100007334(a2);
  long long v30 = v18;
  sub_10000781C((uint64_t)v8, (uint64_t)v42);
  sub_10000781C((uint64_t)v42, (uint64_t)v43);
  if (sub_100007884((uint64_t)v43) != 1)
  {
    uint64_t v15 = 0;
    long long v16 = v44;
    long long v17 = v30;
    goto LABEL_19;
  }
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  while (1)
  {
    long long v33 = v17;
    float v20 = *(float *)((unint64_t)&v33 & 0xFFFFFFFFFFFFFFF3 | (4 * (v15 & 3)));
    long long v34 = v16;
    float v21 = *(float *)((unint64_t)&v34 & 0xFFFFFFFFFFFFFFF3 | (4 * (v15 & 3)));
    BOOL v19 = v20 == v21;
    if (v15 == 2) {
      break;
    }
    while (1)
    {
      ++v15;
      if (v19) {
        break;
      }
      if (v15 == 2) {
        goto LABEL_23;
      }
      BOOL v19 = 0;
    }
  }
  if (v20 != v21)
  {
LABEL_23:
    sub_10000781C((uint64_t)v8, (uint64_t)v39);
    sub_10000781C((uint64_t)v39, (uint64_t)v40);
    id result = (id)sub_100007884((uint64_t)v40);
    if (result == 1) {
      goto LABEL_30;
    }
    *((_OWORD *)v8 + 7) = v30;
    int v4 = 1;
  }
  sub_100007334(a3);
  long long v30 = v26;
  sub_10000781C((uint64_t)v8, (uint64_t)v39);
  sub_10000781C((uint64_t)v39, (uint64_t)v40);
  id result = (id)sub_100007884((uint64_t)v40);
  if (result != 1)
  {
    uint64_t v23 = 0;
    long long v24 = v41;
    long long v25 = v30;
    goto LABEL_31;
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  while (1)
  {
    long long v31 = v25;
    float v28 = *(float *)((unint64_t)&v31 & 0xFFFFFFFFFFFFFFF3 | (4 * (v23 & 3)));
    long long v32 = v24;
    float v29 = *(float *)((unint64_t)&v32 & 0xFFFFFFFFFFFFFFF3 | (4 * (v23 & 3)));
    BOOL v27 = v28 == v29;
    if (v23 == 2) {
      break;
    }
    while (1)
    {
      ++v23;
      if (v27) {
        break;
      }
      if (v23 == 2) {
        goto LABEL_37;
      }
      BOOL v27 = 0;
    }
  }
  if (v28 != v29)
  {
LABEL_37:
    sub_10000781C((uint64_t)v8, (uint64_t)v37);
    sub_10000781C((uint64_t)v37, (uint64_t)v38);
    id result = (id)sub_100007884((uint64_t)v38);
    if (result == 1)
    {
      __break(1u);
      return result;
    }
    *((_OWORD *)v8 + 8) = v30;
    return objc_msgSend(v3, "setNeedsDisplay", v30, v31, v32, v33, v34, v35, v36);
  }
  if (v4) {
    return objc_msgSend(v3, "setNeedsDisplay", v30, v31, v32, v33, v34, v35, v36);
  }
  return result;
}

__n128 initializeWithCopy for SimulationUniforms(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(__n128 *)(a1 + 80) = result;
  *(_OWORD *)(a1 + 96) = v6;
  return result;
}

uint64_t getEnumTagSinglePayload for SimulationUniforms(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 144)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SimulationUniforms(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
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
  *(unsigned char *)(result + 144) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SimulationUniforms()
{
  return &type metadata for SimulationUniforms;
}

uint64_t sub_10000781C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000036B4((uint64_t *)&unk_100029280);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007884(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 144)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

double sub_1000078A0(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(unsigned char *)(a1 + 144) = 1;
  return result;
}

void sub_1000078C4()
{
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_commandQueue] = 0;
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_renderPassDescriptor] = 0;
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_cardVertexCoordsBuffer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_cardTextureCoordsBuffer] = 0;
  uint64_t v1 = (uint64_t)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_uniforms];
  sub_1000078A0((uint64_t)v3);
  sub_10000781C((uint64_t)v3, v1);
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_uniformsBuffer] = 0;
  long long v2 = &v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_rotationMatrix];
  _OWORD *v2 = xmmword_100017550;
  v2[1] = xmmword_100017560;
  v2[2] = xmmword_100017570;
  v2[3] = xmmword_100017580;
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_normalTexture] = 0;
  sub_100016280();
  v0[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_isRenderingPaused] = 0;

  sub_100016610();
  __break(1u);
}

uint64_t sub_100007A1C(uint64_t result)
{
  *(unsigned char *)(result + 144) = 0;
  return result;
}

unint64_t sub_100007A24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000036B4(&qword_100029188);
  __chkstk_darwin(v2 - 8, v3);
  id v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100016210();
  uint64_t v7 = v6;
  unint64_t v8 = *(void *)(v6 + 16);
  if (v8)
  {
    unint64_t result = sub_100007CDC(*(void *)(v6 + 16));
    if (result >= v8)
    {
      __break(1u);
      return result;
    }
    unint64_t v10 = result;
    uint64_t v11 = sub_100016200();
    uint64_t v12 = *(void *)(v11 - 8);
    (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v5, v7+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(void *)(v12 + 72) * v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v5, 0, 1, v11);
  }
  else
  {
    uint64_t v11 = sub_100016200();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v5, 1, 1, v11);
  }
  swift_bridgeObjectRelease();
  sub_100016200();
  uint64_t v13 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v5, 1, v11) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a1, v5, v11);
  }
  sub_100007D68((uint64_t)v5);
  float v14 = self;
  id v15 = [v14 grayColor];
  id v16 = [v14 grayColor];
  return sub_1000161E0();
}

uint64_t sub_100007CA8()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MonogramPosterColorGenerator()
{
  return self;
}

unint64_t sub_100007CDC(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    swift_stdlib_random();
    unint64_t result = (0 * (unsigned __int128)v1) >> 64;
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

uint64_t sub_100007D68(uint64_t a1)
{
  uint64_t v2 = sub_1000036B4(&qword_100029188);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

double sub_100007DC8()
{
  uint64_t v9 = 0;
  double v10 = 0.0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  if ([v0 getRed:&v10 green:&v9 blue:&v8 alpha:&v7]) {
    return v10;
  }
  double result = 1.0;
  __asm { FMOV            V2.2D, #1.0 }
  return result;
}

uint64_t sub_100007E74(void *a1, double a2)
{
  __double2 v3 = __sincos_stret(a2 * 3.14159265 + a2 * 3.14159265 + -3.14159265);
  sub_1000036B4(&qword_100029190);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000176F0;
  *(void *)(inited + 32) = &off_100020E48;
  sub_1000036B4(&qword_1000291A8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100017700;
  *(void *)(v5 + 32) = 0;
  *(double *)(v5 + 40) = v3.__cosval + -1.0 + 1.0;
  *(double *)(v5 + 48) = -v3.__sinval;
  *(void *)(v5 + 56) = 0;
  double v6 = (v3.__cosval + -1.0) * 0.5;
  *(double *)(v5 + 64) = v3.__sinval * 0.5 - v6;
  *(void *)(inited + 40) = v5;
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100017700;
  *(void *)(v7 + 32) = 0;
  *(double *)(v7 + 40) = v3.__sinval;
  *(double *)(v7 + 48) = v3.__cosval + -1.0 + 1.0;
  *(void *)(v7 + 56) = 0;
  *(double *)(v7 + 64) = v3.__sinval * -0.5 - v6;
  *(void *)(inited + 48) = v7;
  *(void *)(inited + 56) = &off_100020E90;
  uint64_t v8 = sub_100008A60(inited, a1);
  swift_setDeallocating();
  sub_1000036B4(&qword_1000291A0);
  swift_arrayDestroy();
  return v8;
}

uint64_t sub_100007FE8(void *a1, double a2)
{
  double v3 = a2 + a2;
  double v4 = 0.5 - (a2 + a2) * 0.5;
  sub_1000036B4(&qword_100029190);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000176F0;
  *(void *)(inited + 32) = &off_100020ED8;
  sub_1000036B4(&qword_1000291A8);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_100017700;
  *(void *)(v6 + 32) = 0;
  *(double *)(v6 + 40) = v3;
  *(void *)(v6 + 48) = 0;
  *(void *)(v6 + 56) = 0;
  *(double *)(v6 + 64) = v4;
  *(void *)(inited + 40) = v6;
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100017700;
  *(void *)(v7 + 32) = 0;
  *(void *)(v7 + 40) = 0;
  *(double *)(v7 + 48) = v3;
  *(void *)(v7 + 56) = 0;
  *(double *)(v7 + 64) = v4;
  *(void *)(inited + 48) = v7;
  *(void *)(inited + 56) = &off_100020F20;
  uint64_t v8 = sub_100008A60(inited, a1);
  swift_setDeallocating();
  sub_1000036B4(&qword_1000291A0);
  swift_arrayDestroy();
  return v8;
}

uint64_t sub_100008110(void *a1, double a2)
{
  double v3 = a2 + a2 + -1.0;
  sub_1000036B4(&qword_100029190);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000176F0;
  sub_1000036B4(&qword_1000291A8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100017700;
  *(double *)(v5 + 32) = 1.0 - fabs(v3);
  double v6 = 0.0;
  if (v3 >= 0.0) {
    double v6 = v3;
  }
  *(void *)(v5 + 48) = 0;
  *(void *)(v5 + 56) = 0;
  *(void *)(v5 + 40) = 0;
  *(double *)(v5 + 64) = v6;
  *(void *)(inited + 32) = v5;
  *(void *)(inited + 40) = &off_100020F68;
  *(void *)(inited + 48) = &off_100020FB0;
  *(void *)(inited + 56) = &off_100020FF8;
  uint64_t v7 = sub_100008A60(inited, a1);
  swift_setDeallocating();
  sub_1000036B4(&qword_1000291A0);
  swift_arrayDestroy();
  return v7;
}

double sub_100008224()
{
  sub_1000036B4(&qword_100029190);
  uint64_t v0 = swift_allocObject();
  *(void *)&double result = 4;
  *(_OWORD *)(v0 + 16) = xmmword_1000176F0;
  *(void *)(v0 + 32) = &off_100020C08;
  *(void *)(v0 + 40) = &off_100020C50;
  *(void *)(v0 + 48) = &off_100020C98;
  *(void *)(v0 + 56) = &off_100020CE0;
  qword_100029E90 = v0;
  return result;
}

double sub_10000828C()
{
  sub_1000036B4(&qword_100029190);
  uint64_t v0 = swift_allocObject();
  *(void *)&double result = 4;
  *(_OWORD *)(v0 + 16) = xmmword_1000176F0;
  *(void *)(v0 + 32) = &off_100020D28;
  *(void *)(v0 + 40) = &off_100020D70;
  *(void *)(v0 + 48) = &off_100020DB8;
  *(void *)(v0 + 56) = &off_100020E00;
  qword_100029E98 = v0;
  return result;
}

uint64_t sub_1000082F4(void *a1)
{
  uint64_t result = sub_1000087D4(a1);
  if (*(void *)(result + 16) >= 4uLL) {
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

id UIColor.upperColor.getter()
{
  sub_100007DC8();
  uint64_t v0 = (void *)sub_100008E70((uint64_t)&off_100021040);
  sub_1000082F4(v0);
  float64x2_t v17 = v1;
  swift_bridgeObjectRelease();
  v2.f64[0] = sub_10000853C((float64x2_t)0, 0.0, v17);
  float64x2_t v3 = v2;
  __asm { FMOV            V0.2D, #1.0 }
  double v16 = sub_1000085F0(_Q0, _Q0.f64[0], v3);
  double v18 = v9;
  double v11 = v10;
  double v13 = v12;
  id v14 = objc_allocWithZone((Class)UIColor);

  return [v14 initWithRed:v16 green:v11 blue:v18 alpha:v13];
}

id UIColor.lowerColor.getter()
{
  sub_100007DC8();
  uint64_t v0 = (void *)sub_100008E70((uint64_t)&off_100021078);
  sub_1000082F4(v0);
  float64x2_t v17 = v1;
  swift_bridgeObjectRelease();
  v2.f64[0] = sub_10000853C((float64x2_t)0, 0.0, v17);
  float64x2_t v3 = v2;
  __asm { FMOV            V0.2D, #1.0 }
  double v16 = sub_1000085F0(_Q0, _Q0.f64[0], v3);
  double v18 = v9;
  double v11 = v10;
  double v13 = v12;
  id v14 = objc_allocWithZone((Class)UIColor);

  return [v14 initWithRed:v16 green:v11 blue:v18 alpha:v13];
}

float64_t sub_10000853C(float64x2_t a1, double a2, float64x2_t a3)
{
  double v3 = a1.f64[0];
  unsigned __int8 v4 = vmovn_s64(vcgtq_f64(a1, a3)).u8[0];
  if ((*(void *)&a3.f64[0] & 0xFFFFFFFFFFFFFLL) == 0) {
    a1.f64[0] = a3.f64[0];
  }
  if ((~*(void *)&a3.f64[0] & 0x7FF0000000000000) != 0) {
    a1.f64[0] = a3.f64[0];
  }
  if (v4) {
    a1.f64[0] = v3;
  }
  return a1.f64[0];
}

float64_t sub_1000085F0(float64x2_t a1, double a2, float64x2_t a3)
{
  double v3 = a1.f64[0];
  unsigned __int8 v4 = vmovn_s64((int64x2_t)vmvnq_s8((int8x16_t)vcgeq_f64(a3, a1))).u8[0];
  if ((*(void *)&a3.f64[0] & 0xFFFFFFFFFFFFFLL) == 0) {
    a1.f64[0] = a3.f64[0];
  }
  if ((~*(void *)&a3.f64[0] & 0x7FF0000000000000) != 0) {
    a1.f64[0] = a3.f64[0];
  }
  if ((v4 & 1) == 0) {
    a1.f64[0] = v3;
  }
  return a1.f64[0];
}

char *sub_1000086B0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1000036B4(&qword_1000291A8);
      double v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
      double v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      double v10 = (char *)&_swiftEmptyArrayStorage;
      double v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 32]) {
          memmove(v13, a4 + 32, 8 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100008974(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_1000087C0(uint64_t a1)
{
  return sub_1000086B0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1000087D4(void *a1)
{
  sub_1000036B4(&qword_100029198);
  uint64_t result = sub_100016430();
  *(void *)(result + 16) = 4;
  if (a1[2] < 4uLL)
  {
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v3 = a1[4];
  unint64_t v4 = *(void *)(v3 + 16);
  if (!v4)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v4 == 1)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (v4 < 3)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v4 == 3)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v4 < 5)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  long long v5 = *(_OWORD *)(v3 + 48);
  uint64_t v6 = *(void *)(v3 + 64);
  *(_OWORD *)(result + 32) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(result + 48) = v5;
  *(void *)(result + 64) = v6;
  uint64_t v7 = a1[5];
  unint64_t v8 = *(void *)(v7 + 16);
  if (!v8)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v8 == 1)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (v8 < 3)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (v8 == 3)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if (v8 < 5)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  long long v9 = *(_OWORD *)(v7 + 48);
  uint64_t v10 = *(void *)(v7 + 64);
  *(_OWORD *)(result + 80) = *(_OWORD *)(v7 + 32);
  *(_OWORD *)(result + 96) = v9;
  *(void *)(result + 112) = v10;
  uint64_t v11 = a1[6];
  unint64_t v12 = *(void *)(v11 + 16);
  if (!v12)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v12 == 1)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (v12 < 3)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  if (v12 == 3)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  if (v12 < 5)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  long long v13 = *(_OWORD *)(v11 + 48);
  uint64_t v14 = *(void *)(v11 + 64);
  *(_OWORD *)(result + 128) = *(_OWORD *)(v11 + 32);
  *(_OWORD *)(result + 144) = v13;
  *(void *)(result + 160) = v14;
  uint64_t v15 = a1[7];
  unint64_t v16 = *(void *)(v15 + 16);
  if (!v16)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if (v16 == 1)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if (v16 < 3)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (v16 == 3)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (v16 >= 5)
  {
    long long v17 = *(_OWORD *)(v15 + 48);
    uint64_t v18 = *(void *)(v15 + 64);
    *(_OWORD *)(result + 176) = *(_OWORD *)(v15 + 32);
    *(_OWORD *)(result + 192) = v17;
    *(void *)(result + 208) = v18;
    return result;
  }
LABEL_43:
  __break(1u);
  return result;
}

char *sub_100008974(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    long long v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_100016640();
  __break(1u);
  return result;
}

uint64_t sub_100008A60(uint64_t a1, void *a2)
{
  uint64_t v5 = sub_100016430();
  *(void *)(v5 + 16) = 5;
  *(_OWORD *)(v5 + 32) = 0u;
  *(_OWORD *)(v5 + 48) = 0u;
  *(void *)(v5 + 64) = 0;
  sub_1000036B4(&qword_1000291A0);
  size_t v6 = (void *)sub_100016430();
  v6[2] = 4;
  v6[4] = v5;
  v6[5] = v5;
  v6[6] = v5;
  v6[7] = v5;
  uint64_t v32 = a2[6];
  uint64_t v33 = a2[7];
  uint64_t v30 = a2[4];
  uint64_t v31 = a2[5];
  unint64_t v7 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain_n();
  if (v7 < 4)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (a2[2] < 4uLL)
  {
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  float v28 = (void *)a1;
  uint64_t v8 = a1 + 32;
  a1 = v31 + 32;
  swift_bridgeObjectRetain();
  unint64_t v9 = 0;
  while (2)
  {
    unint64_t v10 = 0;
    unint64_t v29 = v9 + 1;
    do
    {
      uint64_t v11 = *(void *)(v8 + 8 * v10);
      if (*(void *)(v11 + 16) < 4uLL)
      {
        __break(1u);
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
LABEL_40:
        __break(1u);
        goto LABEL_41;
      }
      if (v9 >= *(void *)(v33 + 16)) {
        goto LABEL_35;
      }
      if (v9 >= *(void *)(v32 + 16)) {
        goto LABEL_36;
      }
      if (v9 >= *(void *)(v31 + 16)) {
        goto LABEL_37;
      }
      if (v9 >= *(void *)(v30 + 16)) {
        goto LABEL_38;
      }
      if (v10 >= v6[2]) {
        goto LABEL_39;
      }
      double v2 = *(double *)(v33 + 32 + 8 * v9);
      double v12 = *(double *)(v11 + 48);
      double v13 = *(double *)(v11 + 56);
      double v14 = *(double *)(v32 + 32 + 8 * v9);
      double v15 = *(double *)(a1 + 8 * v9);
      double v16 = *(double *)(v11 + 32);
      double v17 = *(double *)(v11 + 40);
      double v18 = *(double *)(v30 + 32 + 8 * v9);
      BOOL v19 = v6;
      v6 += v10;
      uint64_t v5 = v6[4];
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v6[4] = v5;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v5 = (uint64_t)sub_1000087C0(v5);
        v6[4] = v5;
      }
      if (v9 >= *(void *)(v5 + 16)) {
        goto LABEL_40;
      }
      size_t v6 = v19;
      ++v10;
      *(double *)(v5 + 8 * v9 + 32) = v13 * v2 + v12 * v14 + v17 * v15 + v16 * v18;
    }
    while (v10 != 4);
    ++v9;
    if (v29 != 5) {
      continue;
    }
    break;
  }
  if (*(void *)(*(void *)v8 + 16) < 5uLL) {
    goto LABEL_43;
  }
  if (!v19[2]) {
    goto LABEL_44;
  }
  double v2 = *(double *)(*(void *)v8 + 64);
  uint64_t v5 = v19[4];
  char v21 = swift_isUniquelyReferenced_nonNull_native();
  v19[4] = v5;
  if ((v21 & 1) == 0) {
LABEL_45:
  }
    uint64_t v5 = (uint64_t)sub_1000087C0(v5);
  if (*(void *)(v5 + 16) < 5uLL)
  {
    __break(1u);
    goto LABEL_47;
  }
  *(double *)(v5 + 64) = v2 + *(double *)(v5 + 64);
  v6[4] = v5;
  uint64_t v22 = v28[5];
  if (*(void *)(v22 + 16) < 5uLL)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if (v6[2] >= 2uLL)
  {
    double v2 = *(double *)(v22 + 64);
    uint64_t v5 = v6[5];
    char v23 = swift_isUniquelyReferenced_nonNull_native();
    v6[5] = v5;
    if (v23) {
      goto LABEL_24;
    }
    goto LABEL_49;
  }
LABEL_48:
  __break(1u);
LABEL_49:
  uint64_t v5 = (uint64_t)sub_1000087C0(v5);
LABEL_24:
  if (*(void *)(v5 + 16) < 5uLL)
  {
    __break(1u);
    goto LABEL_51;
  }
  *(double *)(v5 + 64) = v2 + *(double *)(v5 + 64);
  v6[5] = v5;
  uint64_t v24 = v28[6];
  if (*(void *)(v24 + 16) < 5uLL)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  if (v6[2] >= 3uLL)
  {
    double v2 = *(double *)(v24 + 64);
    uint64_t v5 = v6[6];
    char v25 = swift_isUniquelyReferenced_nonNull_native();
    v6[6] = v5;
    if (v25) {
      goto LABEL_28;
    }
    goto LABEL_53;
  }
LABEL_52:
  __break(1u);
LABEL_53:
  uint64_t v5 = (uint64_t)sub_1000087C0(v5);
LABEL_28:
  if (*(void *)(v5 + 16) < 5uLL)
  {
    __break(1u);
    goto LABEL_55;
  }
  *(double *)(v5 + 64) = v2 + *(double *)(v5 + 64);
  v6[6] = v5;
  uint64_t v26 = v28[7];
  if (*(void *)(v26 + 16) < 5uLL)
  {
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  if (v6[2] >= 4uLL)
  {
    double v2 = *(double *)(v26 + 64);
    a1 = v6[7];
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    v6[7] = a1;
    if (result) {
      goto LABEL_32;
    }
    goto LABEL_57;
  }
LABEL_56:
  __break(1u);
LABEL_57:
  uint64_t result = (uint64_t)sub_1000087C0(a1);
  a1 = result;
LABEL_32:
  if (*(void *)(a1 + 16) < 5uLL)
  {
    __break(1u);
  }
  else
  {
    *(double *)(a1 + 64) = v2 + *(double *)(a1 + 64);
    v6[7] = a1;
    return (uint64_t)v6;
  }
  return result;
}

uint64_t sub_100008E70(uint64_t a1)
{
  if (qword_100028B30 != -1) {
    swift_once();
  }
  if (*(void *)(a1 + 16) == 3)
  {
    double v2 = *(double *)(a1 + 32);
    uint64_t v3 = (void *)swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_100007E74(v3, v2);
    uint64_t v5 = (void *)sub_100007FE8(v4, *(double *)(a1 + 40));
    swift_bridgeObjectRelease();
    size_t v6 = (void *)sub_100008110(v5, *(double *)(a1 + 48));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_100028B38 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_100008A60(qword_100029E98, v6);
    swift_bridgeObjectRelease();
    return v7;
  }
  else
  {
    uint64_t result = sub_100016610();
    __break(1u);
  }
  return result;
}

id sub_100009138()
{
  return sub_100009894(type metadata accessor for MonogramSimulationView);
}

uint64_t sub_100009150()
{
  return type metadata accessor for MonogramSimulationView(0);
}

uint64_t type metadata accessor for MonogramSimulationView(uint64_t a1)
{
  return sub_1000065CC(a1, (uint64_t *)&unk_1000291D8);
}

uint64_t sub_100009178()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_10000930C()
{
  sub_1000036B4((uint64_t *)&unk_1000290E0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100017370;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_normalTexture);
  *(void *)(v1 + 32) = *(void *)(v0
                                   + OBJC_IVAR____TtC23MonogramPosterExtension23MonogramSimulationLayer_monogramTexture);
  *(void *)(v1 + 40) = v2;
  uint64_t v4 = v1;
  sub_100016410();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return v4;
}

unint64_t sub_1000093A0()
{
  return 0xD000000000000029;
}

void *sub_1000093BC(void *a1)
{
  sub_100006850(a1);
  uint64_t v2 = sub_100005FD8();
  uint64_t v4 = v3;
  sub_10000781C(v3, (uint64_t)v13);
  sub_10000781C((uint64_t)v13, (uint64_t)v14);
  if (sub_100007884((uint64_t)v14) == 1) {
    return (void *)((uint64_t (*)(unsigned char *, void))v2)(v12, 0);
  }
  uint64_t v6 = OBJC_IVAR____TtC23MonogramPosterExtension23MonogramSimulationLayer_monogramTexture;
  uint64_t result = *(void **)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension23MonogramSimulationLayer_monogramTexture);
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  id v7 = [result width];
  uint64_t result = *(void **)(v1 + v6);
  if (!result)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  *(float *)&unsigned int v11 = (float)(uint64_t)v7;
  *(float *)&unsigned int v10 = (float)(uint64_t)[result height];
  sub_100016230();
  DWORD2(v8) = 1056964608;
  *(void *)&long long v8 = __PAIR64__(v10, v11);
  HIDWORD(v8) = v9;
  *(_OWORD *)(v4 + 80) = v8;
  return (void *)((uint64_t (*)(unsigned char *, void))v2)(v12, 0);
}

void sub_1000094C4(void *a1)
{
  uint64_t v2 = v1;
  id v4 = [v2 device];
  if (v4)
  {
    id v5 = v4;
    if (a1)
    {
      id v6 = objc_allocWithZone((Class)MTKTextureLoader);
      id v7 = a1;
      id v8 = [v6 initWithDevice:v5];
      id v21 = 0;
      id v9 = [v8 newTextureWithCGImage:v7 options:0 error:&v21];
      id v10 = v21;
      if (v9)
      {
        *(void *)&v2[OBJC_IVAR____TtC23MonogramPosterExtension23MonogramSimulationLayer_monogramTexture] = v9;
        id v11 = v10;
        swift_unknownObjectRelease();
        if (*(void *)&v2[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_commandQueue])
        {
          type metadata accessor for NormalGenerator();
          swift_initStackObject();
          swift_unknownObjectRetain();
          sub_100001EB8()[7] = 0x4080000040000000;
          double v12 = (void *)swift_unknownObjectRetain();
          sub_100002340(v12);
          uint64_t v14 = v13;
          swift_unknownObjectRelease();
          *(void *)&v2[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_normalTexture] = v14;
          swift_unknownObjectRelease();
          [v2 setNeedsDisplay];
          swift_release();

          swift_unknownObjectRelease();
        }
        else
        {
          __break(1u);
        }
      }
      else
      {
        id v15 = v21;
        sub_1000160D0();

        swift_willThrow();
        swift_errorRetain();
        swift_errorRetain();
        double v16 = sub_100016270();
        os_log_type_t v17 = sub_1000164B0();
        if (os_log_type_enabled(v16, v17))
        {
          double v18 = (uint8_t *)swift_slowAlloc();
          id v21 = (id)swift_slowAlloc();
          *(_DWORD *)double v18 = 136315138;
          swift_getErrorValue();
          uint64_t v19 = sub_100016680();
          sub_1000152CC(v19, v20, (uint64_t *)&v21);
          sub_100016520();
          swift_bridgeObjectRelease();
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v16, v17, "Failed to generate monogram texture from string image with error: %s", v18, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          swift_unknownObjectRelease();
          swift_errorRelease();
        }
        else
        {

          swift_unknownObjectRelease();
          swift_errorRelease();

          swift_errorRelease();
          swift_errorRelease();
        }
      }
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_10000986C()
{
  return swift_unknownObjectRelease();
}

id sub_10000987C()
{
  return sub_100009894(type metadata accessor for MonogramSimulationLayer);
}

id sub_100009894(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t sub_1000098E4()
{
  return type metadata accessor for MonogramSimulationLayer(0);
}

uint64_t type metadata accessor for MonogramSimulationLayer(uint64_t a1)
{
  return sub_1000065CC(a1, (uint64_t *)&unk_100029210);
}

uint64_t sub_10000990C()
{
  return swift_updateClassMetadata2();
}

_OWORD *sub_100009950(uint64_t a1)
{
  *(void *)(v1 + 48) = 0;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  *(void *)(v1 + 16) = MTLCreateSystemDefaultDevice();
  swift_unknownObjectRelease();
  uint64_t result = *(_OWORD **)(v1 + 16);
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t result = [result newDefaultLibrary];
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  *(void *)(v1 + 24) = result;
  swift_unknownObjectRelease();
  *(void *)(v1 + 32) = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  __asm { FMOV            V1.2S, #1.0 }
  v10[0] = 0x3F80000000000000;
  v10[1] = _D1;
  v10[2] = 0;
  v10[3] = 1065353216;
  uint64_t result = *(_OWORD **)(v1 + 16);
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  *(void *)(v1 + 48) = [result newBufferWithBytes:v10 length:32 options:0];
  swift_unknownObjectRelease();
  sub_1000036B4((uint64_t *)&unk_100029550);
  uint64_t result = (_OWORD *)swift_allocObject();
  result[2] = xmmword_100017770;
  result[3] = xmmword_100017780;
  result[4] = xmmword_100017790;
  result[5] = xmmword_1000177A0;
  if (*(void *)(v1 + 16))
  {
    id v9 = [(id)swift_unknownObjectRetain() newBufferWithBytes:result + 2 length:64 options:0];
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_setDeallocating();
    swift_deallocClassInstance();
    *(void *)(v1 + 40) = v9;
    swift_unknownObjectRelease();
    return (_OWORD *)v1;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_100009AF8()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Generator()
{
  return self;
}

id sub_100009B74(double a1)
{
  id v3 = [v1 font];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  [v1 setHidden:0];
  double v5 = a1 + -32.0;
  [v1 _tightBoundingRect];
  double v7 = v6;
  double v9 = v8;
  double v12 = fabs(v11);
  double v13 = v10 + 32.0 + v12 + v12;
  uint64_t v14 = v4;
  if (v5 >= v13
    || ([v4 pointSize],
        id v16 = [v4 fontWithSize:v5 / v13 * v15],
        v4,
        [v1 setFont:v16],
        v16,
        id result = [v1 font],
        (uint64_t v14 = result) != 0))
  {
    double v18 = fabs(v7);
    double v19 = v9 + 32.0 + v18 + v18;

    [v1 _tightBoundingRect];
    uint64_t v21 = v20;
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    uint64_t v27 = v26;
    sub_100009EE0();
    id v28 = [(id)swift_getObjCClassFromMetadata() preferredFormat];
    [v28 setPreferredRange:2];
    id v29 = objc_msgSend(objc_allocWithZone((Class)UIGraphicsImageRenderer), "initWithSize:format:", v28, v13, v19);
    uint64_t v30 = swift_allocObject();
    *(double *)(v30 + 16) = v13;
    *(double *)(v30 + 24) = v19;
    *(void *)(v30 + 32) = v21;
    *(void *)(v30 + 40) = v23;
    *(void *)(v30 + 48) = v25;
    *(void *)(v30 + 56) = v27;
    *(void *)(v30 + 72) = 0;
    *(void *)(v30 + 80) = 0;
    *(void *)(v30 + 64) = v1;
    *(double *)(v30 + 88) = v13;
    *(double *)(v30 + 96) = v19;
    *(void *)(v30 + 104) = 0;
    *(void *)(v30 + 112) = 0;
    *(double *)(v30 + 120) = v13;
    *(double *)(v30 + 128) = v19;
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = sub_10000A0DC;
    *(void *)(v31 + 24) = v30;
    v36[4] = sub_10000A134;
    v36[5] = v31;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 1107296256;
    v36[2] = sub_10000BB5C;
    v36[3] = &unk_100021440;
    uint64_t v32 = _Block_copy(v36);
    id v33 = v1;
    swift_retain();
    swift_release();
    id v34 = [v29 imageWithActions:v32];
    _Block_release(v32);
    LOBYTE(v32) = swift_isEscapingClosureAtFileLocation();
    id result = (id)swift_release();
    if ((v32 & 1) == 0)
    {
      id v35 = [v34 CGImage];

      [v33 setHidden:1];
      swift_release();

      return v35;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_100009EE0()
{
  unint64_t result = qword_100029560;
  if (!qword_100029560)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100029560);
  }
  return result;
}

void sub_100009F20(void *a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, CGFloat a13, CGFloat a14, CGFloat a15, CGFloat a16)
{
  CGAffineTransformMakeTranslation(&v34, (a3 - a7 - a5) * 0.5, (a4 - a8 - a6) * 0.5);
  long long v32 = *(_OWORD *)&v34.c;
  long long v33 = *(_OWORD *)&v34.a;
  CGFloat tx = v34.tx;
  CGFloat ty = v34.ty;
  id v28 = [a2 layer];
  *(_OWORD *)&v34.a = v33;
  *(_OWORD *)&v34.c = v32;
  v34.CGFloat tx = tx;
  v34.CGFloat ty = ty;
  [v28 setAffineTransform:&v34];

  objc_msgSend(a2, "drawTextInRect:", a9, a10, a11, a12);
  id v29 = (CGContext *)[a1 CGContext];
  CGContextSetBlendMode(v29, kCGBlendModeCopy);

  uint64_t v30 = (CGContext *)[a1 CGContext];
  CGContextSetGrayStrokeColor(v30, 0.0, 0.0);

  uint64_t v31 = (CGContext *)[a1 CGContext];
  v35.origin.y = a14;
  v35.origin.x = a13;
  v35.size.width = a15;
  v35.size.height = a16;
  CGContextStrokeRect(v31, v35);
}

uint64_t sub_10000A0A4()
{
  return _swift_deallocObject(v0, 136, 7);
}

void sub_10000A0DC(void *a1)
{
  sub_100009F20(a1, *(void **)(v1 + 64), *(double *)(v1 + 16), *(double *)(v1 + 24), *(double *)(v1 + 32), *(double *)(v1 + 40), *(double *)(v1 + 48), *(double *)(v1 + 56), *(double *)(v1 + 72), *(double *)(v1 + 80), *(double *)(v1 + 88), *(double *)(v1 + 96), *(CGFloat *)(v1 + 104), *(CGFloat *)(v1 + 112), *(CGFloat *)(v1 + 120), *(CGFloat *)(v1 + 128));
}

uint64_t sub_10000A124()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000A134(uint64_t a1)
{
  return sub_10000BB34(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_10000A13C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000A14C()
{
  return swift_release();
}

id sub_10000A154(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, double a6, double a7)
{
  sub_10000B194(a1, a1[3]);
  uint64_t v14 = sub_100016660();
  uint64_t v15 = a4[3];
  if (v15)
  {
    id v16 = sub_10000B194(a4, a4[3]);
    uint64_t v24 = a5;
    uint64_t v25 = a2;
    uint64_t v17 = a3;
    uint64_t v18 = *(void *)(v15 - 8);
    __chkstk_darwin(v16, v16);
    uint64_t v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v18 + 16))(v20);
    uint64_t v21 = sub_100016660();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v15);
    a3 = v17;
    a5 = v24;
    a2 = v25;
    sub_10000B1D8((uint64_t)a4);
  }
  else
  {
    uint64_t v21 = 0;
  }
  id v22 = [(id)swift_getObjCClassFromMetadata() constraintWithItem:v14 attribute:a2 relatedBy:a3 toItem:v21 attribute:a5 multiplier:a6 constant:a7];
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_10000B1D8((uint64_t)a1);
  return v22;
}

id sub_10000A328()
{
  uint64_t v1 = OBJC_IVAR____TtC23MonogramPosterExtension27MonogramInputViewController_textField;
  id v2 = objc_allocWithZone((Class)UITextField);
  id v3 = v0;
  id v4 = [v2 init];
  *(void *)&v0[v1] = v4;
  *(void *)&v3[OBJC_IVAR____TtC23MonogramPosterExtension27MonogramInputViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  id v5 = v4;
  NSString v6 = sub_100016330();
  swift_bridgeObjectRelease();
  [v5 setText:v6];

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for MonogramInputViewController();
  return objc_msgSendSuper2(&v8, "initWithNibName:bundle:", 0, 0);
}

void sub_10000A574()
{
  uint64_t v1 = v0;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC23MonogramPosterExtension27MonogramInputViewController_textField);
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10000BBA8();
    id v4 = v3;
    swift_unknownObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  [v2 setFont:v4];

  [v2 setTextAlignment:1];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v2 setKeyboardType:13];
  [v2 setAutocorrectionType:1];
  [v2 setReturnKeyType:9];
  [v2 setSpellCheckingType:1];
  [v2 setAutocapitalizationType:3];
  [v2 setDelegate:v1];
  [v2 becomeFirstResponder];
  id v5 = self;
  id v6 = [v5 whiteColor];
  [v2 setTintColor:v6];

  [v2 addTarget:v1 action:"textFieldDidChange:" forControlEvents:0x20000];
  id v7 = [v5 clearColor];
  [v2 setTextColor:v7];
}

void sub_10000A750(void *a1)
{
  uint64_t v2 = v1;
  if ([a1 hasMarkedText]) {
    goto LABEL_29;
  }
  id v4 = [a1 text];
  if (!v4) {
    goto LABEL_29;
  }

  id v5 = [a1 text];
  if (!v5)
  {
    __break(1u);
    return;
  }
  id v6 = v5;
  uint64_t v7 = sub_100016360();
  unint64_t v9 = v8;

  swift_bridgeObjectRelease();
  uint64_t v10 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0) {
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  if (v10)
  {
    id v11 = [a1 text];
    if (!v11) {
      return;
    }
    double v12 = v11;
    sub_100016360();

    if (sub_1000163B0() >= 3)
    {
      sub_1000163C0();
      sub_1000163E0();
      swift_bridgeObjectRelease();
      sub_100016390();
      swift_bridgeObjectRelease();
    }
    uint64_t v13 = sub_100016380();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    if (swift_unknownObjectWeakLoadStrong())
    {
      sub_10000F2A0(v13, v15);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v21 = *(void **)(v2 + OBJC_IVAR____TtC23MonogramPosterExtension27MonogramInputViewController_textField);
    if (!swift_unknownObjectWeakLoadStrong()) {
      goto LABEL_22;
    }
  }
  else
  {
LABEL_29:
    if (swift_unknownObjectWeakLoadStrong())
    {
      id v16 = [a1 text];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = sub_100016360();
        unint64_t v20 = v19;
      }
      else
      {
        uint64_t v18 = 0;
        unint64_t v20 = 0xE000000000000000;
      }
      sub_10000F2A0(v18, v20);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
    uint64_t v21 = *(void **)(v2 + OBJC_IVAR____TtC23MonogramPosterExtension27MonogramInputViewController_textField);
    if (!swift_unknownObjectWeakLoadStrong())
    {
LABEL_22:
      id v23 = 0;
      goto LABEL_23;
    }
  }
  sub_10000BBA8();
  id v23 = v22;
  swift_unknownObjectRelease();
LABEL_23:
  [v21 setFont:v23];
}

void sub_10000AA74()
{
  id v1 = [v0 view];
  if (!v1)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v2 = v1;
  id v3 = *(void **)&v0[OBJC_IVAR____TtC23MonogramPosterExtension27MonogramInputViewController_textField];
  [v1 addSubview:v3];

  id v4 = [v0 view];
  if (!v4)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  id v5 = v4;
  [v4 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v34.origin.x = v7;
  v34.origin.y = v9;
  v34.size.width = v11;
  v34.size.height = v13;
  double Height = CGRectGetHeight(v34);
  id v15 = [v0 view];
  if (!v15)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return;
  }
  id v16 = v15;
  id v17 = [v15 window];

  if (v17)
  {
    [v17 bounds];
    double Height = CGRectGetHeight(v35);
  }
  sub_1000036B4(&qword_100029910);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1000174C0;
  id v19 = [v3 centerXAnchor];
  id v20 = [v0 view];
  if (!v20) {
    goto LABEL_16;
  }
  uint64_t v21 = v20;
  id v22 = [v20 centerXAnchor];

  id v23 = [v19 constraintEqualToAnchor:v22];
  *(void *)(v18 + 32) = v23;
  v32[3] = sub_10000582C(0, (unint64_t *)&unk_100029610);
  v32[0] = v3;
  id v24 = v3;
  id v25 = [v0 view];
  if (v25)
  {
    id v26 = v25;
    *((void *)&v31 + 1) = sub_10000582C(0, (unint64_t *)&unk_100029620);
    *(void *)&long long v30 = v26;
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
  }
  sub_10000582C(0, (unint64_t *)&qword_100028FA8);
  sub_100016230();
  *(void *)(v18 + 40) = sub_10000A154(v32, 10, 0, &v30, 4, 1.0, -(Height * (1.0 - v27)));
  v32[0] = v18;
  sub_100016410();
  id v28 = self;
  Class isa = sub_100016400().super.isa;
  swift_bridgeObjectRelease();
  [v28 activateConstraints:isa];
}

uint64_t sub_10000AD7C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  id v8 = [a1 text];
  if (v8)
  {
    CGFloat v9 = v8;
    sub_100016360();
  }
  id v10 = objc_allocWithZone((Class)NSString);
  NSString v11 = sub_100016330();
  swift_bridgeObjectRelease();
  id v12 = [v10 initWithString:v11];

  NSString v13 = sub_100016330();
  id v14 = objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", a2, a3, v13);

  NSString v15 = v14;
  if (!v14)
  {
    sub_100016360();
    NSString v15 = sub_100016330();
    swift_bridgeObjectRelease();
  }
  uint64_t v16 = sub_100016360();
  unint64_t v18 = v17;
  uint64_t v19 = sub_1000163B0();
  int v20 = CNStringContainsEmojiCharacters();

  if (([a1 hasMarkedText] & 1) == 0)
  {
    if (v19 > 2 || v20)
    {

      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_12:
    unsigned __int8 v22 = [a1 hasMarkedText];
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (v22)
    {
      if (Strong)
      {
        sub_10000F2A0(v16, v18);
LABEL_17:
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
LABEL_19:
        float v27 = *(void **)(v4 + OBJC_IVAR____TtC23MonogramPosterExtension27MonogramInputViewController_textField);
        if (swift_unknownObjectWeakLoadStrong())
        {
          sub_10000BBA8();
          id v29 = v28;
          swift_unknownObjectRelease();
        }
        else
        {
          id v29 = 0;
        }
        [v27 setFont:v29];

        return 1;
      }
    }
    else if (Strong)
    {
      uint64_t v24 = sub_100016380();
      unint64_t v26 = v25;
      swift_bridgeObjectRelease();
      sub_10000F2A0(v24, v26);
      goto LABEL_17;
    }
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  if (v19 <= 2 && (v20 & 1) == 0) {
    goto LABEL_12;
  }

  swift_bridgeObjectRelease();
  return 1;
}

id sub_10000B0F0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MonogramInputViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MonogramInputViewController()
{
  return self;
}

void *sub_10000B194(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000B1D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000B228()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC23MonogramPosterExtension6Motion_logger;
  uint64_t v3 = sub_100016270();
  os_log_type_t v4 = sub_1000164A0();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Stopping motion updates and invalidating timer", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = OBJC_IVAR____TtC23MonogramPosterExtension6Motion_motion;
  CGFloat v7 = *(void **)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension6Motion_motion);
  if (v7)
  {
    [v7 stopDeviceMotionUpdates];
    id v8 = *(void **)(v1 + v6);
  }
  else
  {
    id v8 = 0;
  }
  *(void *)(v1 + v6) = 0;

  uint64_t v9 = OBJC_IVAR____TtC23MonogramPosterExtension6Motion_timer;
  id v10 = *(void **)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension6Motion_timer);
  if (v10)
  {
    [v10 invalidate];
    NSString v11 = *(void **)(v1 + v9);
  }
  else
  {
    NSString v11 = 0;
  }
  *(void *)(v1 + v9) = 0;

  uint64_t v12 = sub_100016290();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v2, v12);

  sub_1000042D0(v1 + OBJC_IVAR____TtC23MonogramPosterExtension6Motion_delegate);
  return v1;
}

uint64_t sub_10000B38C()
{
  sub_10000B228();

  return swift_deallocClassInstance();
}

uint64_t sub_10000B3E4()
{
  return type metadata accessor for Motion();
}

uint64_t type metadata accessor for Motion()
{
  uint64_t result = qword_100029668;
  if (!qword_100029668) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000B438()
{
  uint64_t result = sub_100016290();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000B504()
{
  uint64_t v1 = v0;
  sub_100016280();
  uint64_t v2 = OBJC_IVAR____TtC23MonogramPosterExtension6Motion_motion;
  *(void *)(v0 + OBJC_IVAR____TtC23MonogramPosterExtension6Motion_motion) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC23MonogramPosterExtension6Motion_delegate + 8) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v3 = OBJC_IVAR____TtC23MonogramPosterExtension6Motion_timer;
  *(void *)(v0 + OBJC_IVAR____TtC23MonogramPosterExtension6Motion_timer) = 0;
  *(_OWORD *)(v0 + OBJC_IVAR____TtC23MonogramPosterExtension6Motion_restingQuaternion) = xmmword_100017870;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC23MonogramPosterExtension6Motion_isSnapshot) = 0;
  uint64_t v4 = OBJC_IVAR____TtC23MonogramPosterExtension6Motion_startTime;
  *(CFAbsoluteTime *)(v0 + v4) = CFAbsoluteTimeGetCurrent();
  id v5 = [objc_allocWithZone((Class)CMMotionManager) init];
  uint64_t v6 = *(void **)(v0 + v2);
  *(void *)(v0 + v2) = v5;

  CGFloat v7 = *(void **)(v0 + v2);
  if (v7) {
    [v7 startDeviceMotionUpdates];
  }
  id v8 = sub_100016270();
  os_log_type_t v9 = sub_1000164A0();
  if (os_log_type_enabled(v8, v9))
  {
    id v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Starting device motion updates", v10, 2u);
    swift_slowDealloc();
  }

  NSString v11 = sub_100016270();
  os_log_type_t v12 = sub_1000164A0();
  if (os_log_type_enabled(v11, v12))
  {
    NSString v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Scheduling timer to listen for motion updates", v13, 2u);
    swift_slowDealloc();
  }

  id v14 = self;
  uint64_t v15 = swift_allocObject();
  swift_weakInit();
  v20[4] = sub_10000BA78;
  v20[5] = v15;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 1107296256;
  v20[2] = sub_10000B9D8;
  v20[3] = &unk_100021490;
  uint64_t v16 = _Block_copy(v20);
  swift_release();
  id v17 = [v14 scheduledTimerWithTimeInterval:1 repeats:v16 block:0.0166666667];
  _Block_release(v16);
  unint64_t v18 = *(void **)(v1 + v3);
  *(void *)(v1 + v3) = v17;

  return v1;
}

void sub_10000B7D0()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    if (*(unsigned char *)(Strong + OBJC_IVAR____TtC23MonogramPosterExtension6Motion_isSnapshot))
    {
      sub_1000164D0();
      __n128 v24 = v3;
      __n128 v26 = v2;
      __n128 v20 = v5;
      __n128 v22 = v4;
      uint64_t v6 = v1 + OBJC_IVAR____TtC23MonogramPosterExtension6Motion_delegate;
      if (swift_unknownObjectWeakLoadStrong())
      {
        uint64_t v7 = *(void *)(v6 + 8);
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, uint64_t, __n128, __n128, __n128, __n128))(v7 + 8))(ObjectType, v7, v26, v24, v22, v20);
        swift_release();
LABEL_9:
        swift_unknownObjectRelease();
        return;
      }
      goto LABEL_10;
    }
    os_log_type_t v9 = *(void **)(Strong + OBJC_IVAR____TtC23MonogramPosterExtension6Motion_motion);
    if (!v9 || (id v10 = [v9 deviceMotion]) == 0)
    {
LABEL_10:
      swift_release();
      return;
    }
    NSString v11 = v10;
    id v12 = [v10 attitude];
    [v12 quaternion];

    sub_1000164D0();
    __n128 v25 = v14;
    __n128 v27 = v13;
    __n128 v21 = v16;
    __n128 v23 = v15;
    uint64_t v17 = v1 + OBJC_IVAR____TtC23MonogramPosterExtension6Motion_delegate;
    if (swift_unknownObjectWeakLoadStrong())
    {
      uint64_t v18 = *(void *)(v17 + 8);
      uint64_t v19 = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, __n128, __n128, __n128, __n128))(v18 + 8))(v19, v18, v27, v25, v23, v21);
      swift_release();

      goto LABEL_9;
    }
    swift_release();
  }
}

void sub_10000B9D8(uint64_t a1, void *a2)
{
  __n128 v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_10000BA40()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000BA78()
{
}

uint64_t sub_10000BA80(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000BA90()
{
  return swift_release();
}

id sub_10000BAD8()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MonogramPosterUpdater()
{
  return self;
}

uint64_t sub_10000BB34(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void sub_10000BB5C(uint64_t a1, void *a2)
{
  objc_super v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

void sub_10000BBA8()
{
  uint64_t v1 = OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__monogramViewController;
  objc_super v2 = *(void **)(v0 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__monogramViewController);
  if (v2
    || (type metadata accessor for MonogramPosterViewController(),
        id v3 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init],
        id v4 = *(void **)(v0 + v1),
        *(void *)(v0 + v1) = v3,
        v4,
        (objc_super v2 = *(void **)(v0 + v1)) != 0))
  {
    __n128 v5 = v2;
    swift_bridgeObjectRetain();
    NSString v6 = sub_100016330();
    swift_bridgeObjectRelease();
    int v7 = CNStringContainsChineseJapaneseKoreanCharacters();

    if (v7) {
      double v8 = 180.0;
    }
    else {
      double v8 = 210.0;
    }
    id v9 = [*(id *)&v5[OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_monogramFont] fontDescriptor];
    [self fontWithDescriptor:v9 size:v8];
  }
  else
  {
    __break(1u);
  }
}

void sub_10000BCE4(void *a1, void *a2)
{
  uint64_t v3 = v2;
  swift_unknownObjectRetain_n();
  NSString v6 = sub_100016270();
  os_log_type_t v7 = sub_100016490();
  if (os_log_type_enabled(v6, v7))
  {
    __n128 v24 = a1;
    double v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)double v8 = 136315138;
    id v9 = [a2 description];
    uint64_t v10 = sub_100016360();
    unint64_t v12 = v11;

    sub_1000152CC(v10, v12, &v25);
    sub_100016520();
    swift_unknownObjectRelease_n();
    a1 = v24;
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

  __n128 v13 = *(void **)(v3 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor_editor);
  *(void *)(v3 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor_editor) = a1;

  id v14 = a1;
  id v15 = [a2 sourceTimeFontConfiguration];
  if (!v15) {
    goto LABEL_8;
  }
  __n128 v16 = v15;
  uint64_t v17 = OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__monogramViewController;
  uint64_t v18 = *(void **)(v3 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__monogramViewController);
  if (v18
    || (type metadata accessor for MonogramPosterViewController(),
        id v19 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init],
        __n128 v20 = *(void **)(v3 + v17),
        *(void *)(v3 + v17) = v19,
        v20,
        (uint64_t v18 = *(void **)(v3 + v17)) != 0))
  {
    uint64_t v21 = PRPosterRoleIncomingCall;
    id v22 = v18;
    id v23 = [v16 effectiveFontForRole:v21];
    sub_1000056F8(v23);

LABEL_8:
    sub_10000BF64(a2);
    sub_10000CF4C();
    return;
  }
  __break(1u);
}

void sub_10000BF64(void *a1)
{
  uint64_t v3 = sub_100016200();
  __chkstk_darwin(v3 - 8, v4);
  NSString v6 = (char *)&v86 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000161D0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v10 = __chkstk_darwin(v7, v9);
  v94 = (char *)&v86 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10, v12);
  id v15 = (char *)&v86 - v14;
  __chkstk_darwin(v13, v16);
  uint64_t v18 = (char *)&v86 - v17;
  uint64_t v92 = sub_100016130();
  unint64_t v91 = *(void *)(v92 - 8);
  __chkstk_darwin(v92, v19);
  v90 = (char *)&v86 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_t v96 = v1;
  uint64_t v21 = ((char *)v1 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor_logger);
  swift_unknownObjectRetain_n();
  os_log_t v95 = v21;
  id v22 = sub_100016270();
  os_log_type_t v23 = sub_100016490();
  BOOL v24 = os_log_type_enabled(v22, v23);
  v97 = v15;
  v88 = v18;
  if (v24)
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v87 = v7;
    __n128 v26 = (uint8_t *)v25;
    v100[0] = (id)swift_slowAlloc();
    uint64_t v89 = v8;
    *(_DWORD *)__n128 v26 = 136315138;
    id v27 = [a1 description];
    uint64_t v28 = sub_100016360();
    v93 = v6;
    unint64_t v30 = v29;

    *(void *)&long long v101 = sub_1000152CC(v28, v30, (uint64_t *)v100);
    uint64_t v8 = v89;
    sub_100016520();
    swift_unknownObjectRelease_n();
    NSString v6 = v93;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Loading poster configuration from poster environment: %s", v26, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v7 = v87;
    swift_slowDealloc();
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  id v31 = [a1 sourceContents];
  v100[0] = 0;
  id v32 = [v31 loadUserInfoWithError:v100];
  swift_unknownObjectRelease();
  id v33 = v100[0];
  if (v32)
  {
    uint64_t v34 = sub_100016300();
    id v35 = v33;

    unint64_t v36 = v91;
    id v37 = v90;
    uint64_t v38 = v92;
    (*(void (**)(char *, void, uint64_t))(v91 + 104))(v90, enum case for MonogramPosterUserInfoKey.dataRepresentation(_:), v92);
    uint64_t v39 = sub_100016120();
    unint64_t v41 = v40;
    (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v38);
    uint64_t v98 = v39;
    unint64_t v99 = v41;
    sub_100016570();
    if (*(void *)(v34 + 16))
    {
      unint64_t v42 = sub_100014D88((uint64_t)v100);
      id v43 = v97;
      if (v44)
      {
        sub_100013300(*(void *)(v34 + 56) + 32 * v42, (uint64_t)&v101);
      }
      else
      {
        long long v101 = 0u;
        long long v102 = 0u;
      }
    }
    else
    {
      long long v101 = 0u;
      long long v102 = 0u;
      id v43 = v97;
    }
    swift_bridgeObjectRelease();
    sub_100013208((uint64_t)v100);
    if (*((void *)&v102 + 1))
    {
      if (swift_dynamicCast())
      {
        v52 = (char *)v98;
        unint64_t v51 = v99;
        sub_100016080();
        swift_allocObject();
        uint64_t v53 = sub_100016070();
        sub_1000132B8((unint64_t *)&qword_100029A00, (void (*)(uint64_t))&type metadata accessor for MonogramPosterConfiguration);
        v54 = v88;
        v93 = v52;
        uint64_t v92 = v53;
        sub_100016060();
        os_log_t v70 = v96;
        v71 = v54;
        v72 = (char *)v96 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor_configuration;
        swift_beginAccess();
        v94 = *(char **)(v8 + 16);
        ((void (*)(char *, char *, uint64_t))v94)(v43, v72, v7);
        swift_beginAccess();
        (*(void (**)(char *, char *, uint64_t))(v8 + 24))(v72, v71, v7);
        swift_endAccess();
        sub_10000F610();
        v73 = *(void (**)(char *, uint64_t))(v8 + 8);
        v73(v71, v7);
        v73(v43, v7);
        v74 = v70;
        v75 = sub_100016270();
        uint64_t v76 = v8 + 8;
        os_log_type_t v77 = sub_100016490();
        if (os_log_type_enabled(v75, v77))
        {
          uint64_t v79 = swift_slowAlloc();
          uint64_t v89 = v76;
          uint64_t v80 = v79;
          uint64_t v81 = swift_slowAlloc();
          os_log_t v96 = v75;
          *(void *)&long long v101 = v81;
          unint64_t v91 = v51;
          *(_DWORD *)uint64_t v80 = 136315138;
          os_log_t v95 = (os_log_t)(v80 + 4);
          ((void (*)(char *, char *, uint64_t))v94)(v43, v72, v7);
          uint64_t v82 = sub_100016150();
          unint64_t v84 = v83;
          v73(v43, v7);
          uint64_t v98 = sub_1000152CC(v82, v84, (uint64_t *)&v101);
          sub_100016520();

          swift_bridgeObjectRelease();
          os_log_t v85 = v96;
          _os_log_impl((void *)&_mh_execute_header, v96, v77, "Did load poster configuration: %s", (uint8_t *)v80, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
          swift_release();
          sub_1000130B4((uint64_t)v93, v91);

          return;
        }
        swift_release();
        sub_1000130B4((uint64_t)v93, v51);
        goto LABEL_23;
      }
    }
    else
    {
      sub_10001325C((uint64_t)&v101, (uint64_t *)&unk_100029AD0);
    }
    type metadata accessor for MonogramPosterColorGenerator();
    sub_100007A24((uint64_t)v6);
    sub_100016140();
    os_log_t v55 = v96;
    v56 = (char *)v96 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor_configuration;
    swift_beginAccess();
    v57 = v94;
    v93 = *(char **)(v8 + 16);
    ((void (*)(char *, char *, uint64_t))v93)(v94, v56, v7);
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v8 + 24))(v56, v43, v7);
    swift_endAccess();
    sub_10000F610();
    v58 = *(void (**)(char *, uint64_t))(v8 + 8);
    v58(v43, v7);
    v58(v57, v7);
    v74 = v55;
    v75 = sub_100016270();
    os_log_type_t v59 = sub_100016490();
    if (os_log_type_enabled(v75, v59))
    {
      uint64_t v60 = swift_slowAlloc();
      os_log_t v95 = v75;
      v61 = v43;
      v62 = (uint8_t *)v60;
      os_log_t v96 = (os_log_t)swift_slowAlloc();
      *(void *)&long long v101 = v96;
      *(_DWORD *)v62 = 136315138;
      v94 = (char *)(v62 + 4);
      ((void (*)(char *, char *, uint64_t))v93)(v61, v56, v7);
      uint64_t v63 = sub_100016150();
      unint64_t v65 = v64;
      v58(v61, v7);
      uint64_t v98 = sub_1000152CC(v63, v65, (uint64_t *)&v101);
      sub_100016520();

      swift_bridgeObjectRelease();
      v75 = v95;
      _os_log_impl((void *)&_mh_execute_header, v95, v59, "Creating new poster configuration: %s", v62, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
LABEL_24:

      return;
    }
LABEL_23:

    goto LABEL_24;
  }
  v93 = v6;
  id v45 = v100[0];
  sub_1000160D0();

  swift_willThrow();
  swift_errorRetain();
  swift_errorRetain();
  v46 = sub_100016270();
  os_log_type_t v47 = sub_1000164B0();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc();
    v100[0] = (id)swift_slowAlloc();
    *(_DWORD *)v48 = 136315138;
    swift_getErrorValue();
    uint64_t v49 = sub_100016680();
    *(void *)&long long v101 = sub_1000152CC(v49, v50, (uint64_t *)v100);
    sub_100016520();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v46, v47, "Error loading user info from environment: %s", v48, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  v66 = v97;
  type metadata accessor for MonogramPosterColorGenerator();
  sub_100007A24((uint64_t)v93);
  sub_100016140();
  v67 = (char *)v96 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor_configuration;
  swift_beginAccess();
  v68 = v94;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v94, v67, v7);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v8 + 24))(v67, v66, v7);
  swift_endAccess();
  sub_10000F610();
  v69 = *(void (**)(char *, uint64_t))(v8 + 8);
  v69(v66, v7);
  v69(v68, v7);
  swift_errorRelease();
}

uint64_t sub_10000CF4C()
{
  uint64_t v1 = v0;
  id v2 = [self defaultCenter];
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v22 = sub_1000131C8;
  uint64_t v23 = v3;
  uint64_t v18 = _NSConcreteStackBlock;
  uint64_t v19 = 1107296256;
  uint64_t v20 = sub_100011024;
  uint64_t v21 = &unk_1000217D8;
  uint64_t v4 = _Block_copy(&v18);
  swift_release();
  id v5 = [v2 addObserverForName:NSExtensionHostDidEnterBackgroundNotification object:0 queue:0 usingBlock:v4];
  _Block_release(v4);
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v22 = sub_1000131E8;
  uint64_t v23 = v6;
  uint64_t v18 = _NSConcreteStackBlock;
  uint64_t v19 = 1107296256;
  uint64_t v20 = sub_100011024;
  uint64_t v21 = &unk_100021800;
  uint64_t v7 = _Block_copy(&v18);
  swift_release();
  id v8 = [v2 addObserverForName:NSExtensionHostWillEnterForegroundNotification object:0 queue:0 usingBlock:v7];
  _Block_release(v7);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v22 = sub_1000131C8;
  uint64_t v23 = v9;
  uint64_t v18 = _NSConcreteStackBlock;
  uint64_t v19 = 1107296256;
  uint64_t v20 = sub_100011024;
  uint64_t v21 = &unk_100021828;
  uint64_t v10 = _Block_copy(&v18);
  swift_release();
  id v11 = [v2 addObserverForName:NSExtensionHostWillResignActiveNotification object:0 queue:0 usingBlock:v10];
  _Block_release(v10);
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v22 = sub_1000131E8;
  uint64_t v23 = v12;
  uint64_t v18 = _NSConcreteStackBlock;
  uint64_t v19 = 1107296256;
  uint64_t v20 = sub_100011024;
  uint64_t v21 = &unk_100021850;
  uint64_t v13 = _Block_copy(&v18);
  swift_release();
  id v14 = [v2 addObserverForName:NSExtensionHostDidBecomeActiveNotification object:0 queue:0 usingBlock:v13];
  _Block_release(v13);
  sub_1000036B4(&qword_100029910);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1000174A0;
  *(void *)(v15 + 32) = v5;
  *(void *)(v15 + 40) = v8;
  *(void *)(v15 + 48) = v11;
  *(void *)(v15 + 56) = v14;
  uint64_t v18 = (void **)v15;
  sub_100016410();
  uint64_t v16 = v18;

  *(void *)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor_extensionLifecycleObservers) = v16;
  return swift_bridgeObjectRelease();
}

void sub_10000D394(void *a1, void *a2)
{
  uint64_t v3 = v2;
  id v5 = a2;
  uint64_t v6 = sub_100016270();
  os_log_type_t v7 = sub_100016490();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)id v8 = 136315138;
    id v9 = [v5 effectiveFont];
    id v10 = [v9 debugDescription];

    uint64_t v11 = sub_100016360();
    unint64_t v13 = v12;

    sub_1000152CC(v11, v13, &v25);
    sub_100016520();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Updating editor with font from title label: %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v14 = OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__monogramViewController;
  uint64_t v15 = *(void **)(v3 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__monogramViewController);
  if (v15
    || (type metadata accessor for MonogramPosterViewController(),
        id v16 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init],
        uint64_t v17 = *(void **)(v3 + v14),
        *(void *)(v3 + v14) = v16,
        v17,
        (uint64_t v15 = *(void **)(v3 + v14)) != 0))
  {
    uint64_t v18 = PRPosterRoleIncomingCall;
    id v19 = v15;
    id v20 = [v5 effectiveFontForRole:v18];
    sub_1000056F8(v20);

    uint64_t v21 = *(void **)(v3 + v14);
    if (v21
      || (type metadata accessor for MonogramPosterViewController(),
          id v22 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init],
          uint64_t v23 = *(void **)(v3 + v14),
          *(void *)(v3 + v14) = v22,
          v23,
          (uint64_t v21 = *(void **)(v3 + v14)) != 0))
    {
      id v24 = v21;
      sub_100004BB8();

      [a1 updateActions];
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_10000D740(uint64_t a1)
{
  v2[39] = a1;
  v2[40] = v1;
  uint64_t v3 = sub_100016130();
  v2[41] = v3;
  v2[42] = *(void *)(v3 - 8);
  v2[43] = swift_task_alloc();
  v2[44] = swift_task_alloc();
  uint64_t v4 = sub_1000161D0();
  v2[45] = v4;
  v2[46] = *(void *)(v4 - 8);
  v2[47] = swift_task_alloc();
  v2[48] = swift_task_alloc();
  return _swift_task_switch(sub_10000D8A8, 0, 0);
}

uint64_t sub_10000D8A8()
{
  uint64_t v61 = v0;
  uint64_t v1 = sub_100016270();
  os_log_type_t v2 = sub_100016490();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Finalizing editing session", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = *(void *)(v0 + 320);

  sub_1000160C0();
  swift_allocObject();
  sub_1000160B0();
  sub_100016090();
  uint64_t v5 = v4 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor_configuration;
  swift_beginAccess();
  uint64_t v6 = sub_100016170();
  swift_endAccess();
  *(void *)(v0 + 272) = v6;
  sub_1000036B4(&qword_1000299B8);
  sub_100012FE4();
  uint64_t v7 = sub_1000160A0();
  unint64_t v58 = v8;
  uint64_t v9 = *(void *)(v0 + 384);
  uint64_t v10 = *(void *)(v0 + 360);
  uint64_t v11 = *(void *)(v0 + 368);
  swift_bridgeObjectRelease();
  unint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
  v12(v9, v5, v10);
  sub_1000132B8(&qword_1000299D0, (void (*)(uint64_t))&type metadata accessor for MonogramPosterConfiguration);
  uint64_t v13 = sub_1000160A0();
  uint64_t v49 = v12;
  uint64_t v21 = *(void *)(v0 + 352);
  uint64_t v52 = *(void *)(v0 + 344);
  uint64_t v23 = *(void *)(v0 + 328);
  uint64_t v22 = *(void *)(v0 + 336);
  id v24 = *(void **)(v0 + 312);
  unint64_t v55 = v25;
  uint64_t v56 = v13;
  v48 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 368) + 8);
  v48(*(void *)(v0 + 384), *(void *)(v0 + 360));
  id v53 = objc_msgSend(objc_msgSend(v24, "environment"), "targetConfiguration");
  swift_unknownObjectRelease();
  sub_1000036B4(&qword_1000299D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100017370;
  uint64_t v57 = v7;
  unint64_t v50 = *(void (**)(uint64_t, void, uint64_t))(v22 + 104);
  uint64_t v27 = v23;
  v50(v21, enum case for MonogramPosterUserInfoKey.backgroundColorDescription(_:), v23);
  uint64_t v28 = sub_100016120();
  uint64_t v30 = v29;
  unint64_t v51 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
  v51(v21, v27);
  *(void *)(v0 + 240) = v28;
  *(void *)(v0 + 248) = v30;
  sub_100016570();
  *(void *)(inited + 96) = &type metadata for Data;
  *(void *)(inited + 72) = v57;
  *(void *)(inited + 80) = v58;
  v50(v52, enum case for MonogramPosterUserInfoKey.dataRepresentation(_:), v27);
  sub_10001310C(v57, v58);
  uint64_t v31 = sub_100016120();
  uint64_t v33 = v32;
  v51(v52, v27);
  *(void *)(v0 + 256) = v31;
  *(void *)(v0 + 264) = v33;
  sub_100016570();
  *(void *)(inited + 168) = &type metadata for Data;
  *(void *)(inited + 144) = v56;
  *(void *)(inited + 152) = v55;
  sub_10001310C(v56, v55);
  sub_10000E11C(inited);
  Class isa = sub_1000162F0().super.isa;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 296) = 0;
  unsigned int v35 = [v53 storeUserInfo:isa error:v0 + 296];

  id v36 = *(id *)(v0 + 296);
  if (v35)
  {
    id v37 = *(id *)(v0 + 320);
    uint64_t v38 = sub_100016270();
    os_log_type_t v39 = sub_100016490();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = *(void *)(v0 + 376);
      uint64_t v41 = *(void *)(v0 + 360);
      v54 = *(void **)(v0 + 320);
      os_log_type_t v59 = v38;
      unint64_t v42 = (uint8_t *)swift_slowAlloc();
      v60[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v42 = 136315138;
      v49(v40, v5, v41);
      uint64_t v43 = sub_100016150();
      unint64_t v45 = v44;
      v48(v40, v41);
      *(void *)(v0 + 304) = sub_1000152CC(v43, v45, v60);
      sub_100016520();
      swift_bridgeObjectRelease();

      v46 = v59;
      _os_log_impl((void *)&_mh_execute_header, v59, v39, "Saving poster ocnfiguration: %s", v42, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      sub_1000130B4(v57, v58);
      sub_1000130B4(v56, v55);
      swift_release();
    }
    else
    {
      v46 = *(NSObject **)(v0 + 320);
      sub_1000130B4(v57, v58);
      sub_1000130B4(v56, v55);
      swift_release();
    }
  }
  else
  {
    os_log_type_t v47 = v36;
    sub_1000160D0();

    swift_willThrow();
    sub_1000130B4(v57, v58);
    sub_1000130B4(v56, v55);
    swift_release();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v14 = sub_100016270();
    os_log_type_t v15 = sub_1000164B0();
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = (uint8_t *)swift_slowAlloc();
      v60[0] = swift_slowAlloc();
      *(_DWORD *)id v16 = 136315138;
      swift_getErrorValue();
      uint64_t v17 = sub_100016680();
      *(void *)(v0 + 288) = sub_1000152CC(v17, v18, v60);
      sub_100016520();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Error finalizing editing: %s", v16, 0xCu);
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
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v19 = *(uint64_t (**)(void))(v0 + 8);
  return v19();
}

unint64_t sub_10000E11C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000036B4(&qword_1000299E0);
  uint64_t v2 = sub_100016630();
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
    sub_100013164(v6, (uint64_t)v15, &qword_1000299E8);
    unint64_t result = sub_100014D88((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_100011ADC(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_10000E260(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000036B4(&qword_100029948);
  uint64_t v2 = sub_100016630();
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
    sub_100013164(v6, (uint64_t)&v13, &qword_100029950);
    uint64_t v7 = v13;
    unint64_t result = sub_100014DCC(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_100011ADC(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

uint64_t sub_10000E50C(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  a3;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  void *v7 = v3;
  v7[1] = sub_10000E5D0;
  return sub_10000D740((uint64_t)v6);
}

uint64_t sub_10000E5D0()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 32);
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v3 = *(void **)(*v0 + 16);
  uint64_t v6 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_10000E728()
{
  uint64_t v1 = self;
  id v2 = [v1 defaultCenter];
  [v2 removeObserver:v0 name:NSExtensionHostDidEnterBackgroundNotification object:0];

  id v3 = [v1 defaultCenter];
  [v3 removeObserver:v0 name:NSExtensionHostWillEnterForegroundNotification object:0];

  id v4 = [v1 defaultCenter];
  [v4 removeObserver:v0 name:NSExtensionHostWillResignActiveNotification object:0];

  id v5 = [v1 defaultCenter];
  [v5 removeObserver:v0 name:NSExtensionHostDidBecomeActiveNotification object:0];

  *(void *)(v0 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor_extensionLifecycleObservers) = _swiftEmptyArrayStorage;

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000E938()
{
  uint64_t v0 = sub_1000160F0();
  __chkstk_darwin(v0 - 8, v1);
  uint64_t v2 = sub_100016320();
  __chkstk_darwin(v2 - 8, v3);
  sub_1000036B4(&qword_100029910);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100017930;
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_100016310();
  sub_1000160E0();
  uint64_t v6 = sub_100016370();
  uint64_t v8 = v7;
  swift_bridgeObjectRetain();
  sub_10000FEFC();
  sub_10000582C(0, &qword_100029938);
  sub_100016330();
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = v9;
  v10[3] = v5;
  void v10[4] = v6;
  v10[5] = v8;
  swift_bridgeObjectRetain();
  swift_retain();
  id v11 = (id)sub_100016510();
  NSString v12 = sub_100016330();
  swift_bridgeObjectRelease();
  [v11 setAccessibilityLabel:v12];
  swift_release();

  *(void *)(v4 + 32) = v11;
  sub_100016410();
  return v4;
}

void sub_10000EC84()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000160F0();
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v4 = sub_100016320();
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_100016310();
  sub_1000160E0();
  sub_100016370();
  swift_beginAccess();
  sub_1000161B0();
  swift_endAccess();
  uint64_t v7 = sub_100016380();
  unint64_t v9 = v8;
  swift_bridgeObjectRelease();
  uint64_t v10 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0) {
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  if (!v10)
  {
    swift_bridgeObjectRelease();
    sub_100016310();
    sub_1000160E0();
    uint64_t v7 = sub_100016370();
    unint64_t v9 = v11;
  }
  sub_1000036B4((uint64_t *)&unk_100029920);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100017370;
  *(void *)(inited + 32) = NSForegroundColorAttributeName;
  uint64_t v13 = self;
  long long v14 = NSForegroundColorAttributeName;
  id v15 = [v13 systemBackgroundColor];
  id v16 = [self traitCollectionWithUserInterfaceStyle:1];
  id v17 = [v15 resolvedColorWithTraitCollection:v16];

  uint64_t v18 = sub_10000582C(0, (unint64_t *)&qword_100029AE0);
  *(void *)(inited + 40) = v17;
  *(void *)(inited + 64) = v18;
  *(void *)(inited + 72) = NSFontAttributeName;
  uint64_t v19 = OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__monogramViewController;
  uint64_t v20 = *(void *)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__monogramViewController);
  if (v20)
  {
    uint64_t v21 = NSFontAttributeName;
LABEL_8:
    id v26 = [*(id *)(v20 + OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_monogramFont) fontWithSize:24.0];
    *(void *)(inited + 104) = sub_10000582C(0, &qword_100029930);
    *(void *)(inited + 80) = v26;
    unint64_t v27 = sub_10000E260(inited);
    uint64_t v28 = (void *)sub_10000FB58(v27, 0, 0, 1, v7, v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10000582C(0, &qword_100029938);
    id v29 = v28;
    swift_bridgeObjectRetain();
    sub_100016330();
    uint64_t v30 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = v30;
    *(void *)(v31 + 24) = v6;
    swift_retain();
    id v32 = (id)sub_100016510();
    NSString v33 = sub_100016330();
    swift_bridgeObjectRelease();
    [v32 setAccessibilityLabel:v33];
    swift_release();

    return;
  }
  type metadata accessor for MonogramPosterViewController();
  id v22 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v23 = NSFontAttributeName;
  id v24 = [v22 init];
  unint64_t v25 = *(void **)(v1 + v19);
  *(void *)(v1 + v19) = v24;

  uint64_t v20 = *(void *)(v1 + v19);
  if (v20) {
    goto LABEL_8;
  }
  __break(1u);
}

void sub_10000F2A0(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v30 = a1;
  uint64_t v5 = sub_1000161D0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = __chkstk_darwin(v5, v7);
  id v29 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v10);
  NSString v12 = (char *)&v27 - v11;
  swift_bridgeObjectRetain_n();
  uint64_t v13 = sub_100016270();
  os_log_type_t v14 = sub_100016490();
  if (os_log_type_enabled(v13, v14))
  {
    id v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v28 = v3;
    v32[0] = v16;
    *(_DWORD *)id v15 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_1000152CC(v30, a2, v32);
    sub_100016520();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Did change monogram text to: %s", v15, 0xCu);
    swift_arrayDestroy();
    uint64_t v3 = v28;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v17 = v3 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor_configuration;
  swift_beginAccess();
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v18(v12, v17, v5);
  swift_bridgeObjectRetain();
  sub_1000161C0();
  uint64_t v19 = v29;
  v18(v29, v17, v5);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 24))(v17, v12, v5);
  swift_endAccess();
  sub_10000F610();
  uint64_t v20 = *(void (**)(char *, uint64_t))(v6 + 8);
  v20(v12, v5);
  v20(v19, v5);
  uint64_t v21 = OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__monogramViewController;
  id v22 = *(void **)(v3 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__monogramViewController);
  if (v22
    || (type metadata accessor for MonogramPosterViewController(),
        id v23 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init],
        id v24 = *(void **)(v3 + v21),
        *(void *)(v3 + v21) = v23,
        v24,
        (id v22 = *(void **)(v3 + v21)) != 0))
  {
    id v25 = v22;
    sub_100004BB8();

    id v26 = *(void **)(v3 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor_editor);
    if (v26) {
      [v26 updateActions];
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_10000F610()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100016270();
  os_log_type_t v3 = sub_100016490();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Configuration changed, updating views", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = sub_100016170();
  swift_beginAccess();
  uint64_t v6 = sub_100016170();
  swift_endAccess();
  char v7 = sub_100011928(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v7 & 1) == 0)
  {
    uint64_t v8 = sub_100016270();
    os_log_type_t v9 = sub_100016490();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Background color changed, updating background view", v10, 2u);
      swift_slowDealloc();
    }

    sub_100012234();
    if (!v11)
    {
      __break(1u);
      goto LABEL_24;
    }
    NSString v12 = v11;
    sub_10000582C(0, (unint64_t *)&qword_100029AE0);
    swift_beginAccess();
    uint64_t v13 = v12;
    os_log_type_t v14 = (void *)sub_100016170();
    swift_endAccess();
    v15._rawValue = v14;
    v16.super.Class isa = sub_1000164F0(v15).super.isa;
    uint64_t v17 = *(void **)&v13[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_backgroundColor];
    *(UIColor *)&v13[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_backgroundColor] = v16;
  }
  uint64_t v18 = sub_100016190();
  swift_beginAccess();
  uint64_t v19 = sub_100016190();
  swift_endAccess();
  char v20 = sub_100011928(v18, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v20 & 1) == 0)
  {
    uint64_t v21 = sub_100016270();
    os_log_type_t v22 = sub_100016490();
    if (os_log_type_enabled(v21, v22))
    {
      id v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Top background color changed, updating background view", v23, 2u);
      swift_slowDealloc();
    }

    sub_100012234();
    if (v24)
    {
      id v25 = v24;
      sub_10000582C(0, (unint64_t *)&qword_100029AE0);
      swift_beginAccess();
      id v26 = v25;
      uint64_t v27 = (void *)sub_100016190();
      swift_endAccess();
      v28._rawValue = v27;
      v29.super.Class isa = sub_1000164F0(v28).super.isa;
      uint64_t v30 = *(void **)&v26[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_topBackgroundColor];
      *(UIColor *)&v26[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_topBackgroundColor] = v29;

      goto LABEL_13;
    }
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_13:
  uint64_t v31 = sub_1000161B0();
  uint64_t v33 = v32;
  swift_beginAccess();
  uint64_t v34 = sub_1000161B0();
  uint64_t v36 = v35;
  swift_endAccess();
  if (v31 == v34 && v33 == v36)
  {
    swift_bridgeObjectRelease_n();
    return;
  }
  char v37 = sub_100016670();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v37 & 1) == 0)
  {
    uint64_t v38 = sub_100016270();
    os_log_type_t v39 = sub_100016490();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "Initials changed, updating monogram string", v40, 2u);
      swift_slowDealloc();
    }

    uint64_t v41 = OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__monogramViewController;
    unint64_t v42 = *(void **)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__monogramViewController);
    if (v42
      || (type metadata accessor for MonogramPosterViewController(),
          id v43 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init],
          unint64_t v44 = *(void **)(v1 + v41),
          *(void *)(v1 + v41) = v43,
          v44,
          (unint64_t v42 = *(void **)(v1 + v41)) != 0))
    {
      swift_beginAccess();
      unint64_t v45 = v42;
      uint64_t v46 = sub_1000161B0();
      uint64_t v48 = v47;
      swift_endAccess();
      uint64_t v49 = (uint64_t *)&v45[OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_monogramString];
      *uint64_t v49 = v46;
      v49[1] = v48;
      swift_bridgeObjectRelease();
      unint64_t v50 = *(void **)&v45[OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_hiddenLabel];
      swift_bridgeObjectRetain();
      NSString v51 = sub_100016330();
      swift_bridgeObjectRelease();
      [v50 setText:v51];

      return;
    }
LABEL_25:
    __break(1u);
  }
}

uint64_t sub_10000FB58(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  if (a4)
  {
    NSString v11 = sub_100016330();
    if (a1)
    {
      type metadata accessor for Key(0);
      sub_1000132B8(&qword_100029940, type metadata accessor for Key);
      v12.super.Class isa = sub_1000162F0().super.isa;
    }
    else
    {
      v12.super.Class isa = 0;
    }
    [v11 sizeWithAttributes:v12.super.isa];
    a2 = v13;
    a3 = v14;
  }
  id v15 = objc_msgSend(objc_allocWithZone((Class)UIGraphicsImageRenderer), "initWithSize:", *(double *)&a2, *(double *)&a3);
  UIColor v16 = (void *)swift_allocObject();
  v16[2] = a5;
  v16[3] = a6;
  v16[4] = a2;
  v16[5] = a3;
  v16[6] = a1;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_100011730;
  *(void *)(v17 + 24) = v16;
  v22[4] = sub_100011750;
  v22[5] = v17;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 1107296256;
  v22[2] = sub_10000BB5C;
  v22[3] = &unk_100021620;
  uint64_t v18 = _Block_copy(v22);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  id v19 = [v15 imageWithActions:v18];

  _Block_release(v18);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0) {
    return (uint64_t)v19;
  }
  __break(1u);
  return result;
}

void sub_10000FDC0()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    swift_beginAccess();
    uint64_t v2 = swift_unknownObjectWeakLoadStrong();
    if (v2)
    {
      os_log_type_t v3 = (void *)v2;
      swift_beginAccess();
      sub_1000161B0();
      swift_endAccess();
      id v4 = objc_allocWithZone((Class)type metadata accessor for MonogramInputViewController());
      uint64_t v5 = (char *)sub_10000A328();
      *(void *)&v5[OBJC_IVAR____TtC23MonogramPosterExtension27MonogramInputViewController_delegate + 8] = &off_100021540;
      swift_unknownObjectWeakAssign();
      [v5 setModalTransitionStyle:2];
      [v3 presentViewController:v5 animated:1 completion:0];

      uint64_t v1 = v5;
    }
  }
}

uint64_t sub_10000FEFC()
{
  uint64_t v1 = v0;
  sub_10000582C(0, (unint64_t *)&qword_100029AE0);
  swift_beginAccess();
  uint64_t v2 = (void *)sub_100016170();
  swift_endAccess();
  v3._rawValue = v2;
  Class isa = sub_1000164F0(v3).super.isa;
  id v5 = objc_msgSend(objc_allocWithZone((Class)UIGraphicsImageRenderer), "initWithSize:", 35.0, 35.0);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = isa;
  *(void *)(v6 + 24) = 0x4008000000000000;
  *(void *)(v6 + 32) = v1;
  __asm { FMOV            V0.2D, #29.0 }
  *(_OWORD *)(v6 + 40) = _Q0;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_1000123D4;
  *(void *)(v12 + 24) = v6;
  v18[4] = sub_100013390;
  v18[5] = v12;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  v18[2] = sub_10000BB5C;
  v18[3] = &unk_100021710;
  uint64_t v13 = _Block_copy(v18);
  uint64_t v14 = isa;
  id v15 = v1;
  swift_retain();
  swift_release();
  id v16 = [v5 imageWithActions:v13];

  _Block_release(v13);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v5 & 1) == 0) {
    return (uint64_t)v16;
  }
  __break(1u);
  return result;
}

void sub_100010110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = sub_100016200();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v14 = (void *)Strong;
    swift_beginAccess();
    uint64_t v15 = swift_unknownObjectWeakLoadStrong();
    if (v15)
    {
      id v16 = (void *)v15;
      uint64_t v44 = v9;
      uint64_t v41 = a4;
      uint64_t v42 = a5;
      sub_10000582C(0, (unint64_t *)&qword_100029AE0);
      swift_beginAccess();
      uint64_t v17 = (void *)sub_100016170();
      swift_endAccess();
      v18._rawValue = v17;
      v19.super.Class isa = sub_1000164F0(v18).super.isa;
      id v43 = [objc_allocWithZone((Class)PREditorColorPickerConfiguration) init];
      uint64_t v20 = sub_100016210();
      uint64_t v21 = *(void *)(v20 + 16);
      if (v21)
      {
        Class isa = v19.super.isa;
        uint64_t v38 = v16;
        os_log_type_t v39 = v14;
        uint64_t v40 = a3;
        aBlock[0] = _swiftEmptyArrayStorage;
        sub_1000165D0();
        uint64_t v22 = v44 + 16;
        uint64_t v44 = *(void *)(v44 + 16);
        uint64_t v23 = *(unsigned __int8 *)(v22 + 64);
        uint64_t v36 = v20;
        uint64_t v24 = v20 + ((v23 + 32) & ~v23);
        uint64_t v25 = *(void *)(v22 + 56);
        do
        {
          ((void (*)(char *, uint64_t, uint64_t))v44)(v12, v24, v8);
          sub_1000161F0();
          (*(void (**)(char *, uint64_t))(v22 - 8))(v12, v8);
          sub_1000165B0();
          sub_1000165E0();
          sub_1000165F0();
          sub_1000165C0();
          v24 += v25;
          --v21;
        }
        while (v21);
        id v26 = (id *)aBlock[0];
        swift_bridgeObjectRelease();
        uint64_t v14 = v39;
        a3 = v40;
        v19.super.Class isa = isa;
        id v16 = v38;
      }
      else
      {
        swift_bridgeObjectRelease();
        id v26 = _swiftEmptyArrayStorage;
      }
      sub_100010568((unint64_t)v26);
      swift_bridgeObjectRelease();
      id v27 = objc_allocWithZone((Class)PREditorColorPalette);
      Class v28 = sub_100016400().super.isa;
      swift_bridgeObjectRelease();
      id v29 = [v27 initWithColors:v28 localizedName:0 showsColorWell:0];

      id v30 = v43;
      [v43 setColorPalette:v29];
      NSString v31 = sub_100016330();
      [v30 setPrompt:v31];

      id v32 = [objc_allocWithZone((Class)PRPosterColor) initWithColor:v19.super.isa];
      [v30 setSelectedColor:v32];

      uint64_t v33 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v34 = swift_allocObject();
      *(void *)(v34 + 16) = v33;
      *(void *)(v34 + 24) = a3;
      aBlock[4] = sub_100011B84;
      aBlock[5] = v34;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_10000B9D8;
      aBlock[3] = &unk_100021698;
      uint64_t v35 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      [v16 presentColorPickerWithConfiguration:v30 changeHandler:v35];
      _Block_release(v35);

      uint64_t v14 = v29;
    }
  }
}

uint64_t sub_100010568(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100016620();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  Swift::OpaquePointer v3 = _swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  uint64_t v13 = _swiftEmptyArrayStorage;
  uint64_t result = sub_1000120A4(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        sub_100016590();
        sub_10000582C(0, (unint64_t *)&qword_100029AE0);
        swift_dynamicCast();
        Swift::OpaquePointer v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000120A4(0, (int64_t)v3[2] + 1, 1);
          Swift::OpaquePointer v3 = v13;
        }
        unint64_t v7 = (unint64_t)v3[2];
        unint64_t v6 = (unint64_t)v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_1000120A4(v6 > 1, v7 + 1, 1);
          Swift::OpaquePointer v3 = v13;
        }
        v3[2] = (id)(v7 + 1);
        sub_100011ADC(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      sub_10000582C(0, (unint64_t *)&qword_100029AE0);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        Swift::OpaquePointer v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000120A4(0, (int64_t)v3[2] + 1, 1);
          Swift::OpaquePointer v3 = v13;
        }
        unint64_t v11 = (unint64_t)v3[2];
        unint64_t v10 = (unint64_t)v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_1000120A4(v10 > 1, v11 + 1, 1);
          Swift::OpaquePointer v3 = v13;
        }
        v3[2] = (id)(v11 + 1);
        sub_100011ADC(v12, &v3[4 * v11 + 4]);
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

void sub_1000107CC()
{
  uint64_t v0 = sub_1000161D0();
  uint64_t v1 = *(void **)(v0 - 8);
  uint64_t v3 = __chkstk_darwin(v0, v2);
  id v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3, v6);
  uint64_t v8 = (char *)&v24 - v7;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    unint64_t v10 = (char *)Strong;
    swift_beginAccess();
    unint64_t v11 = (char *)swift_unknownObjectWeakLoadStrong();
    if (v11)
    {
      id v29 = v11;
      sub_100016500();
      uint64_t v12 = &v10[OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor_configuration];
      swift_beginAccess();
      uint64_t v13 = (void (*)(char *, char *, uint64_t))v1[2];
      v13(v8, v12, v0);
      sub_100016180();
      Class v28 = v13;
      v13(v5, v12, v0);
      swift_beginAccess();
      id v26 = (void (*)(char *, char *, uint64_t))v1[3];
      v26(v12, v8, v0);
      swift_endAccess();
      sub_10000F610();
      uint64_t v14 = (void (*)(char *, uint64_t))v1[1];
      v14(v8, v0);
      id v27 = v14;
      v14(v5, v0);
      uint64_t v15 = sub_1000164E0();
      uint64_t v16 = sub_100016220();
      if (*(void *)(v16 + 16) && (sub_100014E60(v15), (v18 & 1) != 0))
      {
        id v25 = *(id *)(*(void *)(v16 + 56) + 8 * v17);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_100016500();
        UIColor v19 = v28;
        v28(v8, v12, v0);
        sub_1000161A0();
        v19(v5, v12, v0);
        swift_beginAccess();
        v26(v12, v8, v0);
        swift_endAccess();
        sub_10000F610();
        uint64_t v20 = v27;
        v27(v8, v0);
        v20(v5, v0);
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      sub_100012234();
      if (!v21)
      {
        __break(1u);
        return;
      }
      id v22 = v21;
      sub_100003920();

      uint64_t v23 = v29;
      [v29 updateActions];

      unint64_t v10 = v23;
    }
  }
}

void sub_100010B54(void *a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  unint64_t v10 = (CGContext *)[a1 CGContext];
  unint64_t v11 = (CGColor *)[a2 CGColor];
  CGContextSetFillColorWithColor(v10, v11);

  uint64_t v12 = (CGContext *)[a1 CGContext];
  CGContextSetLineWidth(v12, a3);

  uint64_t v13 = (CGContext *)[a1 CGContext];
  id v14 = [self systemBackgroundColor];
  id v15 = [self traitCollectionWithUserInterfaceStyle:1];
  id v16 = [v14 resolvedColorWithTraitCollection:v15];

  uint64_t v17 = (CGColor *)[v16 CGColor];
  CGContextSetStrokeColorWithColor(v13, v17);

  char v18 = (CGContext *)[a1 CGContext];
  v21.origin.x = a3;
  v21.origin.y = a3;
  v21.size.width = a4;
  v21.size.height = a5;
  CGContextAddEllipseInRect(v18, v21);

  UIColor v19 = (CGContext *)[a1 CGContext];
  CGContextDrawPath(v19, kCGPathFillStroke);
}

void sub_100010D40(char a1)
{
  sub_1000036B4((uint64_t *)&unk_1000299F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100017370;
  sub_100012234();
  if (v4)
  {
    id v5 = *(void **)(v4 + OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_simulationView);
    if (v5)
    {
      id v6 = [v5 layer];
      if (v6)
      {
        uint64_t v7 = v6;
        type metadata accessor for BackgroundSimulationLayer(0);
        uint64_t v8 = swift_dynamicCastClass();
        if (v8)
        {
          *(void *)(inited + 32) = v8;
LABEL_8:
          uint64_t v9 = OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__monogramViewController;
          uint64_t v10 = *(void *)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__monogramViewController);
          if (!v10)
          {
            type metadata accessor for MonogramPosterViewController();
            id v11 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
            uint64_t v12 = *(void **)(v1 + v9);
            *(void *)(v1 + v9) = v11;

            uint64_t v10 = *(void *)(v1 + v9);
            if (!v10) {
              goto LABEL_36;
            }
          }
          uint64_t v13 = *(void **)(v10 + OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_simulationView);
          if (v13)
          {
            id v14 = [v13 layer];
            if (v14)
            {
              id v15 = v14;
              type metadata accessor for BackgroundSimulationLayer(0);
              uint64_t v16 = swift_dynamicCastClass();
              if (v16)
              {
                *(void *)(inited + 40) = v16;
                goto LABEL_16;
              }
            }
          }
          *(void *)(inited + 40) = 0;
LABEL_16:
          sub_100016410();
          uint64_t v17 = *(void **)(inited + 32);
          if (v17)
          {
            id v18 = v17;
            sub_1000163F0();
            if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_100016420();
            }
            sub_100016440();
            sub_100016410();
          }
          UIColor v19 = *(void **)(inited + 40);
          if (v19)
          {
            id v20 = v19;
            sub_1000163F0();
            if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_100016420();
            }
            sub_100016440();
            sub_100016410();
          }
          swift_bridgeObjectRelease();
          if ((unint64_t)_swiftEmptyArrayStorage >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v21 = sub_100016620();
            swift_bridgeObjectRelease();
            if (v21) {
              goto LABEL_26;
            }
          }
          else
          {
            uint64_t v21 = *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (v21)
            {
LABEL_26:
              if (v21 >= 1)
              {
                uint64_t v22 = 0;
                char v23 = a1 & 1;
                do
                {
                  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000001) != 0) {
                    uint64_t v24 = (unsigned char *)sub_100016590();
                  }
                  else {
                    uint64_t v24 = _swiftEmptyArrayStorage[v22 + 4];
                  }
                  ++v22;
                  v24[OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_isRenderingPaused] = v23;
                }
                while (v21 != v22);
                goto LABEL_33;
              }
              __break(1u);
              goto LABEL_35;
            }
          }
LABEL_33:
          swift_bridgeObjectRelease();
          return;
        }
      }
    }
    *(void *)(inited + 32) = 0;
    goto LABEL_8;
  }
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

uint64_t sub_100011024(uint64_t a1)
{
  uint64_t v2 = sub_100016050();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  id v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void (**)(char *))(a1 + 32);
  sub_100016040();
  swift_retain();
  v7(v6);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

void sub_100011118(uint64_t a1, uint64_t a2, char a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    sub_100010D40(a3 & 1);
  }
}

id sub_100011174()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = sub_100016200();
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__backgroundViewController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__monogramViewController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor_editor] = 0;
  id v6 = v0;
  sub_100016280();
  *(void *)&v6[OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor_extensionLifecycleObservers] = _swiftEmptyArrayStorage;
  type metadata accessor for MonogramPosterColorGenerator();
  sub_100007A24((uint64_t)v5);
  sub_100016140();
  uint64_t v7 = &v6[OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor_constants];
  *(_OWORD *)uint64_t v7 = xmmword_100017940;
  *((void *)v7 + 2) = 0x4038000000000000;

  v9.receiver = v6;
  v9.super_class = ObjectType;
  return objc_msgSendSuper2(&v9, "init");
}

uint64_t sub_100011400()
{
  return type metadata accessor for MonogramPosterEditor();
}

uint64_t type metadata accessor for MonogramPosterEditor()
{
  uint64_t result = qword_100029900;
  if (!qword_100029900) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100011454()
{
  uint64_t result = sub_100016290();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1000161D0();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for MonogramPosterEditor.Constants(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for MonogramPosterEditor.Constants(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for MonogramPosterEditor.Constants(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for MonogramPosterEditor.Constants()
{
  return &type metadata for MonogramPosterEditor.Constants;
}

uint64_t sub_1000115B4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000115F0()
{
}

void sub_1000115F8(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  NSString v9 = sub_100016330();
  if (a6)
  {
    type metadata accessor for Key(0);
    sub_1000132B8(&qword_100029940, type metadata accessor for Key);
    v10.super.Class isa = sub_1000162F0().super.isa;
  }
  else
  {
    v10.super.Class isa = 0;
  }
  Class isa = v10.super.isa;
  objc_msgSend(v9, "drawInRect:withAttributes:", 0.0, 0.0, a1, a2);
}

uint64_t sub_1000116F0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_100011730(uint64_t a1)
{
  sub_1000115F8(*(double *)(v1 + 32), *(double *)(v1 + 40), a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 48));
}

uint64_t sub_100011740()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100011750()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100011778(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100011788()
{
  return swift_release();
}

id sub_100011790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  NSString v9 = sub_100016330();
  swift_bridgeObjectRelease();
  NSString v10 = sub_100016330();
  swift_bridgeObjectRelease();
  uint64_t v11 = a6[3];
  if (v11)
  {
    uint64_t v12 = sub_10000B194(a6, a6[3]);
    uint64_t v13 = *(void *)(v11 - 8);
    __chkstk_darwin(v12, v12);
    id v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    uint64_t v16 = sub_100016660();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
    sub_10000B1D8((uint64_t)a6);
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = [v6 initWithIdentifier:v9 displayName:v10 initialTimeFontConfiguration:a5 initialTitleColor:v16];

  swift_unknownObjectRelease();
  return v17;
}

uint64_t sub_100011928(uint64_t result, uint64_t a2)
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
    id v15 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v11);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    double v18 = *(double *)(*(void *)(v3 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    unint64_t v19 = sub_100014D10(v16, v17);
    char v21 = v20;
    __n128 result = swift_bridgeObjectRelease();
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

_OWORD *sub_100011ADC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100011AEC()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_100011B34(uint64_t a1)
{
  sub_100010110(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_100011B44()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100011B84()
{
}

uint64_t sub_100011B8C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  int64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *int64_t v4 = v3;
  v4[1] = sub_100013394;
  return v6();
}

uint64_t sub_100011C58(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_100013394;
  return v7();
}

uint64_t sub_100011D24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100016470();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100016460();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10001325C(a1, &qword_100029968);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100016450();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100011ED0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100011FAC;
  return v6(a1);
}

uint64_t sub_100011FAC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000120A4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000120C4(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1000120C4(char a1, int64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000036B4(&qword_100029958);
    unint64_t v10 = (id *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    v10[2] = (id)v8;
    v10[3] = (id)(2 * (v12 >> 5));
  }
  else
  {
    unint64_t v10 = _swiftEmptyArrayStorage;
  }
  unint64_t v13 = (char *)(v10 + 4);
  int64_t v14 = (char *)(a4 + 32);
  if (a1)
  {
    if (v10 != (id *)a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *(void *)(a4 + 16) = 0;
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
  uint64_t result = sub_100016640();
  __break(1u);
  return result;
}

void sub_100012234()
{
  uint64_t v1 = OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__backgroundViewController;
  if (!*(void *)(v0 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__backgroundViewController))
  {
    uint64_t v2 = v0;
    type metadata accessor for MonogramPosterBackgroundViewController();
    id v3 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    uint64_t v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;

    uint64_t v5 = *(void **)(v0 + v1);
    if (!v5) {
      goto LABEL_6;
    }
    sub_10000582C(0, (unint64_t *)&qword_100029AE0);
    swift_beginAccess();
    unint64_t v6 = v5;
    uint64_t v7 = (void *)sub_100016170();
    swift_endAccess();
    v8._rawValue = v7;
    v9.super.Class isa = sub_1000164F0(v8).super.isa;
    unint64_t v10 = *(void **)&v6[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_backgroundColor];
    *(UIColor *)&v6[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_backgroundColor] = v9;

    int64_t v11 = *(void **)(v2 + v1);
    if (!v11) {
      goto LABEL_6;
    }
    swift_beginAccess();
    uint64_t v12 = v11;
    unint64_t v13 = (void *)sub_100016190();
    swift_endAccess();
    v14._rawValue = v13;
    v15.super.Class isa = sub_1000164F0(v14).super.isa;
    uint64_t v16 = *(void **)&v12[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_topBackgroundColor];
    *(UIColor *)&v12[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_topBackgroundColor] = v15;

    if (!*(void *)(v2 + v1)) {
LABEL_6:
    }
      __break(1u);
  }
}

uint64_t sub_100012394()
{
  return _swift_deallocObject(v0, 56, 7);
}

void sub_1000123D4(void *a1)
{
  sub_100010B54(a1, *(void **)(v1 + 16), *(CGFloat *)(v1 + 24), *(CGFloat *)(v1 + 40), *(CGFloat *)(v1 + 48));
}

uint64_t sub_1000123E8()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000123F8(void *a1, void *a2)
{
  uint64_t v3 = v2;
  unint64_t v6 = sub_100016270();
  os_log_type_t v7 = sub_100016490();
  if (os_log_type_enabled(v6, v7))
  {
    Swift::OpaquePointer v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::OpaquePointer v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Populating views", v8, 2u);
    swift_slowDealloc();
  }

  id v9 = [a2 backgroundView];
  sub_100012234();
  if (!v10)
  {
    __break(1u);
    goto LABEL_24;
  }
  id v11 = [v10 view];
  if (!v11)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v12 = v11;
  [v9 addSubview:v11];

  sub_100012234();
  if (!v13)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  id v14 = [v13 view];
  if (!v14)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  UIColor v15 = v14;
  id v16 = [a2 backgroundView];
  sub_1000042F8(v16);

  id v17 = [a2 floatingView];
  uint64_t v18 = OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__monogramViewController;
  unint64_t v19 = *(void **)(v3 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__monogramViewController);
  if (!v19)
  {
    type metadata accessor for MonogramPosterViewController();
    id v20 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    char v21 = *(void **)(v3 + v18);
    *(void *)(v3 + v18) = v20;

    unint64_t v19 = *(void **)(v3 + v18);
    if (!v19) {
      goto LABEL_31;
    }
  }
  id v22 = [v19 view];
  if (!v22) {
    goto LABEL_27;
  }
  char v23 = v22;
  [v17 addSubview:v22];

  uint64_t v24 = *(void **)(v3 + v18);
  if (!v24)
  {
    type metadata accessor for MonogramPosterViewController();
    id v25 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    id v26 = *(void **)(v3 + v18);
    *(void *)(v3 + v18) = v25;

    uint64_t v24 = *(void **)(v3 + v18);
    if (!v24) {
      goto LABEL_32;
    }
  }
  id v27 = [v24 view];
  if (!v27) {
    goto LABEL_28;
  }
  Class v28 = v27;
  id v29 = [a2 floatingView];
  sub_1000042F8(v29);

  sub_100012234();
  if (!v30)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  NSString v31 = v30;
  if (*(void *)(v3 + v18))
  {
    id v32 = v30;
  }
  else
  {
    type metadata accessor for MonogramPosterViewController();
    id v33 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    uint64_t v34 = v31;
    id v35 = [v33 init];
    uint64_t v36 = *(void **)(v3 + v18);
    *(void *)(v3 + v18) = v35;

    if (!*(void *)(v3 + v18))
    {
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
      return;
    }
  }
  *(void *)&v31[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_delegate + 8] = &off_100021340;
  swift_unknownObjectWeakAssign();

  sub_100012234();
  if (!v37) {
    goto LABEL_30;
  }
  id v38 = v37;
  sub_100003920();

  os_log_type_t v39 = *(void **)(v3 + v18);
  if (!v39)
  {
    type metadata accessor for MonogramPosterViewController();
    id v40 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    uint64_t v41 = *(void **)(v3 + v18);
    *(void *)(v3 + v18) = v40;

    os_log_type_t v39 = *(void **)(v3 + v18);
    if (!v39) {
      goto LABEL_34;
    }
  }
  id v42 = v39;
  sub_100004BB8();

  [a1 updateActions];
}

void sub_10001278C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100016270();
  os_log_type_t v3 = sub_100016490();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Invalidating editor", v4, 2u);
    swift_slowDealloc();
  }

  sub_10000E728();
  uint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor_editor);
  *(void *)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor_editor) = 0;

  uint64_t v6 = OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__monogramViewController;
  os_log_type_t v7 = *(void **)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__monogramViewController);
  if (!v7)
  {
    type metadata accessor for MonogramPosterViewController();
    id v8 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    id v9 = *(void **)(v1 + v6);
    *(void *)(v1 + v6) = v8;

    os_log_type_t v7 = *(void **)(v1 + v6);
    if (!v7) {
      goto LABEL_16;
    }
  }
  id v10 = [v7 view];
  if (!v10)
  {
    __break(1u);
    goto LABEL_14;
  }
  id v11 = v10;
  [v10 removeFromSuperview];

  uint64_t v12 = *(void **)(v1 + v6);
  *(void *)(v1 + v6) = 0;

  sub_100012234();
  if (!v13)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  id v14 = [v13 view];
  if (!v14)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return;
  }
  UIColor v15 = v14;
  [v14 removeFromSuperview];

  id v16 = *(void **)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__backgroundViewController);
  *(void *)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__backgroundViewController) = 0;

  oslog = sub_100016270();
  os_log_type_t v17 = sub_100016490();
  if (os_log_type_enabled(oslog, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v17, "Invalidated editor", v18, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_1000129A4()
{
  uint64_t v0 = sub_1000160F0();
  __chkstk_darwin(v0 - 8, v1);
  uint64_t v2 = sub_100016320();
  __chkstk_darwin(v2 - 8, v3);
  sub_1000036B4(&qword_100029910);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100017930;
  sub_100016310();
  sub_1000160E0();
  uint64_t v5 = sub_100016370();
  uint64_t v7 = v6;
  memset(v10, 0, 32);
  id v8 = objc_allocWithZone((Class)PREditingLook);
  *(void *)(v4 + 32) = sub_100011790(0x6C61727574614ELL, 0xE700000000000000, v5, v7, 0, v10);
  *(void *)&v10[0] = v4;
  sub_100016410();
  return *(void *)&v10[0];
}

uint64_t sub_100012B30()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100012B78()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100012C2C;
  uint64_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_100029970 + dword_100029970);
  return v6(v2, v3, v4);
}

uint64_t sub_100012C2C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100012D24()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100013394;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100029980 + dword_100029980);
  return v6(v2, v3, v4);
}

uint64_t sub_100012DE8()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100012E28(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100013394;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100029990 + dword_100029990);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_100012EF4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100012F2C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100012C2C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000299A0 + dword_1000299A0);
  return v6(a1, v4);
}

unint64_t sub_100012FE4()
{
  unint64_t result = qword_1000299C0;
  if (!qword_1000299C0)
  {
    sub_100003624(&qword_1000299B8);
    sub_100013060();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000299C0);
  }
  return result;
}

unint64_t sub_100013060()
{
  unint64_t result = qword_1000299C8;
  if (!qword_1000299C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000299C8);
  }
  return result;
}

uint64_t sub_1000130B4(uint64_t a1, unint64_t a2)
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

uint64_t sub_10001310C(uint64_t a1, unint64_t a2)
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

uint64_t sub_100013164(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000036B4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_1000131C8(uint64_t a1)
{
  sub_100011118(a1, v1, 1);
}

void sub_1000131E8(uint64_t a1)
{
  sub_100011118(a1, v1, 0);
}

uint64_t sub_100013208(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001325C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000036B4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000132B8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100013300(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_100013398(void *a1, void *a2)
{
  uint64_t v3 = v2;
  swift_unknownObjectRetain_n();
  uint64_t v6 = sub_100016270();
  os_log_type_t v7 = sub_100016490();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v78 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    os_log_type_t v77 = a1;
    id v9 = a2;
    id v10 = [a2 description];
    uint64_t v11 = sub_100016360();
    unint64_t v13 = v12;

    a2 = v9;
    sub_1000152CC(v11, v13, &v78);
    a1 = v77;
    sub_100016520();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Initializing renderer with poster environment: %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  uint64_t v14 = OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer__backgroundViewController;
  UIColor v15 = *(char **)(v3 + OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer__backgroundViewController);
  if (!v15)
  {
    type metadata accessor for MonogramPosterBackgroundViewController();
    id v16 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    os_log_type_t v17 = *(void **)(v3 + v14);
    *(void *)(v3 + v14) = v16;

    UIColor v15 = *(char **)(v3 + v14);
    if (!v15) {
      goto LABEL_40;
    }
  }
  uint64_t v18 = OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer__monogramViewController;
  if (*(void *)(v3 + OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer__monogramViewController))
  {
    unint64_t v19 = v15;
  }
  else
  {
    type metadata accessor for MonogramPosterViewController();
    id v20 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    char v21 = v15;
    id v22 = [v20 init];
    char v23 = *(void **)(v3 + v18);
    *(void *)(v3 + v18) = v22;

    if (!*(void *)(v3 + v18))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
      goto LABEL_48;
    }
  }
  *(void *)&v15[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_delegate + 8] = &off_100021340;
  swift_unknownObjectWeakAssign();

  uint64_t v24 = *(void **)(v3 + v14);
  if (!v24)
  {
    type metadata accessor for MonogramPosterBackgroundViewController();
    id v25 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    id v26 = *(void **)(v3 + v14);
    *(void *)(v3 + v14) = v25;

    uint64_t v24 = *(void **)(v3 + v14);
    if (!v24) {
      goto LABEL_42;
    }
  }
  id v27 = v24;
  id v28 = [a2 isSnapshot];
  v27[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_isSnapshot] = (_BYTE)v28;
  id v29 = *(void **)&v27[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_simulationView];
  if (v29)
  {
    id v30 = v28;
    NSString v31 = v29;
    sub_100005868(v30);

    id v27 = v31;
  }

  id v32 = *(void **)(v3 + v18);
  if (!v32)
  {
    type metadata accessor for MonogramPosterViewController();
    id v33 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    uint64_t v34 = *(void **)(v3 + v18);
    *(void *)(v3 + v18) = v33;

    id v32 = *(void **)(v3 + v18);
    if (!v32) {
      goto LABEL_43;
    }
  }
  id v35 = v32;
  unsigned __int8 v36 = [a2 isSnapshot];
  v35[OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_isSnapshot] = v36;
  sub_100004590();

  id v37 = [a2 sourceTimeFontConfiguration];
  if (v37)
  {
    id v38 = v37;
    os_log_type_t v39 = *(void **)(v3 + v18);
    if (!v39)
    {
      type metadata accessor for MonogramPosterViewController();
      id v40 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
      uint64_t v41 = *(void **)(v3 + v18);
      *(void *)(v3 + v18) = v40;

      os_log_type_t v39 = *(void **)(v3 + v18);
      if (!v39) {
        goto LABEL_50;
      }
    }
    uint64_t v42 = PRPosterRoleIncomingCall;
    id v43 = v39;
    id v44 = [v38 effectiveFontForRole:v42];
    sub_1000056F8(v44);
  }
  sub_100013A5C(a2);
  id v45 = [a1 backgroundView];
  uint64_t v46 = *(void **)(v3 + v14);
  if (!v46)
  {
    type metadata accessor for MonogramPosterBackgroundViewController();
    id v47 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    uint64_t v48 = *(void **)(v3 + v14);
    *(void *)(v3 + v14) = v47;

    uint64_t v46 = *(void **)(v3 + v14);
    if (!v46) {
      goto LABEL_44;
    }
  }
  id v49 = [v46 view];
  if (!v49)
  {
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  unint64_t v50 = v49;
  [v45 addSubview:v49];

  NSString v51 = *(void **)(v3 + v14);
  if (!v51)
  {
    type metadata accessor for MonogramPosterBackgroundViewController();
    id v52 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    id v53 = *(void **)(v3 + v14);
    *(void *)(v3 + v14) = v52;

    NSString v51 = *(void **)(v3 + v14);
    if (!v51) {
      goto LABEL_45;
    }
  }
  id v54 = [v51 view];
  if (!v54) {
    goto LABEL_37;
  }
  unint64_t v55 = v54;
  id v56 = [a1 backgroundView];
  sub_1000042F8(v56);

  id v57 = [a1 floatingView];
  unint64_t v58 = *(void **)(v3 + v18);
  if (!v58)
  {
    type metadata accessor for MonogramPosterViewController();
    id v59 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    uint64_t v60 = *(void **)(v3 + v18);
    *(void *)(v3 + v18) = v59;

    unint64_t v58 = *(void **)(v3 + v18);
    if (!v58) {
      goto LABEL_46;
    }
  }
  id v61 = [v58 view];
  if (!v61) {
    goto LABEL_38;
  }
  uint64_t v62 = v61;
  [v57 addSubview:v61];

  uint64_t v63 = *(void **)(v3 + v18);
  if (!v63)
  {
    type metadata accessor for MonogramPosterViewController();
    id v64 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    unint64_t v65 = *(void **)(v3 + v18);
    *(void *)(v3 + v18) = v64;

    uint64_t v63 = *(void **)(v3 + v18);
    if (!v63) {
      goto LABEL_47;
    }
  }
  id v66 = [v63 view];
  if (!v66) {
    goto LABEL_39;
  }
  v67 = v66;
  id v68 = [a1 floatingView];
  sub_1000042F8(v68);

  v69 = *(void **)(v3 + v14);
  if (v69
    || (type metadata accessor for MonogramPosterBackgroundViewController(),
        id v70 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init],
        v71 = *(void **)(v3 + v14),
        *(void *)(v3 + v14) = v70,
        v71,
        (v69 = *(void **)(v3 + v14)) != 0))
  {
    id v72 = v69;
    sub_100003920();

    v73 = *(void **)(v3 + v18);
    if (v73
      || (type metadata accessor for MonogramPosterViewController(),
          id v74 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init],
          v75 = *(void **)(v3 + v18),
          *(void *)(v3 + v18) = v74,
          v75,
          (v73 = *(void **)(v3 + v18)) != 0))
    {
      id v76 = v73;
      sub_100004BB8();

      return;
    }
    goto LABEL_49;
  }
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
}

uint64_t sub_100013A5C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100016200();
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v79 = (uint8_t *)v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000161D0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v10 = __chkstk_darwin(v7, v9);
  unint64_t v12 = (char *)v74 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10, v13);
  UIColor v15 = (char *)v74 - v14;
  uint64_t v16 = sub_100016130();
  uint64_t v81 = *(void *)(v16 - 8);
  unint64_t v82 = v16;
  __chkstk_darwin(v16, v17);
  uint64_t v80 = (char *)v74 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v19 = (char *)v1 + OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer_logger;
  swift_unknownObjectRetain_n();
  unint64_t v83 = v19;
  id v20 = sub_100016270();
  os_log_type_t v21 = sub_100016490();
  BOOL v22 = os_log_type_enabled(v20, v21);
  os_log_t v78 = v2;
  id v76 = v15;
  if (v22)
  {
    uint64_t v23 = swift_slowAlloc();
    os_log_type_t v77 = (uint8_t *)v7;
    uint64_t v24 = (uint8_t *)v23;
    v86[0] = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 136315138;
    uint64_t v75 = v8;
    v74[1] = v24 + 4;
    id v25 = v12;
    id v26 = [a1 description];
    uint64_t v27 = sub_100016360();
    unint64_t v29 = v28;

    unint64_t v12 = v25;
    *(void *)&long long v87 = sub_1000152CC(v27, v29, (uint64_t *)v86);
    uint64_t v8 = v75;
    sub_100016520();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Loading poster configuration from poster environment: %s", v24, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v7 = (uint64_t)v77;
    swift_slowDealloc();
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  swift_unknownObjectWeakInit();
  id v30 = [a1 contents];
  v86[0] = 0;
  id v31 = [v30 loadUserInfoWithError:v86];
  swift_unknownObjectRelease();
  id v32 = v86[0];
  if (v31)
  {
    uint64_t v33 = sub_100016300();
    id v34 = v32;

    uint64_t v36 = v81;
    unint64_t v35 = v82;
    id v37 = v80;
    (*(void (**)(char *, void, unint64_t))(v81 + 104))(v80, enum case for MonogramPosterUserInfoKey.dataRepresentation(_:), v82);
    uint64_t v38 = sub_100016120();
    unint64_t v40 = v39;
    (*(void (**)(char *, unint64_t))(v36 + 8))(v37, v35);
    uint64_t v84 = v38;
    unint64_t v85 = v40;
    sub_100016570();
    if (*(void *)(v33 + 16) && (unint64_t v41 = sub_100014D88((uint64_t)v86), (v42 & 1) != 0))
    {
      sub_100013300(*(void *)(v33 + 56) + 32 * v41, (uint64_t)&v87);
    }
    else
    {
      long long v87 = 0u;
      long long v88 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_100013208((uint64_t)v86);
    if (*((void *)&v88 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v44 = v84;
        unint64_t v43 = v85;
        sub_100016080();
        swift_allocObject();
        sub_100016070();
        sub_100015F4C();
        id v45 = v76;
        sub_100016060();
        uint64_t v81 = v44;
        unint64_t v82 = v43;
        uint64_t v80 = v12;
        os_log_t v60 = v78;
        id v61 = (char *)v78 + OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer_configuration;
        swift_beginAccess();
        (*(void (**)(char *, char *, uint64_t))(v8 + 24))(v61, v45, v7);
        swift_endAccess();
        sub_1000146DC();
        uint64_t v62 = *(void (**)(char *, uint64_t))(v8 + 8);
        v62(v45, v7);
        uint64_t v63 = v60;
        id v64 = sub_100016270();
        os_log_type_t v65 = sub_100016490();
        if (os_log_type_enabled(v64, v65))
        {
          v67 = (uint8_t *)swift_slowAlloc();
          unint64_t v83 = (void *)swift_slowAlloc();
          v86[0] = v83;
          uint64_t v79 = v67;
          *(_DWORD *)v67 = 136315138;
          os_log_type_t v77 = v67 + 4;
          id v68 = v80;
          (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v80, v61, v7);
          uint64_t v69 = sub_100016150();
          os_log_t v78 = v64;
          uint64_t v70 = v69;
          unint64_t v72 = v71;
          v62(v68, v7);
          *(void *)&long long v87 = sub_1000152CC(v70, v72, (uint64_t *)v86);
          sub_100016520();

          swift_bridgeObjectRelease();
          id v64 = v78;
          _os_log_impl((void *)&_mh_execute_header, v78, v65, "Did load poster configuration: %s", v79, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
          swift_release();
        }
        else
        {
          swift_release();
        }
        sub_1000130B4(v81, v82);
        goto LABEL_27;
      }
    }
    else
    {
      sub_100015EEC((uint64_t)&v87);
    }
    unint64_t v55 = sub_100016270();
    os_log_type_t v56 = sub_1000164B0();
    if (os_log_type_enabled(v55, v56))
    {
      id v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v57 = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "Error fetching poster data representation from user info", v57, 2u);
      swift_slowDealloc();
    }

    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      id v64 = Strong;
      type metadata accessor for MonogramPosterColorGenerator();
      sub_100007A24((uint64_t)v79);
      sub_100016140();
      id v59 = (char *)v64 + OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer_configuration;
      swift_beginAccess();
      (*(void (**)(char *, char *, uint64_t))(v8 + 24))(v59, v12, v7);
      swift_endAccess();
      sub_1000146DC();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
LABEL_27:
    }
  }
  else
  {
    id v46 = v86[0];
    sub_1000160D0();

    swift_willThrow();
    swift_errorRetain();
    swift_errorRetain();
    id v47 = sub_100016270();
    os_log_type_t v48 = sub_1000164B0();
    if (os_log_type_enabled(v47, v48))
    {
      id v49 = (uint8_t *)swift_slowAlloc();
      v86[0] = (id)swift_slowAlloc();
      os_log_type_t v77 = (uint8_t *)v7;
      *(_DWORD *)id v49 = 136315138;
      swift_getErrorValue();
      uint64_t v50 = sub_100016680();
      *(void *)&long long v87 = sub_1000152CC(v50, v51, (uint64_t *)v86);
      uint64_t v7 = (uint64_t)v77;
      sub_100016520();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "Error decoding poster configuration: %s", v49, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
    }
    swift_beginAccess();
    uint64_t v52 = swift_unknownObjectWeakLoadStrong();
    if (v52)
    {
      id v53 = (char *)v52;
      type metadata accessor for MonogramPosterColorGenerator();
      sub_100007A24((uint64_t)v79);
      sub_100016140();
      id v54 = &v53[OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer_configuration];
      swift_beginAccess();
      (*(void (**)(char *, char *, uint64_t))(v8 + 24))(v54, v12, v7);
      swift_endAccess();
      sub_1000146DC();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
    }
    swift_errorRelease();
  }
  return swift_unknownObjectWeakDestroy();
}

void sub_1000146DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100016270();
  os_log_type_t v3 = sub_100016490();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Configuration changed, updating views", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer__backgroundViewController;
  uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer__backgroundViewController);
  if (!v6)
  {
    type metadata accessor for MonogramPosterBackgroundViewController();
    id v7 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    uint64_t v8 = *(void **)(v1 + v5);
    *(void *)(v1 + v5) = v7;

    uint64_t v6 = *(void **)(v1 + v5);
    if (!v6)
    {
      __break(1u);
LABEL_11:
      __break(1u);
      goto LABEL_12;
    }
  }
  sub_100016000();
  swift_beginAccess();
  uint64_t v9 = v6;
  uint64_t v10 = (void *)sub_100016170();
  swift_endAccess();
  v11._rawValue = v10;
  v12.super.Class isa = sub_1000164F0(v11).super.isa;
  uint64_t v13 = *(void **)&v9[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_backgroundColor];
  *(UIColor *)&v9[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_backgroundColor] = v12;

  uint64_t v14 = *(void **)(v1 + v5);
  if (!v14)
  {
    type metadata accessor for MonogramPosterBackgroundViewController();
    id v15 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    uint64_t v16 = *(void **)(v1 + v5);
    *(void *)(v1 + v5) = v15;

    uint64_t v14 = *(void **)(v1 + v5);
    if (!v14) {
      goto LABEL_11;
    }
  }
  swift_beginAccess();
  uint64_t v17 = v14;
  uint64_t v18 = (void *)sub_100016190();
  swift_endAccess();
  v19._rawValue = v18;
  v20.super.Class isa = sub_1000164F0(v19).super.isa;
  os_log_type_t v21 = *(void **)&v17[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_topBackgroundColor];
  *(UIColor *)&v17[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_topBackgroundColor] = v20;

  uint64_t v22 = OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer__monogramViewController;
  uint64_t v23 = *(void **)(v1 + OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer__monogramViewController);
  if (v23
    || (type metadata accessor for MonogramPosterViewController(),
        id v24 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init],
        id v25 = *(void **)(v1 + v22),
        *(void *)(v1 + v22) = v24,
        v25,
        (uint64_t v23 = *(void **)(v1 + v22)) != 0))
  {
    swift_beginAccess();
    id v26 = v23;
    uint64_t v27 = sub_1000161B0();
    uint64_t v29 = v28;
    swift_endAccess();
    id v30 = (uint64_t *)&v26[OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_monogramString];
    *id v30 = v27;
    v30[1] = v29;
    swift_bridgeObjectRelease();
    id v31 = *(void **)&v26[OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_hiddenLabel];
    swift_bridgeObjectRetain();
    NSString v32 = sub_100016330();
    swift_bridgeObjectRelease();
    [v31 setText:v32];

    return;
  }
LABEL_12:
  __break(1u);
}

id sub_1000149B4()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = sub_100016200();
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer__backgroundViewController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer__monogramViewController] = 0;
  uint64_t v6 = v0;
  sub_100016280();
  type metadata accessor for MonogramPosterColorGenerator();
  sub_100007A24((uint64_t)v5);
  sub_100016140();

  v8.receiver = v6;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, "init");
}

uint64_t sub_100014BE4()
{
  return type metadata accessor for MonogramPosterRenderer();
}

uint64_t type metadata accessor for MonogramPosterRenderer()
{
  uint64_t result = qword_100029AB8;
  if (!qword_100029AB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100014C38()
{
  uint64_t result = sub_100016290();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1000161D0();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

unint64_t sub_100014D10(uint64_t a1, uint64_t a2)
{
  sub_100016690();
  sub_1000163A0();
  Swift::Int v4 = sub_1000166C0();

  return sub_100014ECC(a1, a2, v4);
}

unint64_t sub_100014D88(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100016550(*(void *)(v2 + 40));

  return sub_100014FB0(a1, v4);
}

unint64_t sub_100014DCC(uint64_t a1)
{
  sub_100016360();
  sub_100016690();
  sub_1000163A0();
  Swift::Int v2 = sub_1000166C0();
  swift_bridgeObjectRelease();

  return sub_100015078(a1, v2);
}

double sub_100014E60(uint64_t a1)
{
  sub_100016690();
  sub_100015924((uint64_t)v4, a1);
  Swift::Int v2 = sub_1000166C0();

  return sub_1000151F0(a1, v2);
}

unint64_t sub_100014ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100016670() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100016670() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100014FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100015FA4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100016560();
      sub_100013208((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100015078(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_100016360();
    uint64_t v8 = v7;
    if (v6 == sub_100016360() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_100016670();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_100016360();
          uint64_t v15 = v14;
          if (v13 == sub_100016360() && v15 == v16) {
            break;
          }
          char v18 = sub_100016670();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

double sub_1000151F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = ~v4;
    uint64_t v7 = *(void *)(a1 + 16);
    while (1)
    {
      uint64_t v8 = *(void *)(*(void *)(v2 + 48) + 8 * v5);
      if (*(void *)(v8 + 16) == v7)
      {
        if (!v7 || v8 == a1) {
          return result;
        }
        double result = *(double *)(v8 + 32);
        if (result == *(double *)(a1 + 32))
        {
          if (v7 == 1) {
            return result;
          }
          double result = *(double *)(v8 + 40);
          if (result == *(double *)(a1 + 40)) {
            break;
          }
        }
      }
LABEL_3:
      unint64_t v5 = (v5 + 1) & v6;
      if (((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
        return result;
      }
    }
    uint64_t v10 = (double *)(v8 + 48);
    uint64_t v11 = v7 - 2;
    uint64_t v12 = (double *)(a1 + 48);
    while (v11)
    {
      double v13 = *v10++;
      double result = v13;
      double v14 = *v12++;
      --v11;
      if (result != v14) {
        goto LABEL_3;
      }
    }
  }
  return result;
}

uint64_t sub_1000152CC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000153A0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100013300((uint64_t)v12, *a3);
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
      sub_100013300((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000B1D8((uint64_t)v12);
  return v7;
}

uint64_t sub_1000153A0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100016530();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10001555C(a5, a6);
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
  uint64_t v8 = sub_1000165A0();
  if (!v8)
  {
    sub_100016600();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100016640();
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

uint64_t sub_10001555C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000155F4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000157D4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000157D4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000155F4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001576C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100016580();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100016600();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000163D0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100016640();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100016600();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001576C(uint64_t a1, uint64_t a2)
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
  sub_1000036B4(&qword_100029AC8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000157D4(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000036B4(&qword_100029AC8);
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
  double v13 = a4 + 32;
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
  uint64_t result = sub_100016640();
  __break(1u);
  return result;
}

void sub_100015924(uint64_t a1, uint64_t a2)
{
  Swift::UInt v3 = *(void *)(a2 + 16);
  sub_1000166A0(v3);
  if (v3)
  {
    unint64_t v4 = (Swift::UInt64 *)(a2 + 32);
    do
    {
      Swift::UInt64 v6 = *v4++;
      Swift::UInt64 v5 = v6;
      if ((v6 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v7 = v5;
      }
      else {
        Swift::UInt64 v7 = 0;
      }
      sub_1000166B0(v7);
      --v3;
    }
    while (v3);
  }
}

void sub_10001597C(void *a1)
{
  uint64_t v2 = v1;
  swift_unknownObjectRetain_n();
  unint64_t v4 = sub_100016270();
  os_log_type_t v5 = sub_100016490();
  if (os_log_type_enabled(v4, v5))
  {
    Swift::UInt64 v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    *(_DWORD *)Swift::UInt64 v6 = 136315138;
    id v7 = [a1 description];
    uint64_t v8 = sub_100016360();
    unint64_t v10 = v9;

    sub_1000152CC(v8, v10, &v34);
    sub_100016520();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Updating renderer with poster environment: %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  uint64_t v11 = OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer__backgroundViewController;
  uint64_t v12 = *(void **)(v2 + OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer__backgroundViewController);
  if (!v12)
  {
    type metadata accessor for MonogramPosterBackgroundViewController();
    id v13 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    double v14 = *(void **)(v2 + v11);
    *(void *)(v2 + v11) = v13;

    uint64_t v12 = *(void **)(v2 + v11);
    if (!v12)
    {
      __break(1u);
LABEL_16:
      __break(1u);
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
  }
  uint64_t v15 = v12;
  id v16 = [a1 isSnapshot];
  v15[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_isSnapshot] = (_BYTE)v16;
  uint64_t v17 = *(void **)&v15[OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_simulationView];
  if (v17)
  {
    char v18 = v16;
    Swift::OpaquePointer v19 = v17;
    sub_100005868(v18);

    uint64_t v15 = v19;
  }

  uint64_t v20 = OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer__monogramViewController;
  os_log_type_t v21 = *(void **)(v2 + OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer__monogramViewController);
  if (!v21)
  {
    type metadata accessor for MonogramPosterViewController();
    id v22 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    uint64_t v23 = *(void **)(v2 + v20);
    *(void *)(v2 + v20) = v22;

    os_log_type_t v21 = *(void **)(v2 + v20);
    if (!v21) {
      goto LABEL_16;
    }
  }
  id v24 = v21;
  unsigned __int8 v25 = [a1 isSnapshot];
  v24[OBJC_IVAR____TtC23MonogramPosterExtension28MonogramPosterViewController_isSnapshot] = v25;
  sub_100004590();

  sub_100013A5C(a1);
  id v26 = *(void **)(v2 + v11);
  if (!v26)
  {
    type metadata accessor for MonogramPosterBackgroundViewController();
    id v27 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    uint64_t v28 = *(void **)(v2 + v11);
    *(void *)(v2 + v11) = v27;

    id v26 = *(void **)(v2 + v11);
    if (!v26) {
      goto LABEL_17;
    }
  }
  id v29 = v26;
  sub_100003920();

  id v30 = *(void **)(v2 + v20);
  if (v30
    || (type metadata accessor for MonogramPosterViewController(),
        id v31 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init],
        NSString v32 = *(void **)(v2 + v20),
        *(void *)(v2 + v20) = v31,
        v32,
        (id v30 = *(void **)(v2 + v20)) != 0))
  {
    id v33 = v30;
    sub_100004BB8();

    return;
  }
LABEL_18:
  __break(1u);
}

void sub_100015CD0()
{
  uint64_t v1 = sub_100016270();
  os_log_type_t v2 = sub_100016490();
  if (os_log_type_enabled(v1, v2))
  {
    Swift::UInt v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::UInt v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Invalidating renderer", v3, 2u);
    swift_slowDealloc();
  }

  uint64_t v4 = OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer__monogramViewController;
  os_log_type_t v5 = *(void **)(v0 + OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer__monogramViewController);
  if (!v5)
  {
    type metadata accessor for MonogramPosterViewController();
    id v6 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    id v7 = *(void **)(v0 + v4);
    *(void *)(v0 + v4) = v6;

    os_log_type_t v5 = *(void **)(v0 + v4);
    if (!v5) {
      goto LABEL_16;
    }
  }
  id v8 = [v5 view];
  if (!v8)
  {
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    return;
  }
  unint64_t v9 = v8;
  [v8 removeFromSuperview];

  unint64_t v10 = *(void **)(v0 + v4);
  *(void *)(v0 + v4) = 0;

  uint64_t v11 = OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer__backgroundViewController;
  uint64_t v12 = *(void **)(v0 + OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer__backgroundViewController);
  if (!v12)
  {
    type metadata accessor for MonogramPosterBackgroundViewController();
    id v13 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    double v14 = *(void **)(v0 + v11);
    *(void *)(v0 + v11) = v13;

    uint64_t v12 = *(void **)(v0 + v11);
    if (!v12) {
      goto LABEL_17;
    }
  }
  id v15 = [v12 view];
  if (!v15) {
    goto LABEL_15;
  }
  id v16 = v15;
  [v15 removeFromSuperview];

  uint64_t v17 = *(void **)(v0 + v11);
  *(void *)(v0 + v11) = 0;

  oslog = sub_100016270();
  os_log_type_t v18 = sub_100016490();
  if (os_log_type_enabled(oslog, v18))
  {
    Swift::OpaquePointer v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::OpaquePointer v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v18, "Invalidated renderer", v19, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_100015EEC(uint64_t a1)
{
  uint64_t v2 = sub_1000036B4((uint64_t *)&unk_100029AD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100015F4C()
{
  unint64_t result = qword_100029A00;
  if (!qword_100029A00)
  {
    sub_1000161D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029A00);
  }
  return result;
}

uint64_t sub_100015FA4(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_100016000()
{
  unint64_t result = qword_100029AE0;
  if (!qword_100029AE0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100029AE0);
  }
  return result;
}

uint64_t sub_100016040()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100016050()
{
  return type metadata accessor for Notification();
}

uint64_t sub_100016060()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t sub_100016070()
{
  return PropertyListDecoder.init()();
}

uint64_t sub_100016080()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t sub_100016090()
{
  return dispatch thunk of PropertyListEncoder.outputFormat.setter();
}

uint64_t sub_1000160A0()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t sub_1000160B0()
{
  return PropertyListEncoder.init()();
}

uint64_t sub_1000160C0()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t sub_1000160D0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_1000160E0()
{
  return static Locale.current.getter();
}

uint64_t sub_1000160F0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100016100()
{
  return _AnySceneConfiguration.init<A>(erasing:)();
}

uint64_t sub_100016110()
{
  return type metadata accessor for _AnySceneConfiguration();
}

uint64_t sub_100016120()
{
  return MonogramPosterUserInfoKey.rawValue.getter();
}

uint64_t sub_100016130()
{
  return type metadata accessor for MonogramPosterUserInfoKey();
}

uint64_t sub_100016140()
{
  return MonogramPosterConfiguration.init(backgroundColor:initials:supportedForName:)();
}

uint64_t sub_100016150()
{
  return MonogramPosterConfiguration.debugDescription.getter();
}

uint64_t sub_100016160()
{
  return MonogramPosterConfiguration.monogramSupportedForName.getter();
}

uint64_t sub_100016170()
{
  return MonogramPosterConfiguration.backgroundColorDescription.getter();
}

uint64_t sub_100016180()
{
  return MonogramPosterConfiguration.backgroundColorDescription.setter();
}

uint64_t sub_100016190()
{
  return MonogramPosterConfiguration.topBackgroundColorDescription.getter();
}

uint64_t sub_1000161A0()
{
  return MonogramPosterConfiguration.topBackgroundColorDescription.setter();
}

uint64_t sub_1000161B0()
{
  return MonogramPosterConfiguration.initials.getter();
}

uint64_t sub_1000161C0()
{
  return MonogramPosterConfiguration.initials.setter();
}

uint64_t sub_1000161D0()
{
  return type metadata accessor for MonogramPosterConfiguration();
}

uint64_t sub_1000161E0()
{
  return MonogramPosterBackgroundColor.init(topColor:bottomColor:)();
}

uint64_t sub_1000161F0()
{
  return MonogramPosterBackgroundColor.bottomColor.getter();
}

uint64_t sub_100016200()
{
  return type metadata accessor for MonogramPosterBackgroundColor();
}

uint64_t sub_100016210()
{
  return MonogramPosterBackgroundColors.getter();
}

uint64_t sub_100016220()
{
  return MonogramPosterBackgroundColorBottomToTop.getter();
}

uint64_t sub_100016230()
{
  return MonogramPosterOffset.getter();
}

uint64_t sub_100016240()
{
  return static _AppExtension<>.main()();
}

uint64_t sub_100016250()
{
  return _AppExtension.hostAuditToken.getter();
}

uint64_t sub_100016260()
{
  return static _SceneBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100016270()
{
  return Logger.logObject.getter();
}

uint64_t sub_100016280()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100016290()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000162A0()
{
  return type metadata accessor for PREditingConfiguration();
}

uint64_t sub_1000162B0()
{
  return PREditingConfiguration.init(_:)();
}

uint64_t sub_1000162C0()
{
  return PRProviderConfiguration.init(updatingDelegate:content:)();
}

uint64_t sub_1000162D0()
{
  return type metadata accessor for PRRenderingConfiguration();
}

uint64_t sub_1000162E0()
{
  return PRRenderingConfiguration.init(_:)();
}

NSDictionary sub_1000162F0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100016300()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100016310()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100016320()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_100016330()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100016340()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100016350()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100016360()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100016370()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_100016380()
{
  return String.uppercased()()._countAndFlagsBits;
}

uint64_t sub_100016390()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_1000163A0()
{
  return String.hash(into:)();
}

uint64_t sub_1000163B0()
{
  return String.count.getter();
}

uint64_t sub_1000163C0()
{
  return String.index(_:offsetBy:)();
}

Swift::Int sub_1000163D0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000163E0()
{
  return String.subscript.getter();
}

uint64_t sub_1000163F0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100016400()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100016410()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100016420()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100016430()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_100016440()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100016450()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100016460()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100016470()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100016480()
{
  return CGColorRef.components.getter();
}

uint64_t sub_100016490()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1000164A0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_1000164B0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000164C0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000164D0()
{
  return simd_float4x4.init(_:)();
}

uint64_t sub_1000164E0()
{
  return UIColor.truncatedKey.getter();
}

UIColor sub_1000164F0(Swift::OpaquePointer monogramColorDescription)
{
  return UIColor.init(monogramColorDescription:)(monogramColorDescription);
}

uint64_t sub_100016500()
{
  return UIColor.monogramColorDescription.getter();
}

uint64_t sub_100016510()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t sub_100016520()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100016530()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100016540()
{
  return _bridgeAnyObjectToAny(_:)();
}

Swift::Int sub_100016550(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100016560()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100016570()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100016580()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100016590()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000165A0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000165B0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1000165C0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1000165D0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_1000165E0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_1000165F0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100016600()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100016610()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100016620()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100016630()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100016640()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100016660()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_100016670()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100016680()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100016690()
{
  return Hasher.init(_seed:)();
}

void sub_1000166A0(Swift::UInt a1)
{
}

void sub_1000166B0(Swift::UInt64 a1)
{
}

Swift::Int sub_1000166C0()
{
  return Hasher._finalize()();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return _CGColorCreateCopyByMatchingToColorSpace(a1, intent, color, options);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetGrayStrokeColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CNStringContainsChineseJapaneseKoreanCharacters()
{
  return _CNStringContainsChineseJapaneseKoreanCharacters();
}

uint64_t CNStringContainsEmojiCharacters()
{
  return _CNStringContainsEmojiCharacters();
}

id MTLCreateSystemDefaultDevice(void)
{
  return _MTLCreateSystemDefaultDevice();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
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

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
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

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}