@interface AEAssessmentModeGestalt
+ (id)keyPathsForValuesAffectingActive;
+ (id)makeAssessmentStateReaderWithQueue:(id)a3;
- (AEAssessmentModeGestalt)init;
- (AEAssessmentModeGestalt)initWithQueue:(id)a3;
- (AEAssessmentStateReading)assessmentStateReader;
- (BOOL)isActive;
@end

@implementation AEAssessmentModeGestalt

- (AEAssessmentModeGestalt)initWithQueue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AEAssessmentModeGestalt;
  v5 = [(AEAssessmentModeGestalt *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[AEAssessmentModeGestalt makeAssessmentStateReaderWithQueue:v4];
    assessmentStateReader = v5->_assessmentStateReader;
    v5->_assessmentStateReader = (AEAssessmentStateReading *)v6;
  }
  return v5;
}

- (AEAssessmentModeGestalt)init
{
  return [(AEAssessmentModeGestalt *)self initWithQueue:MEMORY[0x263EF83A0]];
}

+ (id)makeAssessmentStateReaderWithQueue:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  if (AEIsMultiAppAvailableForDeviceType([v4 deviceType]))
  {
    v5 = [AEFileBackedAssessmentStateReader alloc];
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = objc_opt_new();
    v8 = +[AEFileSystem assessmentModeFileURL];
    objc_super v9 = [(AEFileBackedAssessmentStateReader *)v5 initWithSystemNotificationPrimitives:v6 fileSystemPrimitives:v7 assessmentFileURL:v8 queue:v3];

    id v3 = (id)v7;
  }
  else
  {
    v10 = [AEAccessibilityServerBackedAssessmentStateReader alloc];
    uint64_t v6 = objc_opt_new();
    objc_super v9 = [(AEAccessibilityServerBackedAssessmentStateReader *)v10 initWithAccessibilityServerPrimitives:v6 queue:v3];
  }

  return v9;
}

+ (id)keyPathsForValuesAffectingActive
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"assessmentStateReader.active"];
}

- (BOOL)isActive
{
  v2 = [(AEAssessmentModeGestalt *)self assessmentStateReader];
  char v3 = [v2 isActive];

  return v3;
}

- (AEAssessmentStateReading)assessmentStateReader
{
  return self->_assessmentStateReader;
}

- (void).cxx_destruct
{
}

@end