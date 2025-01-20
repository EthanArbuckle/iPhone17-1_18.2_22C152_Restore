@interface UISearchController
+ (id)docSearchControllerForSearchingIn:(id)a3 configuration:(id)a4 collectionViewPool:(id)a5 documentManager:(id)a6 actionManager:(id)a7;
- (void)deactivateAlongsideContainingTransitionCoordinator:(id)a3;
@end

@implementation UISearchController

- (void)deactivateAlongsideContainingTransitionCoordinator:(id)a3
{
}

+ (id)docSearchControllerForSearchingIn:(id)a3 configuration:(id)a4 collectionViewPool:(id)a5 documentManager:(id)a6 actionManager:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  [v12 copy];
  sub_1004CEA50();
  swift_unknownObjectRelease();
  sub_100427360();
  swift_dynamicCast();
  [v20 setPresentingMakesCollectionFirstResponder:0];
  v16 = (void *)sub_100428300(v11, v20, v13, v14, v15);
  id v17 = objc_allocWithZone((Class)type metadata accessor for DOCSearchController());
  v18 = (void *)sub_1001C1848(v20, v16);

  return v18;
}

@end