@interface CSPosterSwitcherTransitionSource
- ($281FBD1A060D4C63F485A737B1C0EEA3)transitionContext;
- (BOOL)isTransitioning;
- (CSComponent)wallpaper;
- (CSComponent)wallpaperFloatingLayer;
- (CSHomeAffordanceComponent)homeAffordance;
- (CSPosterSwitcherTransitionDelegate)transitioningDelegate;
- (NSSet)components;
- (NSString)coverSheetIdentifier;
- (_UILegibilitySettings)legibilitySettings;
- (int64_t)notificationBehavior;
- (int64_t)participantState;
- (int64_t)proximityDetectionMode;
- (int64_t)scrollingStrategy;
- (int64_t)transitionType;
- (unint64_t)restrictedCapabilities;
- (void)cancelTransition;
- (void)cleanupPresentation;
- (void)prepareForPresentation;
- (void)setHomeAffordance:(id)a3;
- (void)setTransitionType:(int64_t)a3;
- (void)setTransitioningDelegate:(id)a3;
- (void)setWallpaper:(id)a3;
- (void)setWallpaperFloatingLayer:(id)a3;
- (void)updatePresentationWithProgress:(double)a3;
@end

@implementation CSPosterSwitcherTransitionSource

- (void)prepareForPresentation
{
  self->_transitionType = 2;
  long long v21 = 0u;
  uint64_t v22 = 0x3FF0000000000000;
  BYTE8(v21) = 1;
  uint64_t v23 = 1;
  CSCoverSheetTransitionContextMake((uint64_t)&v21, 3, (uint64_t)v24);
  long long v3 = v24[1];
  *(_OWORD *)&self->_transitionContext.value = v24[0];
  *(_OWORD *)&self->_transitionContext.interval.start.inclusive = v3;
  *(_OWORD *)&self->_transitionContext.interval.end.inclusive = v24[2];
  v4 = [(CSPosterSwitcherTransitionSource *)self transitioningDelegate];
  v5 = +[CSComponent wallpaper];
  v6 = [(CSPosterSwitcherTransitionSource *)self appearanceIdentifier];
  v7 = [v5 identifier:v6];
  v8 = [v7 priority:40];
  v9 = [v8 hidden:0];
  wallpaper = self->_wallpaper;
  self->_wallpaper = v9;

  [(CSComponent *)self->_wallpaper setLevel:1];
  v11 = +[CSComponent wallpaperFloatingLayer];
  v12 = [(CSPosterSwitcherTransitionSource *)self appearanceIdentifier];
  v13 = [v11 identifier:v12];
  v14 = [v13 priority:40];
  wallpaperFloatingLayer = self->_wallpaperFloatingLayer;
  self->_wallpaperFloatingLayer = v14;

  [(CSComponent *)self->_wallpaperFloatingLayer setLevel:1];
  v16 = objc_opt_new();
  v17 = [(CSPosterSwitcherTransitionSource *)self appearanceIdentifier];
  v18 = [v16 identifier:v17];
  v19 = [v18 suppressTeachableMomentsAnimation:1];
  homeAffordance = self->_homeAffordance;
  self->_homeAffordance = v19;

  [v4 transitionSource:self willBeginWithType:self->_transitionType];
  [(CSPosterSwitcherTransitionSource *)self updatePresentationWithProgress:0.0];
}

- (void)updatePresentationWithProgress:(double)a3
{
  long long v7 = 0u;
  uint64_t v8 = 0x3FF0000000000000;
  BYTE8(v7) = 1;
  uint64_t v9 = 1;
  CSCoverSheetTransitionContextMake((uint64_t)&v7, 3, (uint64_t)&v10);
  long long v4 = v11;
  *(_OWORD *)&self->_transitionContext.value = v10;
  *(_OWORD *)&self->_transitionContext.interval.start.inclusive = v4;
  *(_OWORD *)&self->_transitionContext.interval.end.inclusive = v12;
  v5 = [(CSPosterSwitcherTransitionSource *)self transitioningDelegate];
  long long v6 = *(_OWORD *)&self->_transitionContext.interval.start.inclusive;
  long long v10 = *(_OWORD *)&self->_transitionContext.value;
  long long v11 = v6;
  long long v12 = *(_OWORD *)&self->_transitionContext.interval.end.inclusive;
  [v5 transitionSource:self didUpdateTransitionWithContext:&v10];
}

- (void)cleanupPresentation
{
  homeAffordance = self->_homeAffordance;
  self->_homeAffordance = 0;

  wallpaper = self->_wallpaper;
  self->_wallpaper = 0;

  wallpaperFloatingLayer = self->_wallpaperFloatingLayer;
  self->_wallpaperFloatingLayer = 0;

  self->_transitionType = 0;
  long long v6 = [(CSPosterSwitcherTransitionSource *)self transitioningDelegate];
  long long v7 = *(_OWORD *)&self->_transitionContext.interval.start.inclusive;
  v8[0] = *(_OWORD *)&self->_transitionContext.value;
  v8[1] = v7;
  v8[2] = *(_OWORD *)&self->_transitionContext.interval.end.inclusive;
  [v6 transitionSource:self didEndWithContext:v8];
}

- (NSString)coverSheetIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if ([(CSPosterSwitcherTransitionSource *)self isTransitioning]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (NSSet)components
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v4 = v3;
  if (self->_homeAffordance) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_wallpaper) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_wallpaperFloatingLayer) {
    objc_msgSend(v4, "addObject:");
  }
  v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];

  return (NSSet *)v5;
}

- (_UILegibilitySettings)legibilitySettings
{
  return 0;
}

- (int64_t)scrollingStrategy
{
  return 0;
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  return 0;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (BOOL)isTransitioning
{
  return self->_transitionType != 0;
}

- (void)cancelTransition
{
  [(CSPosterSwitcherTransitionSource *)self updatePresentationWithProgress:0.0];

  [(CSPosterSwitcherTransitionSource *)self cleanupPresentation];
}

- ($281FBD1A060D4C63F485A737B1C0EEA3)transitionContext
{
  long long v3 = *(_OWORD *)&self[1].var1.var0.var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var1.var0.var1 = v3;
  *(_OWORD *)&retstr->var1.var1.var1 = *(_OWORD *)&self[1].var1.var1.var1;
  return self;
}

- (CSPosterSwitcherTransitionDelegate)transitioningDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitioningDelegate);

  return (CSPosterSwitcherTransitionDelegate *)WeakRetained;
}

- (void)setTransitioningDelegate:(id)a3
{
}

- (int64_t)transitionType
{
  return self->_transitionType;
}

- (void)setTransitionType:(int64_t)a3
{
  self->_transitionType = a3;
}

- (CSHomeAffordanceComponent)homeAffordance
{
  return self->_homeAffordance;
}

- (void)setHomeAffordance:(id)a3
{
}

- (CSComponent)wallpaper
{
  return self->_wallpaper;
}

- (void)setWallpaper:(id)a3
{
}

- (CSComponent)wallpaperFloatingLayer
{
  return self->_wallpaperFloatingLayer;
}

- (void)setWallpaperFloatingLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperFloatingLayer, 0);
  objc_storeStrong((id *)&self->_wallpaper, 0);
  objc_storeStrong((id *)&self->_homeAffordance, 0);

  objc_destroyWeak((id *)&self->_transitioningDelegate);
}

@end