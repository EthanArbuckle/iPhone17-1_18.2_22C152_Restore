@interface IMBroadcastingKeyValueCollection
- (void)_notifyListeners;
@end

@implementation IMBroadcastingKeyValueCollection

- (void)_notifyListeners
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)IMBroadcastingKeyValueCollection;
  [(IMKeyValueCollection *)&v7 _notifyListeners];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v8 = @"IMKeyValueCollectionChangedValuesKey";
  v4 = [(IMKeyValueCollection *)self recordedChanges];
  v5 = (void *)[v4 copy];
  v9[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v3 postNotificationName:@"IMKeyValueCollectionChangedNotification" object:self userInfo:v6];
}

@end