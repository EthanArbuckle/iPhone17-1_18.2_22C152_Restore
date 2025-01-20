@interface SecureSpeakerRecognitionConfig
- (BOOL)implicitTrainingEnabled;
- (BOOL)useTDTIEnrollment;
- (NSArray)phraseConfig;
- (NSString)psrConfigString;
- (NSString)satConfigString;
- (SecureMemoryIndex)psrMemoryIndex;
- (SecureMemoryIndex)satMemoryIndex;
- (SecureSpeakerRecognitionConfig)init;
- (SecureSpeakerRecognitionConfig)initWithNumPruningRetentionUtt:(int64_t)a3 pruningExplicitSATThreshold:(float)a4 pruningExplicitPSRThreshold:(float)a5 pruningSATThreshold:(float)a6 pruningPSRThreshold:(float)a7 combinationWeight:(float)a8 implicitProfileThreshold:(float)a9 implicitProfileDeltaThreshold:(float)a10 implicitVTThreshold:(float)a11 maxEnrollmentUtterances:(int64_t)a12 implicitTrainingEnabled:(BOOL)a13 useTDTIEnrollment:(BOOL)a14 phraseConfig:(id)a15 satMemoryIndex:(id)a16 psrMemoryIndex:(id)a17 satConfig:(id)a18 psrConfig:(id)a19;
- (float)combinationWeight;
- (float)implicitProfileDeltaThreshold;
- (float)implicitProfileThreshold;
- (float)implicitVTThreshold;
- (float)pruningExplicitPSRThreshold;
- (float)pruningExplicitSATThreshold;
- (float)pruningPSRThreshold;
- (float)pruningSATThreshold;
- (int64_t)maxEnrollmentUtterances;
- (int64_t)numPruningRetentionUtt;
- (void)setPsrConfigString:(id)a3;
- (void)setSatConfigString:(id)a3;
@end

@implementation SecureSpeakerRecognitionConfig

- (NSArray)phraseConfig
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___SecureSpeakerRecognitionConfig_phraseConfig))
  {
    type metadata accessor for SecureSpeakerRecognitionPhraseConfig((uint64_t)self);
    swift_bridgeObjectRetain();
    v2 = (void *)sub_24C78B960();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (int64_t)numPruningRetentionUtt
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___SecureSpeakerRecognitionConfig_numPruningRetentionUtt);
}

- (float)pruningExplicitSATThreshold
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___SecureSpeakerRecognitionConfig_pruningExplicitSATThreshold);
}

- (float)pruningExplicitPSRThreshold
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___SecureSpeakerRecognitionConfig_pruningExplicitPSRThreshold);
}

- (float)pruningSATThreshold
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___SecureSpeakerRecognitionConfig_pruningSATThreshold);
}

- (float)pruningPSRThreshold
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___SecureSpeakerRecognitionConfig_pruningPSRThreshold);
}

- (float)combinationWeight
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___SecureSpeakerRecognitionConfig_combinationWeight);
}

- (float)implicitProfileThreshold
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___SecureSpeakerRecognitionConfig_implicitProfileThreshold);
}

- (float)implicitProfileDeltaThreshold
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___SecureSpeakerRecognitionConfig_implicitProfileDeltaThreshold);
}

- (float)implicitVTThreshold
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___SecureSpeakerRecognitionConfig_implicitVTThreshold);
}

- (int64_t)maxEnrollmentUtterances
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___SecureSpeakerRecognitionConfig_maxEnrollmentUtterances);
}

- (BOOL)implicitTrainingEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___SecureSpeakerRecognitionConfig_implicitTrainingEnabled);
}

- (BOOL)useTDTIEnrollment
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___SecureSpeakerRecognitionConfig_useTDTIEnrollment);
}

- (SecureMemoryIndex)satMemoryIndex
{
  return (SecureMemoryIndex *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR___SecureSpeakerRecognitionConfig_satMemoryIndex));
}

- (SecureMemoryIndex)psrMemoryIndex
{
  return (SecureMemoryIndex *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR___SecureSpeakerRecognitionConfig_psrMemoryIndex));
}

- (NSString)satConfigString
{
  return (NSString *)sub_24C7818BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SecureSpeakerRecognitionConfig_satConfigString);
}

- (void)setSatConfigString:(id)a3
{
}

- (NSString)psrConfigString
{
  return (NSString *)sub_24C7818BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SecureSpeakerRecognitionConfig_psrConfigString);
}

- (void)setPsrConfigString:(id)a3
{
}

- (SecureSpeakerRecognitionConfig)initWithNumPruningRetentionUtt:(int64_t)a3 pruningExplicitSATThreshold:(float)a4 pruningExplicitPSRThreshold:(float)a5 pruningSATThreshold:(float)a6 pruningPSRThreshold:(float)a7 combinationWeight:(float)a8 implicitProfileThreshold:(float)a9 implicitProfileDeltaThreshold:(float)a10 implicitVTThreshold:(float)a11 maxEnrollmentUtterances:(int64_t)a12 implicitTrainingEnabled:(BOOL)a13 useTDTIEnrollment:(BOOL)a14 phraseConfig:(id)a15 satMemoryIndex:(id)a16 psrMemoryIndex:(id)a17 satConfig:(id)a18 psrConfig:(id)a19
{
  uint64_t v29 = (uint64_t)a18;
  if (a15)
  {
    type metadata accessor for SecureSpeakerRecognitionPhraseConfig((uint64_t)self);
    uint64_t v30 = sub_24C78B970();
  }
  else
  {
    uint64_t v30 = 0;
  }
  id v31 = a16;
  id v32 = a17;
  if (!a18)
  {
    id v40 = a19;
    unint64_t v36 = 0xF000000000000000;
    if (a19) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v37 = 0;
    unint64_t v39 = 0xF000000000000000;
    goto LABEL_9;
  }
  id v33 = a18;
  id v34 = a19;
  uint64_t v29 = sub_24C78B6E0();
  unint64_t v36 = v35;

  if (!a19) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v37 = sub_24C78B6E0();
  unint64_t v39 = v38;

LABEL_9:
  v41 = (SecureSpeakerRecognitionConfig *)sub_24C781FFC(a3, a12, a13, a14, v30, v31, v32, v29, a4, a5, a6, a7, a8, a9, a10, a11, v36, v37, v39);
  sub_24C775B1C(v37, v39);
  sub_24C775B1C(v29, v36);

  return v41;
}

- (SecureSpeakerRecognitionConfig)init
{
  result = (SecureSpeakerRecognitionConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end