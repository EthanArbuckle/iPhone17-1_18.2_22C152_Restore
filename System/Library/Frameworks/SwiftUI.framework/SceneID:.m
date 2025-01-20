@interface SceneID:
- (uint64_t)KeyboardShortcut;
- (void)KeyboardShortcut;
@end

@implementation SceneID:

- (uint64_t)KeyboardShortcut
{
  if (a2) {
    return swift_bridgeObjectRelease();
  }
  else {
    return swift_release();
  }
}

- (void)KeyboardShortcut
{
  if (!lazy cache variable for type metadata for External<[SceneID : KeyboardShortcut]>)
  {
    type metadata accessor for [SceneID : KeyboardShortcut]();
    unint64_t v0 = type metadata accessor for External();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for External<[SceneID : KeyboardShortcut]>);
    }
  }
}

@end