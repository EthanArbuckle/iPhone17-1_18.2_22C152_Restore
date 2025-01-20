@interface UIViewControllerAccessibility__Music__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsViewControllerInLibrary;
- (void)didChangeVoiceOverOrSwitchControlStatus:(id)a3;
- (void)viewDidLoad;
@end

@implementation UIViewControllerAccessibility__Music__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"Music.LibraryAlbumsViewController"];
  [v3 validateClass:@"Music.LibraryArtistsListViewController"];
  [v3 validateClass:@"Music.LibraryArtistDetailViewController"];
  [v3 validateClass:@"Music.LibraryGenresViewController"];
  [v3 validateClass:@"Music.LibraryComposersViewController"];
  [v3 validateClass:@"Music.LibraryPlaylistsViewController"];
  [v3 validateClass:@"Music.LibraryMusicVideosViewController"];
  [v3 validateClass:@"Music.LibraryMainViewController"];
  [v3 validateClass:@"Music.LibraryRecentlyAddedViewController"];
  [v3 validateClass:@"Music.LibrarySongsViewController"];
  [v3 validateClass:@"Music.LibraryTVShowsMoviesViewController"];
  [v3 validateClass:@"Music.LibraryTVEpisodesViewController"];
  [v3 validateClass:@"Music.LibraryDownloadingViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"navigationItem", "@", 0);
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)UIViewControllerAccessibility__Music__UIKit;
  [(UIViewControllerAccessibility__Music__UIKit *)&v5 viewDidLoad];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_didChangeVoiceOverOrSwitchControlStatus_ name:*MEMORY[0x263F1CF90] object:0];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_didChangeVoiceOverOrSwitchControlStatus_ name:*MEMORY[0x263F1CEB8] object:0];

  [(UIViewControllerAccessibility__Music__UIKit *)self didChangeVoiceOverOrSwitchControlStatus:0];
  if ([(UIViewControllerAccessibility__Music__UIKit *)self _axIsViewControllerInLibrary]) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  }
}

- (void)didChangeVoiceOverOrSwitchControlStatus:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  objc_super v5 = [(UIViewControllerAccessibility__Music__UIKit *)self safeValueForKey:@"navigationItem"];
  v6 = __UIAccessibilityCastAsClass();

  BOOL v7 = !UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning();
  [v6 setHidesSearchBarWhenScrolling:v7];
}

- (BOOL)_axIsViewControllerInLibrary
{
  MEMORY[0x245658030](@"Music.LibraryAlbumsViewController", a2);
  if (objc_opt_isKindOfClass()) {
    goto LABEL_13;
  }
  MEMORY[0x245658030](@"Music.LibraryArtistsListViewController");
  if (objc_opt_isKindOfClass()) {
    goto LABEL_13;
  }
  MEMORY[0x245658030](@"Music.LibraryArtistDetailViewController");
  if (objc_opt_isKindOfClass()) {
    goto LABEL_13;
  }
  MEMORY[0x245658030](@"Music.LibraryGenresViewController");
  if (objc_opt_isKindOfClass()) {
    goto LABEL_13;
  }
  MEMORY[0x245658030](@"Music.LibraryComposersViewController");
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (MEMORY[0x245658030](@"Music.LibraryPlaylistsViewController"), (objc_opt_isKindOfClass() & 1) != 0)
    || (MEMORY[0x245658030](@"Music.LibraryMusicVideosViewController"), (objc_opt_isKindOfClass() & 1) != 0)
    || (MEMORY[0x245658030](@"Music.LibraryMainViewController"), (objc_opt_isKindOfClass() & 1) != 0)
    || (MEMORY[0x245658030](@"Music.LibraryRecentlyAddedViewController"), (objc_opt_isKindOfClass() & 1) != 0)
    || (MEMORY[0x245658030](@"Music.LibrarySongsViewController"), (objc_opt_isKindOfClass() & 1) != 0)
    || (MEMORY[0x245658030](@"Music.LibraryTVShowsMoviesViewController"), (objc_opt_isKindOfClass() & 1) != 0)
    || (MEMORY[0x245658030](@"Music.LibraryTVEpisodesViewController"), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_13:
    char isKindOfClass = 1;
  }
  else
  {
    MEMORY[0x245658030](@"Music.LibraryDownloadingViewController");
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

@end