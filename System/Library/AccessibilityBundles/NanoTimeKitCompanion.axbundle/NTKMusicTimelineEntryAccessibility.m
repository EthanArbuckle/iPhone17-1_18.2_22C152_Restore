@interface NTKMusicTimelineEntryAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_progressProviderForRingComplications;
- (id)templateForComplicationFamily:(int64_t)a3;
@end

@implementation NTKMusicTimelineEntryAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKMusicTimelineEntry";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKMusicTimelineEntry" hasInstanceVariable:@"_state" withType:"Q"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKMusicTimelineEntry", @"templateForComplicationFamily:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKMusicTimelineEntry", @"_progressProviderForRingComplications", "@", 0);
}

- (id)_progressProviderForRingComplications
{
  v9.receiver = self;
  v9.super_class = (Class)NTKMusicTimelineEntryAccessibility;
  id v3 = [(NTKMusicTimelineEntryAccessibility *)&v9 _progressProviderForRingComplications];
  v4 = (char *)[(NTKMusicTimelineEntryAccessibility *)self safeUnsignedIntegerForKey:@"_state"];
  if ((unint64_t)(v4 - 5) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    if ((unint64_t)(v4 - 1) >= 2) {
      CFStringRef v6 = @"complication.music.stopped";
    }
    else {
      CFStringRef v6 = @"complication.music.paused";
    }
    v7 = accessibilityLocalizedString(v6, v5);
    [v3 setAccessibilityLabel:v7];
  }

  return v3;
}

- (id)templateForComplicationFamily:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKMusicTimelineEntryAccessibility;
  id v3 = [(NTKMusicTimelineEntryAccessibility *)&v8 templateForComplicationFamily:a3];
  if (_accessibilityComplicationTemplateContainsSimpleImage())
  {
    v4 = [v3 safeValueForKey:@"imageProvider"];
    CFStringRef v6 = accessibilityLocalizedString(@"complication.music.image", v5);
    [v4 setAccessibilityLabel:v6];
  }

  return v3;
}

@end