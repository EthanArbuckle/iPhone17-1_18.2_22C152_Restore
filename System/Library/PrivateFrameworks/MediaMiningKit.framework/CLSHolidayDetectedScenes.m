@interface CLSHolidayDetectedScenes
- (CLSHolidayDetectedScenes)init;
- (unint64_t)detectedSceneEdgeCaseCount;
- (unint64_t)detectedSceneImperativeCount;
- (unint64_t)detectedSceneImportantCount;
- (unint64_t)detectedSceneMediumCount;
- (void)recordDetectedSceneImportance:(unint64_t)a3;
@end

@implementation CLSHolidayDetectedScenes

- (unint64_t)detectedSceneImperativeCount
{
  return self->_detectedSceneImperativeCount;
}

- (unint64_t)detectedSceneImportantCount
{
  return self->_detectedSceneImportantCount;
}

- (unint64_t)detectedSceneMediumCount
{
  return self->_detectedSceneMediumCount;
}

- (unint64_t)detectedSceneEdgeCaseCount
{
  return self->_detectedSceneEdgeCaseCount;
}

- (void)recordDetectedSceneImportance:(unint64_t)a3
{
  if (a3 - 1 <= 3) {
    ++*((void *)&self->super.isa + a3);
  }
}

- (CLSHolidayDetectedScenes)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSHolidayDetectedScenes;
  result = [(CLSHolidayDetectedScenes *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_detectedSceneImportantCount = 0u;
    *(_OWORD *)&result->_detectedSceneEdgeCaseCount = 0u;
  }
  return result;
}

@end