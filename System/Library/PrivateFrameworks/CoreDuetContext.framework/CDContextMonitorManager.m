@interface CDContextMonitorManager
@end

@implementation CDContextMonitorManager

void __63___CDContextMonitorManager_initializeKeyPathEventStreamMapping__block_invoke()
{
  v0 = [MEMORY[0x1E4F5B3C8] sharedInstance];
  v1 = [v0 allEventStreams];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63___CDContextMonitorManager_initializeKeyPathEventStreamMapping__block_invoke_2;
  v6[3] = &unk_1E5609B00;
  id v7 = v2;
  id v3 = v2;
  [v1 enumerateKeysAndObjectsUsingBlock:v6];
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v3];
  v5 = (void *)keyPathToEventStream;
  keyPathToEventStream = v4;
}

void __63___CDContextMonitorManager_initializeKeyPathEventStreamMapping__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = [v4 eventStreamProperties];
  v6 = [v5 knowledgeBaseName];
  id v10 = +[_CDContextMonitorManager cleanKBEventNameKey:v6];

  id v7 = +[_CDContextualKeyPath keyPathWithKey:v10];
  v8 = [v4 eventStreamProperties];

  v9 = [v8 name];
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v7];
}

@end