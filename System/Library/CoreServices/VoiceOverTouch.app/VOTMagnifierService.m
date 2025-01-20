@interface VOTMagnifierService
+ (VOTMagnifierService)shared;
+ (void)setShared:(id)a3;
- (VOTMagnifierService)init;
- (void)dismissDetectionUI;
- (void)hideDetectionUI;
- (void)showDetectionUI;
- (void)stopSpeech;
- (void)toggleDetectionUI;
- (void)toggleDoorDetection;
- (void)toggleFurnitureDetection;
- (void)toggleImageDescriptions;
- (void)togglePeopleDetection;
- (void)togglePointAndSpeak;
- (void)toggleTextDetection;
@end

@implementation VOTMagnifierService

+ (VOTMagnifierService)shared
{
  if (qword_1001EB398 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1001EBE70;

  return (VOTMagnifierService *)v2;
}

+ (void)setShared:(id)a3
{
  uint64_t v3 = qword_1001EB398;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  v5 = (void *)qword_1001EBE70;
  qword_1001EBE70 = (uint64_t)v4;
}

- (VOTMagnifierService)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = (char *)self + OBJC_IVAR___VOTMagnifierService____lazy_storage___logger;
  uint64_t v5 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  id v6 = objc_allocWithZone((Class)type metadata accessor for MAGService());
  v7 = self;
  v8 = (objc_class *)[v6 init];
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR___VOTMagnifierService_service) = v8;

  v10.receiver = v7;
  v10.super_class = ObjectType;
  return [(VOTMagnifierService *)&v10 init];
}

- (void)showDetectionUI
{
  v2 = self;
  sub_10010F390((void (*)(void))&MAGService.presentDetectionUI());
}

- (void)dismissDetectionUI
{
  v2 = self;
  sub_10010F390((void (*)(void))&MAGService.dismissUI());
}

- (void)hideDetectionUI
{
  v2 = self;
  sub_10010F390((void (*)(void))&MAGService.hideUI());
}

- (void)toggleDetectionUI
{
  v2 = self;
  sub_10010F390((void (*)(void))&MAGService.toggleUI());
}

- (void)toggleTextDetection
{
  v2 = self;
  sub_10010F390((void (*)(void))&MAGService.toggleTextDetection());
}

- (void)toggleFurnitureDetection
{
  v2 = self;
  sub_10010F390((void (*)(void))&MAGService.toggleFurnitureDetection());
}

- (void)togglePeopleDetection
{
  v2 = self;
  sub_10010F390((void (*)(void))&MAGService.togglePeopleDetection());
}

- (void)toggleDoorDetection
{
  v2 = self;
  sub_10010F390((void (*)(void))&MAGService.toggleDoorDetection());
}

- (void)toggleImageDescriptions
{
  v2 = self;
  sub_10010F390((void (*)(void))&MAGService.toggleImageDescriptions());
}

- (void)togglePointAndSpeak
{
  v2 = self;
  sub_10010F390((void (*)(void))&MAGService.togglePointAndSpeak());
}

- (void)stopSpeech
{
  v2 = self;
  sub_10010F390((void (*)(void))&MAGService.stopSpeech());
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR___VOTMagnifierService____lazy_storage___logger;

  sub_100110024((uint64_t)v3);
}

@end