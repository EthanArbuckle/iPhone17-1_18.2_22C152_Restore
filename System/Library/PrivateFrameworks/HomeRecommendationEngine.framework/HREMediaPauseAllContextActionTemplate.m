@interface HREMediaPauseAllContextActionTemplate
- (HREMediaPauseAllContextActionTemplate)init;
- (id)_lazy_actionMap;
@end

@implementation HREMediaPauseAllContextActionTemplate

- (HREMediaPauseAllContextActionTemplate)init
{
  v6.receiver = self;
  v6.super_class = (Class)HREMediaPauseAllContextActionTemplate;
  v2 = [(HRETemplate *)&v6 init];
  if (v2)
  {
    v3 = _HRELocalizedStringWithDefaultValue(@"HREContextActionNamePauseAll", @"HREContextActionNamePauseAll", 1);
    [(HREContextActionTemplate *)v2 setContextActionName:v3];

    v4 = (void *)[objc_alloc(MEMORY[0x263F47B68]) initWithSystemImageNamed:@"tv.and.hifispeaker.fill"];
    [(HREContextActionTemplate *)v2 setIconDescriptor:v4];

    [(HRETemplate *)v2 setIdentifier:@"mediaPauseAllContextAction"];
    [(HRETemplate *)v2 setSortingPriority:4.0];
  }
  return v2;
}

- (id)_lazy_actionMap
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = NSStringFromProtocol((Protocol *)&unk_26EAC9D48);
  objc_super v6 = v2;
  v3 = +[HREMediaPlaybackActionMap actionMapWithState:2 volume:0 playbackArchive:0];
  v7[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

@end