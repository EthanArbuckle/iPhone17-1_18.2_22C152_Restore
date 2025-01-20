@interface DetailHeaderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsCollaborativeForModelPlaylist:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axCuratorNameForPlaylist:(id)a3;
- (id)_axLabelForActionButtonForContainerProperties:(id)a3;
- (id)_axNameForAuthor:(id)a3;
- (id)_axOwnerNameForPlaylist:(id)a3;
- (id)_axStringForActiveCallaborators:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation DetailHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.DetailHeader";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.DetailHeader", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.DetailHeader", @"accessibilityPlaylistVisibilitySwitchContainerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.DetailHeader", @"accessibilityIsVisiblePlaylistTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.DetailHeader", @"accessibilityArtworkEditingOverlayView", "@", 0);
  [v3 validateSwiftStruct:@"MusicApplication.ContainerDetailPlaylistProperties"];
  [v3 validateClass:@"MusicApplication.PlaylistDetailViewController" hasSwiftField:@"containerProperties" withSwiftType:"Optional<ContainerDetailPlaylistProperties>"];
  [v3 validateSwiftStruct:@"MusicApplication.ContainerDetailPlaylistProperties" hasSwiftField:@"activeCollaborators" withSwiftType:"Optional<Array<MPModelPlaylistAuthor>>"];
  [v3 validateSwiftStruct:@"MusicApplication.ContainerDetailPlaylistProperties" hasSwiftField:@"modelObject" withSwiftType:"Optional<MPModelPlaylist>"];
  [v3 validateClass:@"MusicApplication.DetailHeader" hasSwiftField:@"detailsView" withSwiftType:"DetailsView"];
  [v3 validateClass:@"MusicApplication.DetailHeader[class].DetailsView" hasSwiftField:@"actionButton" withSwiftType:"TextButton"];
  [v3 validateClass:@"MPModelObject"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPModelObject", @"hasLoadedValueForKey:", "B", "@", 0);
  [v3 validateClass:@"MPModelPlaylist"];
  [v3 validateClass:@"MPModelPlaylist" isKindOfClass:@"MPModelObject"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPModelPlaylist", @"collaboratorStatus", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPModelPlaylist", @"curator", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPModelPlaylist", @"ownerName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPModelCurator", @"name", "@", 0);
  [v3 validateClass:@"MPModelPlaylistAuthor"];
  [v3 validateClass:@"MPModelPlaylistAuthor" isKindOfClass:@"MPModelObject"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPModelPlaylistAuthor", @"socialProfile", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPModelSocialPerson", @"name", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v16.receiver = self;
  v16.super_class = (Class)DetailHeaderAccessibility;
  [(DetailHeaderAccessibility *)&v16 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(DetailHeaderAccessibility *)self safeValueForKey:@"accessibilityPlaylistVisibilitySwitchContainerView"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 accessibilitySetIdentification:@"AXPublicPlaylistSwitchContainerView"];
  v5 = [(DetailHeaderAccessibility *)self safeValueForKey:@"accessibilityIsVisiblePlaylistTitle"];
  [v4 setAccessibilityLabel:v5];

  v6 = [(DetailHeaderAccessibility *)self safeValueForKey:@"accessibilityArtworkEditingOverlayView"];
  v7 = accessibilityMusicLocalizedString(@"add.playlist.artwork.button");
  [v6 setAccessibilityLabel:v7];

  [v6 setIsAccessibilityElement:1];
  [v6 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  v8 = [(DetailHeaderAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_4 startWithSelf:0];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 _accessibilityViewController];
    v11 = [v10 safeSwiftValueForKey:@"containerProperties"];
    v12 = __UIAccessibilityCastAsSwiftStruct();

    if (v12)
    {
      v13 = [(DetailHeaderAccessibility *)self safeSwiftValueForKey:@"detailsView"];
      v14 = [v13 safeSwiftValueForKey:@"actionButton"];
      v15 = [(DetailHeaderAccessibility *)self _axLabelForActionButtonForContainerProperties:v12];
      [v14 setAccessibilityLabel:v15];
    }
  }
}

uint64_t __71__DetailHeaderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x2456584B0](@"MusicApplication.PlaylistDetailViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)DetailHeaderAccessibility;
  [(DetailHeaderAccessibility *)&v3 layoutSubviews];
  [(DetailHeaderAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)_axLabelForActionButtonForContainerProperties:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 safeSwiftArrayForKey:@"activeCollaborators"];
  v6 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v7 = [v4 safeSwiftValueForKey:@"modelObject"];
  v8 = __UIAccessibilityCastAsClass();

  if ([(DetailHeaderAccessibility *)self _axIsCollaborativeForModelPlaylist:v8]
    && [v6 count])
  {
    id v9 = [(DetailHeaderAccessibility *)self _axStringForActiveCallaborators:v6];
  }
  else
  {
    v10 = [(DetailHeaderAccessibility *)self _axOwnerNameForPlaylist:v8];
    v11 = [(DetailHeaderAccessibility *)self _axCuratorNameForPlaylist:v8];
    if ([v10 length]) {
      v12 = v10;
    }
    else {
      v12 = v11;
    }
    id v9 = v12;
  }

  return v9;
}

- (id)_axStringForActiveCallaborators:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectAtIndex:0];
  v6 = [(DetailHeaderAccessibility *)self _axNameForAuthor:v5];
  if ((unint64_t)[v4 count] < 2)
  {
    id v9 = v6;
  }
  else
  {
    v7 = NSString;
    v8 = accessibilityMusicLocalizedString(@"PLAYLIST_CURATORS_COUNT");
    objc_msgSend(v7, "localizedStringWithFormat:", v8, v6, objc_msgSend(v4, "count") - 1);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)_axIsCollaborativeForModelPlaylist:(id)a3
{
  id v3 = a3;
  if ([v3 hasLoadedValueForKey:*MEMORY[0x263F11648]]) {
    BOOL v4 = (unint64_t)([v3 collaboratorStatus] - 2) < 3;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)_axCuratorNameForPlaylist:(id)a3
{
  id v3 = a3;
  if ([v3 hasLoadedValueForKey:*MEMORY[0x263F11A60]]
    && ([v3 curator],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 hasLoadedValueForKey:*MEMORY[0x263F11508]],
        v4,
        v5))
  {
    v6 = [v3 curator];
    v7 = [v6 name];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_axOwnerNameForPlaylist:(id)a3
{
  id v3 = a3;
  if ([v3 hasLoadedValueForKey:*MEMORY[0x263F11658]])
  {
    BOOL v4 = [v3 safeStringForKey:@"ownerName"];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)_axNameForAuthor:(id)a3
{
  id v3 = a3;
  if ([v3 hasLoadedValueForKey:*MEMORY[0x263F11A58]]
    && ([v3 socialProfile],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 hasLoadedValueForKey:*MEMORY[0x263F115F8]],
        v4,
        v5))
  {
    v6 = [v3 socialProfile];
    v7 = [v6 name];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end