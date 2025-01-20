@interface SSSPortalView
+ (Class)layerClass;
- (BOOL)allowsBackdropGroups;
- (BOOL)hidesSourceView;
- (BOOL)matchesAlpha;
- (BOOL)matchesPosition;
- (BOOL)matchesTransform;
- (UIView)sourceView;
- (unint64_t)sourceLayerRenderId;
- (unsigned)sourceContextId;
- (void)setAllowsBackdropGroups:(BOOL)a3;
- (void)setHidesSourceView:(BOOL)a3;
- (void)setMatchesAlpha:(BOOL)a3;
- (void)setMatchesPosition:(BOOL)a3;
- (void)setMatchesTransform:(BOOL)a3;
- (void)setSourceContextId:(unsigned int)a3;
- (void)setSourceLayerRenderId:(unint64_t)a3;
- (void)setSourceView:(id)a3;
@end

@implementation SSSPortalView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setSourceView:(id)a3
{
  p_sourceView = &self->_sourceView;
  id v5 = a3;
  objc_storeWeak((id *)p_sourceView, v5);
  id v7 = [v5 layer];

  v6 = [(SSSPortalView *)self portalLayer];
  [v6 setSourceLayer:v7];
}

- (BOOL)hidesSourceView
{
  v2 = [(SSSPortalView *)self portalLayer];
  unsigned __int8 v3 = [v2 hidesSourceLayer];

  return v3;
}

- (void)setHidesSourceView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SSSPortalView *)self portalLayer];
  [v4 setHidesSourceLayer:v3];
}

- (BOOL)matchesAlpha
{
  v2 = [(SSSPortalView *)self portalLayer];
  unsigned __int8 v3 = [v2 matchesOpacity];

  return v3;
}

- (void)setMatchesAlpha:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SSSPortalView *)self portalLayer];
  [v4 setMatchesOpacity:v3];
}

- (BOOL)matchesTransform
{
  v2 = [(SSSPortalView *)self portalLayer];
  unsigned __int8 v3 = [v2 matchesTransform];

  return v3;
}

- (void)setMatchesTransform:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SSSPortalView *)self portalLayer];
  [v4 setMatchesTransform:v3];
}

- (BOOL)matchesPosition
{
  v2 = [(SSSPortalView *)self portalLayer];
  unsigned __int8 v3 = [v2 matchesPosition];

  return v3;
}

- (void)setMatchesPosition:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SSSPortalView *)self portalLayer];
  [v4 setMatchesPosition:v3];
}

- (BOOL)allowsBackdropGroups
{
  v2 = [(SSSPortalView *)self portalLayer];
  unsigned __int8 v3 = [v2 allowsBackdropGroups];

  return v3;
}

- (void)setAllowsBackdropGroups:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SSSPortalView *)self portalLayer];
  [v4 setAllowsBackdropGroups:v3];
}

- (void)setSourceContextId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(SSSPortalView *)self portalLayer];
  [v4 setSourceContextId:v3];
}

- (unsigned)sourceContextId
{
  v2 = [(SSSPortalView *)self portalLayer];
  unsigned int v3 = [v2 sourceContextId];

  return v3;
}

- (void)setSourceLayerRenderId:(unint64_t)a3
{
  id v4 = [(SSSPortalView *)self portalLayer];
  [v4 setSourceLayerRenderId:a3];
}

- (unint64_t)sourceLayerRenderId
{
  v2 = [(SSSPortalView *)self portalLayer];
  id v3 = [v2 sourceLayerRenderId];

  return (unint64_t)v3;
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);

  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end