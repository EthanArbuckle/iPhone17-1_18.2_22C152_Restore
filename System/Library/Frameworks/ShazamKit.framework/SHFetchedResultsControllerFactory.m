@interface SHFetchedResultsControllerFactory
+ (id)groupFetchedResultsControllerWithContext:(id)a3;
+ (id)trackFetchedResultsControllerWithContext:(id)a3;
@end

@implementation SHFetchedResultsControllerFactory

+ (id)trackFetchedResultsControllerWithContext:(id)a3
{
  id v3 = a3;
  v4 = +[SHTrackMO fetchRequest];
  v5 = NSStringFromSelector("date");
  v6 = +[NSSortDescriptor sortDescriptorWithKey:v5 ascending:0];

  v14 = v6;
  v7 = +[NSArray arrayWithObjects:&v14 count:1];
  [v4 setSortDescriptors:v7];

  [v4 setReturnsObjectsAsFaults:0];
  v8 = NSStringFromSelector("metadata");
  v13[0] = v8;
  v9 = NSStringFromSelector("group");
  v13[1] = v9;
  v10 = +[NSArray arrayWithObjects:v13 count:2];
  objc_msgSend(v4, "setRelationshipKeyPathsForPrefetching:", v10, v13[0]);

  id v11 = [objc_alloc((Class)NSFetchedResultsController) initWithFetchRequest:v4 managedObjectContext:v3 sectionNameKeyPath:0 cacheName:0];

  return v11;
}

+ (id)groupFetchedResultsControllerWithContext:(id)a3
{
  id v3 = a3;
  v4 = +[SHGroupMO fetchRequest];
  [v4 setSortDescriptors:&__NSArray0__struct];
  [v4 setReturnsObjectsAsFaults:0];
  v5 = NSStringFromSelector("metadata");
  v10[0] = v5;
  v6 = NSStringFromSelector("tracks");
  v10[1] = v6;
  v7 = +[NSArray arrayWithObjects:v10 count:2];
  [v4 setRelationshipKeyPathsForPrefetching:v7];

  id v8 = [objc_alloc((Class)NSFetchedResultsController) initWithFetchRequest:v4 managedObjectContext:v3 sectionNameKeyPath:0 cacheName:0];

  return v8;
}

@end