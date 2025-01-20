@interface ActuationController
+ (BOOL)supportsSecureCoding;
- (_TtC11DockKitCore19ActuationController)initWithAccessory:(id)a3 id:(int64_t)a4 motionModel:(int64_t)a5 name:(id)a6 actuators:(id)a7;
- (_TtC11DockKitCore19ActuationController)initWithAccessory:(id)a3 id:(int64_t)a4 type:(int64_t)a5 name:(id)a6;
- (_TtC11DockKitCore19ActuationController)initWithCoder:(id)a3;
- (void)actuatorFeedbackWithInfo:(id)a3 system:(id)a4 actuators:(id)a5 positions:(id)a6 velocities:(id)a7 timestamp:(double)a8;
- (void)disconnectedWithErr:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getActuatorFeedbackWithActuators:(NSArray *)a3 delegate:(_TtP11DockKitCore25XPCActuatorClientProtocol_ *)a4 occurrence:(int64_t)a5 completionHandler:(id)a6;
- (void)getCurrentFeedbackWithActuators:(NSArray *)a3 completionHandler:(id)a4;
- (void)setActuatorPositionsWithActuators:(NSArray *)a3 positions:(NSArray *)a4 completionHandler:(id)a5;
- (void)setActuatorVelocitiesWithActuatorNames:(NSArray *)a3 velocities:(NSArray *)a4 completionHandler:(id)a5;
- (void)setActuatorVelocitiesWithActuators:(NSArray *)a3 velocities:(NSArray *)a4 completionHandler:(id)a5;
- (void)setRotationWithYaw:(double)a3 pitch:(double)a4 roll:(double)a5 completionHandler:(id)a6;
- (void)setRotationalVelocityWithYaw:(double)a3 pitch:(double)a4 roll:(double)a5 completionHandler:(id)a6;
- (void)stopActuatorFeedbackWithCompletionHandler:(id)a3;
- (void)trajectoryProgressFeedbackWithInfo:(id)a3 system:(id)a4 progress:(id)a5;
@end

@implementation ActuationController

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC11DockKitCore19ActuationController)initWithAccessory:(id)a3 id:(int64_t)a4 motionModel:(int64_t)a5 name:(id)a6 actuators:(id)a7
{
  unint64_t v10 = sub_24CF3B320();
  v12 = v11;
  type metadata accessor for Actuator();
  unint64_t v13 = sub_24CF3B470();
  id v14 = a3;
  v15 = (_TtC11DockKitCore19ActuationController *)sub_24CED43B8(a3, a4, a5, v10, v12, v13);

  swift_bridgeObjectRelease();
  return v15;
}

- (_TtC11DockKitCore19ActuationController)initWithAccessory:(id)a3 id:(int64_t)a4 type:(int64_t)a5 name:(id)a6
{
  uint64_t v9 = sub_24CF3B320();
  uint64_t v11 = v10;
  id v12 = a3;
  unint64_t v13 = (_TtC11DockKitCore19ActuationController *)sub_24CED4944((uint64_t)a3, a4, a5, v9, v11);

  return v13;
}

- (void)actuatorFeedbackWithInfo:(id)a3 system:(id)a4 actuators:(id)a5 positions:(id)a6 velocities:(id)a7 timestamp:(double)a8
{
  uint64_t v10 = sub_24CF3B470();
  uint64_t v11 = sub_24CF3B470();
  uint64_t v12 = sub_24CF3B470();
  id v13 = a3;
  id v14 = self;
  sub_24CED4C7C(v10, v11, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)trajectoryProgressFeedbackWithInfo:(id)a3 system:(id)a4 progress:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = self;
  sub_24CED52EC(v8);
}

- (void)disconnectedWithErr:(id)a3
{
  v4 = self;
  id v5 = a3;
  _s11DockKitCore19ActuationControllerC12disconnected3errys5Error_pSg_tF_0();
}

- (void)setRotationWithYaw:(double)a3 pitch:(double)a4 roll:(double)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v11 - 8);
  id v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject();
  *(double *)(v15 + 16) = a3;
  *(double *)(v15 + 24) = a4;
  *(double *)(v15 + 32) = a5;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = self;
  uint64_t v16 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_26983BCA8;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_26983BCB0;
  v18[5] = v17;
  v19 = self;
  sub_24CF244A8((uint64_t)v13, (uint64_t)&unk_26983BCB8, (uint64_t)v18);
  swift_release();
}

- (void)setActuatorVelocitiesWithActuatorNames:(NSArray *)a3 velocities:(NSArray *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  id v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26983BC88;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26983BC90;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_24CF244A8((uint64_t)v11, (uint64_t)&unk_26983BC98, (uint64_t)v16);
  swift_release();
}

- (void)setRotationalVelocityWithYaw:(double)a3 pitch:(double)a4 roll:(double)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v11 - 8);
  id v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject();
  *(double *)(v15 + 16) = a3;
  *(double *)(v15 + 24) = a4;
  *(double *)(v15 + 32) = a5;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = self;
  uint64_t v16 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_26983BC68;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_26983BC70;
  v18[5] = v17;
  v19 = self;
  sub_24CF244A8((uint64_t)v13, (uint64_t)&unk_26983BC78, (uint64_t)v18);
  swift_release();
}

- (void)setActuatorPositionsWithActuators:(NSArray *)a3 positions:(NSArray *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  id v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26983BC48;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26983BC50;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_24CF244A8((uint64_t)v11, (uint64_t)&unk_26983BC58, (uint64_t)v16);
  swift_release();
}

- (void)setActuatorVelocitiesWithActuators:(NSArray *)a3 velocities:(NSArray *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  id v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26983BC28;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26983BC30;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_24CF244A8((uint64_t)v11, (uint64_t)&unk_26983BC38, (uint64_t)v16);
  swift_release();
}

- (void)getActuatorFeedbackWithActuators:(NSArray *)a3 delegate:(_TtP11DockKitCore25XPCActuatorClientProtocol_ *)a4 occurrence:(int64_t)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v11 - 8);
  id v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_26983BC08;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_26983BC10;
  v18[5] = v17;
  v19 = a3;
  swift_unknownObjectRetain();
  uint64_t v20 = self;
  sub_24CF244A8((uint64_t)v13, (uint64_t)&unk_26983BC18, (uint64_t)v18);
  swift_release();
}

- (void)getCurrentFeedbackWithActuators:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  id v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26983BBE8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983BBF0;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_24CF244A8((uint64_t)v9, (uint64_t)&unk_26983BBF8, (uint64_t)v14);
  swift_release();
}

- (void)stopActuatorFeedbackWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26983BBC8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983BBD0;
  v12[5] = v11;
  id v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983B880, (uint64_t)v12);
  swift_release();
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v7 = self;
  uint64_t v5 = (void *)sub_24CF3B5B0();
  uint64_t v6 = (void *)sub_24CF3B300();
  objc_msgSend(v4, sel_encodeObject_forKey_, v5, v6);

  sub_24CEBF19C(v4);
}

- (_TtC11DockKitCore19ActuationController)initWithCoder:(id)a3
{
  return (_TtC11DockKitCore19ActuationController *)ActuationController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11DockKitCore19ActuationController_logger;
  uint64_t v4 = sub_24CF3B1C0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC11DockKitCore19ActuationController_lastFeedbackTime;
  uint64_t v6 = sub_24CF3A960();
  uint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC11DockKitCore19ActuationController_lastFeedbackRequest, v6);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v8 = (char *)self + OBJC_IVAR____TtC11DockKitCore19ActuationController__feedbackStarted;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26983B6D8);
  uint64_t v10 = *(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8);
  v10(v8, v9);
}

@end