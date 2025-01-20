@interface NSFileAccessNode
- (BOOL)_mayContainCriticalDebuggingInformationExcludingReactors:(BOOL)a3;
- (BOOL)itemIsFilePackage;
- (BOOL)itemIsInItemAtLocation:(id)a3;
- (BOOL)itemIsItemAtLocation:(id)a3;
- (BOOL)itemIsSubarbitrable;
- (BOOL)setProvider:(id)a3;
- (NSFileAccessNode)initWithParent:(id)a3 name:(id)a4 normalizedName:(id)a5;
- (id)_childrenExcludingExcessNodes:(BOOL)a3 excludingReactors:(BOOL)a4;
- (id)biggestFilePackageLocation;
- (id)childForRange:(_NSRange)a3 ofPath:(id)a4;
- (id)descendantAtPath:(id)a3 componentRange:(_NSRange)a4 create:(BOOL)a5;
- (id)descendantAtPath:(id)a3 componentRange:(_NSRange)a4 forAddingLeafNode:(id)a5 create:(BOOL)a6;
- (id)descendantForFileURL:(id)a3;
- (id)description;
- (id)descriptionWithIndenting:(id)a3 excludingExcessNodes:(BOOL)a4 excludingReactors:(BOOL)a5;
- (id)itemProvider;
- (id)name;
- (id)normalizationOfChildName:(id)a3;
- (id)parent;
- (id)pathExceptPrivate;
- (id)pathFromAncestor:(id)a3;
- (id)pathToDescendantForFileURL:(id)a3 componentRange:(_NSRange *)a4;
- (id)sensitiveDescription;
- (id)sensitiveSubarbiterDescription;
- (id)standardizedURL;
- (id)subarbiterDescription;
- (id)url;
- (id)urlOfSubitemAtPath:(id)a3 plusPath:(id)a4;
- (void)_forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter:(BOOL)a3 performProcedure:(id)a4;
- (void)_setLinkDestination:(id)a3;
- (void)addAccessClaim:(id)a3;
- (void)addPresenter:(id)a3;
- (void)addProgressPublisher:(id)a3;
- (void)addProgressSubscriber:(id)a3;
- (void)assertDead;
- (void)assertDescendantsLive;
- (void)assertLive;
- (void)dealloc;
- (void)forEachAccessClaimOnItemOrContainedItemPerformProcedure:(id)a3;
- (void)forEachAccessClaimOnItemPerformProcedure:(id)a3;
- (void)forEachDescendantPerformProcedure:(id)a3;
- (void)forEachPresenterOfContainedItemPerformProcedure:(id)a3;
- (void)forEachPresenterOfContainingFilePackagePerformProcedure:(id)a3;
- (void)forEachPresenterOfContainingItemPerformProcedure:(id)a3;
- (void)forEachPresenterOfItemOrContainedItemPerformProcedure:(id)a3;
- (void)forEachPresenterOfItemOrContainingItemPerformProcedure:(id)a3;
- (void)forEachPresenterOfItemPerformProcedure:(id)a3;
- (void)forEachProgressPublisherOfItemOrContainedItemPerformProcedure:(id)a3;
- (void)forEachProgressPublisherOfItemPerformProcedure:(id)a3;
- (void)forEachProgressSubscriberOfItemOrContainingItemPerformProcedure:(id)a3;
- (void)forEachProgressSubscriberOfItemPerformProcedure:(id)a3;
- (void)forEachProgressThingOfItemOrContainedItemPerformProcedure:(id)a3;
- (void)forEachReactorToItemOrContainedItemPerformProcedure:(id)a3;
- (void)forEachRelevantAccessClaimForEvaluatingAgainstClaim:(id)a3 performProcedure:(id)a4;
- (void)forEachRelevantAccessClaimPerformProcedure:(id)a3;
- (void)removeAccessClaim:(id)a3;
- (void)removeChildForNormalizedName:(id)a3;
- (void)removePresenter:(id)a3;
- (void)removeProgressPublisher:(id)a3;
- (void)removeProgressSubscriber:(id)a3;
- (void)removeProvider:(id)a3;
- (void)removeSelfIfUseless;
- (void)setArbitrationBoundary;
- (void)setChild:(id)a3 forName:(id)a4 normalizedName:(id)a5;
- (void)setFirmlinkDestination:(id)a3;
- (void)setParent:(id)a3 name:(id)a4;
- (void)setSymbolicLinkDestination:(id)a3;
@end

@implementation NSFileAccessNode

- (id)url
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = +[NSString pathWithComponents:[(NSFileAccessNode *)self pathFromAncestor:0]];
  v3 = (void *)[MEMORY[0x1E4F1CB10] fileURLWithPath:v2];
  if (!v3)
  {
    v4 = _NSFCLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "-[NSFileAccessNode url] is returning nil.", v6, 2u);
    }
  }
  return v3;
}

- (id)pathFromAncestor:(id)a3
{
  if (self == a3)
  {
    v8 = (void *)MEMORY[0x1E4F1C978];
    return (id)[v8 array];
  }
  else
  {
    parent = self->_parent;
    if (parent)
    {
      id v5 = -[NSFileAccessNode pathFromAncestor:](parent, "pathFromAncestor:");
      name = self->_name;
      return (id)[v5 arrayByAddingObject:name];
    }
    else
    {
      v9 = (void *)MEMORY[0x1E4F1C978];
      v10 = self->_name;
      return (id)[v9 arrayWithObject:v10];
    }
  }
}

- (void)addPresenter:(id)a3
{
  if (self->_presenterOrPresenters)
  {
    if (_NSIsNSSet())
    {
      id presenterOrPresenters = self->_presenterOrPresenters;
      [presenterOrPresenters addObject:a3];
    }
    else
    {
      id v6 = self->_presenterOrPresenters;
      self->_id presenterOrPresenters = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v6, a3, 0);
    }
  }
  else
  {
    self->_id presenterOrPresenters = a3;
  }
}

- (void)removeSelfIfUseless
{
  if (!self->_symbolicLinkDestination
    && !self->_symbolicLinkReferenceCount
    && ![(NSMutableDictionary *)self->_childrenByNormalizedName count]
    && !self->_presenterOrPresenters
    && !self->_provider
    && !self->_accessClaimOrClaims
    && !self->_isArbitrationBoundary
    && !self->_progressPublisherOrPublishers
    && !self->_progressSubscriberOrSubscribers)
  {
    parent = self->_parent;
    normalizedName = self->_normalizedName;
    [(NSFileAccessNode *)parent removeChildForNormalizedName:normalizedName];
  }
}

- (void)removeChildForNormalizedName:(id)a3
{
  uint64_t v5 = -[NSMutableDictionary objectForKey:](self->_childrenByNormalizedName, "objectForKey:");
  if (v5)
  {
    if (*(NSFileAccessNode **)(v5 + 8) == self) {
      *(void *)(v5 + 8) = 0;
    }
    [(NSMutableDictionary *)self->_childrenByNormalizedName removeObjectForKey:a3];
  }

  self->_lastRequestedChildName = 0;
  self->_lastRequestedChild = 0;

  [(NSFileAccessNode *)self removeSelfIfUseless];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFileAccessNode;
  [(NSFileAccessNode *)&v3 dealloc];
}

- (void)removeAccessClaim:(id)a3
{
  id accessClaimOrClaims = a3;
  if (self->_accessClaimOrClaims == a3) {
    goto LABEL_5;
  }
  if (_NSIsNSSet())
  {
    [self->_accessClaimOrClaims removeObject:accessClaimOrClaims];
    if (![self->_accessClaimOrClaims count])
    {
      id accessClaimOrClaims = self->_accessClaimOrClaims;
LABEL_5:

      self->_id accessClaimOrClaims = 0;
    }
  }

  [(NSFileAccessNode *)self removeSelfIfUseless];
}

- (void)forEachRelevantAccessClaimPerformProcedure:(id)a3
{
}

- (void)_forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter:(BOOL)a3 performProcedure:(id)a4
{
  id v6 = self;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(NSFileAccessNode *)self->_parent biggestFilePackageLocation];
  if (v7) {
    id v6 = v7;
  }
  parent = v6->_parent;
  if (parent)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    do
    {
      v12[0] = v9;
      v12[1] = 3221225472;
      v12[2] = __96__NSFileAccessNode__forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter_performProcedure___block_invoke;
      v12[3] = &unk_1E51FDDE0;
      BOOL v13 = a3;
      v12[4] = a4;
      [(NSFileAccessNode *)parent forEachAccessClaimOnItemPerformProcedure:v12];
      parent = parent->_parent;
    }
    while (parent);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__NSFileAccessNode__forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter_performProcedure___block_invoke_2;
  v10[3] = &unk_1E51FDE08;
  BOOL v11 = a3;
  v10[4] = a4;
  [(NSFileAccessNode *)v6 forEachAccessClaimOnItemOrContainedItemPerformProcedure:v10];
}

- (void)forEachAccessClaimOnItemPerformProcedure:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (_NSIsNSSet())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id accessClaimOrClaims = self->_accessClaimOrClaims;
    uint64_t v6 = [accessClaimOrClaims countByEnumeratingWithState:&v12 objects:v11 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(accessClaimOrClaims);
          }
          (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v12 + 1) + 8 * i));
        }
        uint64_t v7 = [accessClaimOrClaims countByEnumeratingWithState:&v12 objects:v11 count:16];
      }
      while (v7);
    }
  }
  else if (self->_accessClaimOrClaims)
  {
    v10 = (void (*)(id))*((void *)a3 + 2);
    v10(a3);
  }
}

- (void)forEachAccessClaimOnItemOrContainedItemPerformProcedure:(id)a3
{
  v6[6] = *MEMORY[0x1E4F143B8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__NSFileAccessNode_forEachAccessClaimOnItemOrContainedItemPerformProcedure___block_invoke;
  v6[3] = &unk_1E51FDE80;
  v6[4] = self;
  v6[5] = a3;
  [(NSFileAccessNode *)self forEachAccessClaimOnItemPerformProcedure:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__NSFileAccessNode_forEachAccessClaimOnItemOrContainedItemPerformProcedure___block_invoke_2;
  v5[3] = &unk_1E51FDE30;
  v5[4] = a3;
  [(NSFileAccessNode *)self forEachDescendantPerformProcedure:v5];
}

uint64_t __96__NSFileAccessNode__forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter_performProcedure___block_invoke_2(uint64_t a1, void *a2)
{
  if (!*(unsigned char *)(a1 + 40) || (uint64_t result = [a2 cameFromSuperarbiter], (result & 1) == 0))
  {
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v4();
  }
  return result;
}

uint64_t __76__NSFileAccessNode_forEachAccessClaimOnItemOrContainedItemPerformProcedure___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

- (void)forEachDescendantPerformProcedure:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  childrenByNormalizedName = self->_childrenByNormalizedName;
  uint64_t v6 = [(NSMutableDictionary *)childrenByNormalizedName countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(childrenByNormalizedName);
        }
        v10 = (void *)[(NSMutableDictionary *)self->_childrenByNormalizedName objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        (*((void (**)(id, void *))a3 + 2))(a3, v10);
        [v10 forEachDescendantPerformProcedure:a3];
      }
      uint64_t v7 = [(NSMutableDictionary *)childrenByNormalizedName countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v7);
  }
}

- (id)descendantForFileURL:(id)a3
{
  uint64_t v4 = self;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (![(NSString *)self->_normalizedName isEqualToString:@"/"])
  {
    NSLog((NSString *)@"[NSFileAccessNode pathToDescendantForFileURL:componentRange:] was invoked in a surprising way.");
    return 0;
  }
  if (![a3 isFileURL])
  {
    uint64_t v16 = _NSFCLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138477827;
      id v20 = a3;
      v17 = "NSFileCoordinator only handles URLs that use the file: scheme. This one does not:\n%{private}@";
LABEL_27:
      _os_log_impl(&dword_181795000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v19, 0xCu);
    }
    return 0;
  }
  uint64_t v5 = (void *)_canonicalStringRepresentation([a3 path]);
  if (!v5)
  {
    uint64_t v16 = _NSFCLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138477827;
      id v20 = a3;
      v17 = "NSFileCoordinator does not handle NSURLs that return nil when sent -path, like this one:\n%{private}@";
      goto LABEL_27;
    }
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [v5 length];
  if (!v7 || (uint64_t v8 = v7, [v6 characterAtIndex:0] != 47))
  {
    uint64_t v16 = _NSFCLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138477827;
      id v20 = a3;
      v17 = "NSFileCoordinator does not handle NSURLs that return relative or empty paths when sent -path, like this one:\n%{private}@";
      goto LABEL_27;
    }
    return 0;
  }
  uint64_t v9 = v8 - 1;
  if (v8 != 1)
  {
    uint64_t v10 = 1;
    while (1)
    {
      if (v4->_symbolicLinkDestination) {
        uint64_t v4 = v4->_symbolicLinkDestination;
      }
      uint64_t v11 = objc_msgSend(v6, "rangeOfString:options:range:", @"/", 0, v10, v9);
      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v13 = v11;
      uint64_t v14 = v12;
      if (v11 != v10) {
        uint64_t v4 = -[NSFileAccessNode childForRange:ofPath:](v4, "childForRange:ofPath:", v10, v11 - v10, v6);
      }
      uint64_t v10 = v13 + v14;
      uint64_t v9 = v8 - (v13 + v14);
      if (v4) {
        BOOL v15 = v8 == v13 + v14;
      }
      else {
        BOOL v15 = 1;
      }
      if (v15)
      {
        if (v4) {
          goto LABEL_31;
        }
        return v4;
      }
    }
    uint64_t v4 = -[NSFileAccessNode childForRange:ofPath:](v4, "childForRange:ofPath:", v10, v9, v6);
    if (!v4) {
      return v4;
    }
  }
LABEL_31:
  if (v4->_symbolicLinkIsFirmlink) {
    return v4->_symbolicLinkDestination;
  }
  return v4;
}

- (id)childForRange:(_NSRange)a3 ofPath:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.length == 2)
  {
    if ([a4 characterAtIndex:a3.location] == 46
      && [a4 characterAtIndex:location + 1] == 46)
    {
      return self->_parent;
    }
  }
  else if (a3.length == 1 && [a4 characterAtIndex:a3.location] == 46)
  {
    return self;
  }
  lastRequestedChildName = self->_lastRequestedChildName;
  if (lastRequestedChildName
    && !objc_msgSend(a4, "compare:options:range:", lastRequestedChildName, 2, location, length))
  {
    return self->_lastRequestedChild;
  }
  uint64_t v9 = objc_msgSend(a4, "substringWithRange:", location, length);
  id v10 = [(NSFileAccessNode *)self normalizationOfChildName:v9];
  uint64_t v11 = (NSFileAccessNode *)[(NSMutableDictionary *)self->_childrenByNormalizedName objectForKey:v10];
  if (!v11)
  {
    uint64_t v11 = [[NSFileAccessNode alloc] initWithParent:self name:v9 normalizedName:v10];
    [(NSFileAccessNode *)self setChild:v11 forName:v9 normalizedName:v11->_normalizedName];
  }
  self->_lastRequestedChildName = (NSString *)v9;

  self->_lastRequestedChild = v11;
  return v11;
}

- (id)normalizationOfChildName:(id)a3
{
  return a3;
}

- (void)setChild:(id)a3 forName:(id)a4 normalizedName:(id)a5
{
  childrenByNormalizedName = self->_childrenByNormalizedName;
  if (childrenByNormalizedName)
  {
    uint64_t v9 = (void *)-[NSMutableDictionary objectForKey:](childrenByNormalizedName, "objectForKey:", a5, a4);
    if (v9) {
      BOOL v10 = v9 == a3;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10) {
      v9[1] = 0;
    }
  }
  else
  {
    self->_childrenByNormalizedName = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  [(NSMutableDictionary *)self->_childrenByNormalizedName setObject:a3 forKey:a5];

  self->_lastRequestedChildName = 0;
  self->_lastRequestedChild = 0;
}

- (NSFileAccessNode)initWithParent:(id)a3 name:(id)a4 normalizedName:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)NSFileAccessNode;
  uint64_t v8 = [(NSFileAccessNode *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_parent = (NSFileAccessNode *)a3;
    v8->_name = (NSString *)[a4 copy];
    v9->_normalizedName = (NSString *)[a5 copy];
  }
  return v9;
}

- (void)addAccessClaim:(id)a3
{
  if (self->_accessClaimOrClaims)
  {
    if (_NSIsNSSet())
    {
      id accessClaimOrClaims = self->_accessClaimOrClaims;
      [accessClaimOrClaims addObject:a3];
    }
    else
    {
      id v6 = self->_accessClaimOrClaims;
      self->_id accessClaimOrClaims = -[NSCountedSet initWithObjects:]([NSCountedSet alloc], "initWithObjects:", v6, a3, 0);
    }
  }
  else
  {
    self->_id accessClaimOrClaims = a3;
  }
}

- (void)forEachRelevantAccessClaimForEvaluatingAgainstClaim:(id)a3 performProcedure:(id)a4
{
  uint64_t v6 = [a3 cameFromSuperarbiter];

  [(NSFileAccessNode *)self _forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter:v6 performProcedure:a4];
}

- (id)parent
{
  return self->_parent;
}

- (void)forEachPresenterOfItemPerformProcedure:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (_NSIsNSSet())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id presenterOrPresenters = self->_presenterOrPresenters;
    uint64_t v6 = [presenterOrPresenters countByEnumeratingWithState:&v12 objects:v11 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(presenterOrPresenters);
          }
          (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v12 + 1) + 8 * i));
        }
        uint64_t v7 = [presenterOrPresenters countByEnumeratingWithState:&v12 objects:v11 count:16];
      }
      while (v7);
    }
  }
  else if (self->_presenterOrPresenters)
  {
    BOOL v10 = (void (*)(id))*((void *)a3 + 2);
    v10(a3);
  }
}

- (void)forEachPresenterOfContainingFilePackagePerformProcedure:(id)a3
{
  v5[6] = *MEMORY[0x1E4F143B8];
  for (uint64_t i = self->_parent; i; uint64_t i = i->_parent)
  {
    if ([(NSFileAccessNode *)i itemIsFilePackage])
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __76__NSFileAccessNode_forEachPresenterOfContainingFilePackagePerformProcedure___block_invoke;
      v5[3] = &unk_1E51FDE58;
      v5[4] = i;
      void v5[5] = a3;
      [(NSFileAccessNode *)i forEachPresenterOfItemPerformProcedure:v5];
    }
  }
}

- (id)biggestFilePackageLocation
{
  if (!self) {
    return 0;
  }
  v2 = self;
  objc_super v3 = 0;
  do
  {
    if ([(NSFileAccessNode *)v2 itemIsFilePackage]) {
      objc_super v3 = v2;
    }
    v2 = v2->_parent;
  }
  while (v2);
  return v3;
}

- (BOOL)itemIsFilePackage
{
  if (!self->_isFilePackageIsFigured)
  {
    objc_super v3 = [(NSString *)self->_name pathExtension];
    if ([(NSString *)v3 rangeOfString:@"weakpkg" options:1] == 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_isFilePackage = 0;
      parent = self->_parent;
      if (!parent
        || ![(NSString *)parent->_normalizedName isEqualToString:@"volumes"]
        || (uint64_t v5 = self->_parent->_parent) == 0
        || ![(NSString *)v5->_normalizedName isEqualToString:@"/"])
      {
        if ([(NSString *)v3 length])
        {
          if (qword_1EB1EDE18 != -1) {
            dispatch_once(&qword_1EB1EDE18, &__block_literal_global_78);
          }
          uint64_t v6 = _MergedGlobals_149(qword_1EB1EDE08, v3, 0);
          if (v6)
          {
            uint64_t v7 = (const void *)v6;
            self->_isFilePackage = off_1EB1EDE00(v6, qword_1EB1EDE10) != 0;
            CFRelease(v7);
          }
        }
      }
    }
    else
    {
      self->_isFilePackage = 1;
    }
    self->_isFilePackageIsFigured = 1;
  }
  return self->_isFilePackage;
}

- (void)forEachProgressSubscriberOfItemOrContainingItemPerformProcedure:(id)a3
{
  v7[5] = *MEMORY[0x1E4F143B8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__NSFileAccessNode_forEachProgressSubscriberOfItemOrContainingItemPerformProcedure___block_invoke;
  v7[3] = &unk_1E51FDEA8;
  v7[4] = a3;
  [(NSFileAccessNode *)self forEachProgressSubscriberOfItemPerformProcedure:v7];
  parent = self->_parent;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__NSFileAccessNode_forEachProgressSubscriberOfItemOrContainingItemPerformProcedure___block_invoke_2;
  v6[3] = &unk_1E51FDEA8;
  v6[4] = a3;
  [(NSFileAccessNode *)parent forEachProgressSubscriberOfItemPerformProcedure:v6];
}

- (void)forEachProgressSubscriberOfItemPerformProcedure:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x185308110](self, a2);
  if (_NSIsNSSet())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id progressSubscriberOrSubscribers = self->_progressSubscriberOrSubscribers;
    uint64_t v7 = [progressSubscriberOrSubscribers countByEnumeratingWithState:&v12 objects:v11 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(progressSubscriberOrSubscribers);
          }
          (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v12 + 1) + 8 * i));
        }
        uint64_t v8 = [progressSubscriberOrSubscribers countByEnumeratingWithState:&v12 objects:v11 count:16];
      }
      while (v8);
    }
  }
  else if (self->_progressSubscriberOrSubscribers)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

uint64_t __84__NSFileAccessNode_forEachProgressSubscriberOfItemOrContainingItemPerformProcedure___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)itemProvider
{
  if (!self) {
    return 0;
  }
  while (1)
  {
    provider = self->_provider;
    if (provider) {
      break;
    }
    self = self->_parent;
    if (!self) {
      return 0;
    }
  }
  return provider;
}

- (void)_setLinkDestination:(id)a3
{
  symbolicLinkDestination = self->_symbolicLinkDestination;
  if (symbolicLinkDestination != a3)
  {
    if (symbolicLinkDestination) {
      --symbolicLinkDestination->_symbolicLinkReferenceCount;
    }
    uint64_t v6 = symbolicLinkDestination;
    if (a3)
    {
      uint64_t v5 = (NSFileAccessNode *)a3;
      self->_symbolicLinkDestination = v5;
      ++v5->_symbolicLinkReferenceCount;
    }
    else
    {
      self->_symbolicLinkDestination = 0;
      [(NSFileAccessNode *)self removeSelfIfUseless];
    }
    [(NSFileAccessNode *)v6 removeSelfIfUseless];
  }
}

- (void)setSymbolicLinkDestination:(id)a3
{
  self->_symbolicLinkIsFirmlink = 0;
}

- (void)setFirmlinkDestination:(id)a3
{
  self->_symbolicLinkIsFirmlink = a3 != 0;
}

- (id)pathToDescendantForFileURL:(id)a3 componentRange:(_NSRange *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![(NSString *)self->_normalizedName isEqualToString:@"/"])
  {
    BOOL v10 = _NSFCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl(&dword_181795000, v10, OS_LOG_TYPE_ERROR, "[NSFileAccessNode pathToDescendantForFileURL:componentRange:] was invoked in a surprising way.", (uint8_t *)&v14, 2u);
    }
    return 0;
  }
  if (![a3 isFileURL])
  {
    objc_super v11 = _NSFCLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138477827;
      id v15 = a3;
      long long v12 = "NSFileCoordinator only handles URLs that use the file: scheme. This one does not:\n%{private}@";
LABEL_15:
      _os_log_impl(&dword_181795000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0xCu);
    }
    return 0;
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "path"), "pathComponents");
  if (!v6)
  {
    objc_super v11 = _NSFCLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138477827;
      id v15 = a3;
      long long v12 = "NSFileCoordinator does not handle NSURLs that return nil when sent -path, like this one:\n%{private}@";
      goto LABEL_15;
    }
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = [v6 count];
  if (!v8
    || (uint64_t v9 = v8, !objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 0), "isEqualToString:", @"/")))
  {
    objc_super v11 = _NSFCLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138477827;
      id v15 = a3;
      long long v12 = "NSFileCoordinator does not handle NSURLs that return relative paths when sent -path, like this one:\n"
            "%{private}@";
      goto LABEL_15;
    }
    return 0;
  }
  a4->NSUInteger location = 1;
  a4->NSUInteger length = v9 - 1;
  return v7;
}

- (id)descendantAtPath:(id)a3 componentRange:(_NSRange)a4 create:(BOOL)a5
{
  return -[NSFileAccessNode descendantAtPath:componentRange:forAddingLeafNode:create:](self, "descendantAtPath:componentRange:forAddingLeafNode:create:", a3, a4.location, a4.length, 0, a5);
}

- (id)descendantAtPath:(id)a3 componentRange:(_NSRange)a4 forAddingLeafNode:(id)a5 create:(BOOL)a6
{
  if (!a4.length) {
    goto LABEL_13;
  }
  BOOL v7 = a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v12 = _canonicalStringRepresentation([a3 objectAtIndex:a4.location]);
  id v13 = [(NSFileAccessNode *)self normalizationOfChildName:v12];
  uint64_t v14 = [(NSMutableDictionary *)self->_childrenByNormalizedName objectForKey:v13];
  if (v14)
  {
    if (*(void *)(v14 + 32)) {
      id v15 = *(NSFileAccessNode **)(v14 + 32);
    }
    else {
      id v15 = (NSFileAccessNode *)v14;
    }
    if (v15 != a5) {
      goto LABEL_9;
    }
    id v16 = a5;
  }
  id v15 = 0;
LABEL_9:
  if (!v15 && v7)
  {
    id v15 = [[NSFileAccessNode alloc] initWithParent:self name:v12 normalizedName:v13];
    [(NSFileAccessNode *)self setChild:v15 forName:v12 normalizedName:v15->_normalizedName];
  }
  self = -[NSFileAccessNode descendantAtPath:componentRange:forAddingLeafNode:create:](v15, "descendantAtPath:componentRange:forAddingLeafNode:create:", a3, location + 1, length - 1, a5, v7);
LABEL_13:
  if (self && self->_symbolicLinkIsFirmlink) {
    self = self->_symbolicLinkDestination;
  }
  v17 = self;

  return v17;
}

- (void)setParent:(id)a3 name:(id)a4
{
  id v7 = [(NSFileAccessNode *)self normalizationOfChildName:a4];
  [a3 setChild:self forName:a4 normalizedName:v7];
  [(NSFileAccessNode *)self->_parent removeChildForNormalizedName:self->_normalizedName];
  name = self->_name;
  if (name != a4)
  {

    self->_name = (NSString *)[a4 copy];
    self->_normalizedName = (NSString *)v7;
    self->_isFilePackageIsFigured = 0;
  }
  self->_parent = (NSFileAccessNode *)a3;
}

void __37__NSFileAccessNode_itemIsFilePackage__block_invoke()
{
  v0 = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 256);
  if (v0)
  {
    v1 = v0;
    _MergedGlobals_149 = (uint64_t (*)(void, void, void))dlsym(v0, "UTTypeCreatePreferredIdentifierForTag");
    off_1EB1EDE00 = (uint64_t (*)(void, void))dlsym(v1, "UTTypeConformsTo");
    qword_1EB1EDE08 = *(void *)dlsym(v1, "kUTTagClassFilenameExtension");
    uint64_t v2 = *(void *)dlsym(v1, "kUTTypePackage");
    qword_1EB1EDE10 = v2;
    if (_MergedGlobals_149) {
      BOOL v3 = off_1EB1EDE00 == 0;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3 || qword_1EB1EDE08 == 0 || v2 == 0) {
      NSLog((NSString *)@"[NSFileAccessNode itemIsFilePackage] couldn't load a MobileCoreServices symbol.");
    }
  }
}

uint64_t __96__NSFileAccessNode__forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter_performProcedure___block_invoke(uint64_t a1, void *a2)
{
  if (!*(unsigned char *)(a1 + 40) || (uint64_t result = [a2 cameFromSuperarbiter], (result & 1) == 0))
  {
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v4();
  }
  return result;
}

- (void)forEachReactorToItemOrContainedItemPerformProcedure:(id)a3
{
  void v5[5] = *MEMORY[0x1E4F143B8];
  if (self->_provider) {
    (*((void (**)(id))a3 + 2))(a3);
  }
  [(NSFileAccessNode *)self forEachPresenterOfItemPerformProcedure:a3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__NSFileAccessNode_forEachReactorToItemOrContainedItemPerformProcedure___block_invoke;
  v5[3] = &unk_1E51FDE30;
  v5[4] = a3;
  [(NSFileAccessNode *)self forEachDescendantPerformProcedure:v5];
}

uint64_t __72__NSFileAccessNode_forEachReactorToItemOrContainedItemPerformProcedure___block_invoke(uint64_t a1, void *a2)
{
  if (a2[8]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v4 = *(void *)(a1 + 32);

  return [a2 forEachPresenterOfItemPerformProcedure:v4];
}

uint64_t __76__NSFileAccessNode_forEachPresenterOfContainingFilePackagePerformProcedure___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

- (void)forEachPresenterOfContainedItemPerformProcedure:(id)a3
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__NSFileAccessNode_forEachPresenterOfContainedItemPerformProcedure___block_invoke;
  v3[3] = &unk_1E51FDE30;
  v3[4] = a3;
  [(NSFileAccessNode *)self forEachDescendantPerformProcedure:v3];
}

uint64_t __68__NSFileAccessNode_forEachPresenterOfContainedItemPerformProcedure___block_invoke(uint64_t a1, void *a2)
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__NSFileAccessNode_forEachPresenterOfContainedItemPerformProcedure___block_invoke_2;
  v3[3] = &unk_1E51FC798;
  v3[4] = *(void *)(a1 + 32);
  return [a2 forEachPresenterOfItemPerformProcedure:v3];
}

uint64_t __68__NSFileAccessNode_forEachPresenterOfContainedItemPerformProcedure___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forEachPresenterOfItemOrContainedItemPerformProcedure:(id)a3
{
  -[NSFileAccessNode forEachPresenterOfItemPerformProcedure:](self, "forEachPresenterOfItemPerformProcedure:");

  [(NSFileAccessNode *)self forEachPresenterOfContainedItemPerformProcedure:a3];
}

- (void)forEachPresenterOfItemOrContainingItemPerformProcedure:(id)a3
{
  v6[6] = *MEMORY[0x1E4F143B8];
  if (self)
  {
    uint64_t v4 = self;
    uint64_t v5 = MEMORY[0x1E4F143A8];
    do
    {
      v6[0] = v5;
      v6[1] = 3221225472;
      v6[2] = __75__NSFileAccessNode_forEachPresenterOfItemOrContainingItemPerformProcedure___block_invoke;
      v6[3] = &unk_1E51FDE58;
      v6[4] = v4;
      void v6[5] = a3;
      [(NSFileAccessNode *)v4 forEachPresenterOfItemPerformProcedure:v6];
      uint64_t v4 = v4->_parent;
    }
    while (v4);
  }
}

uint64_t __75__NSFileAccessNode_forEachPresenterOfItemOrContainingItemPerformProcedure___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

- (void)forEachPresenterOfContainingItemPerformProcedure:(id)a3
{
  void v6[5] = *MEMORY[0x1E4F143B8];
  parent = self->_parent;
  if (parent)
  {
    uint64_t v5 = MEMORY[0x1E4F143A8];
    do
    {
      v6[0] = v5;
      v6[1] = 3221225472;
      v6[2] = __69__NSFileAccessNode_forEachPresenterOfContainingItemPerformProcedure___block_invoke;
      v6[3] = &unk_1E51FC798;
      v6[4] = a3;
      [(NSFileAccessNode *)parent forEachPresenterOfItemPerformProcedure:v6];
      parent = parent->_parent;
    }
    while (parent);
  }
}

uint64_t __69__NSFileAccessNode_forEachPresenterOfContainingItemPerformProcedure___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__NSFileAccessNode_forEachAccessClaimOnItemOrContainedItemPerformProcedure___block_invoke_2(uint64_t a1, void *a2)
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__NSFileAccessNode_forEachAccessClaimOnItemOrContainedItemPerformProcedure___block_invoke_3;
  v4[3] = &unk_1E51FDE80;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = a2;
  v4[5] = v2;
  return [a2 forEachAccessClaimOnItemPerformProcedure:v4];
}

uint64_t __76__NSFileAccessNode_forEachAccessClaimOnItemOrContainedItemPerformProcedure___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

- (void)setArbitrationBoundary
{
  self->_isArbitrationBoundary = 1;
}

- (BOOL)itemIsSubarbitrable
{
  if (!self) {
    return 0;
  }
  do
  {
    BOOL isArbitrationBoundary = self->_isArbitrationBoundary;
    if (self->_isArbitrationBoundary) {
      break;
    }
    self = self->_parent;
  }
  while (self);
  return isArbitrationBoundary;
}

- (BOOL)itemIsItemAtLocation:(id)a3
{
  if (a3 == self) {
    goto LABEL_7;
  }
  id v4 = [(NSFileAccessNode *)self biggestFilePackageLocation];
  if (!v4) {
    return (char)v4;
  }
  if (v4 == a3)
  {
LABEL_7:
    LOBYTE(v4) = 1;
    return (char)v4;
  }

  LOBYTE(v4) = [a3 itemIsInItemAtLocation:v4];
  return (char)v4;
}

- (BOOL)itemIsInItemAtLocation:(id)a3
{
  do
    self = self->_parent;
  while (self != a3 && self != 0);
  return self != 0;
}

- (void)removePresenter:(id)a3
{
  id presenterOrPresenters = a3;
  if (self->_presenterOrPresenters == a3) {
    goto LABEL_5;
  }
  if (_NSIsNSSet())
  {
    [self->_presenterOrPresenters removeObject:presenterOrPresenters];
    if (![self->_presenterOrPresenters count])
    {
      id presenterOrPresenters = self->_presenterOrPresenters;
LABEL_5:

      self->_id presenterOrPresenters = 0;
    }
  }

  [(NSFileAccessNode *)self removeSelfIfUseless];
}

- (BOOL)setProvider:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSFileAccessNode.m", 881, @"Invalid parameter not satisfying: %@", @"inProvider != nil" object file lineNumber description];
    goto LABEL_14;
  }
  provider = self->_provider;
  if (provider == a3)
  {
LABEL_14:
    BOOL v8 = 0;
    goto LABEL_15;
  }
  if (!provider
    || (uint64_t v6 = [(NSFileProviderProxy *)provider secureID],
        id v7 = (void *)[a3 secureID],
        ([v7 isEqualToString:v6] & 1) != 0)
    || (!v6 ? (BOOL v9 = v7 == 0) : (BOOL v9 = 1), !v9 || _NSFCIP))
  {
    [(NSFileProviderProxy *)self->_provider setItemLocation:0];

    self->_provider = (NSFileProviderProxy *)a3;
    BOOL v8 = 1;
  }
  else
  {
    BOOL v10 = _NSFCProviderLog();
    BOOL v8 = 0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = objc_msgSend(-[NSFileReactorProxy client](self->_provider, "client"), "processIdentifier");
      *(_DWORD *)buf = 67109376;
      int v14 = v11;
      __int16 v15 = 1024;
      int v16 = objc_msgSend((id)objc_msgSend(a3, "client"), "processIdentifier");
      _os_log_impl(&dword_181795000, v10, OS_LOG_TYPE_DEFAULT, "[NSFileAccessNode setProvider:] was invoked for a node that already has a provider (pid %d). Ignoring the new one (pid %d).", buf, 0xEu);
      goto LABEL_14;
    }
  }
LABEL_15:
  [(NSFileAccessNode *)self removeSelfIfUseless];
  return v8;
}

- (void)removeProvider:(id)a3
{
  if (self->_provider == a3)
  {

    self->_provider = 0;
  }
}

- (id)pathExceptPrivate
{
  if (self->_parent)
  {
    BOOL v3 = [(NSString *)self->_name isEqualToString:@"private"];
    parent = self->_parent;
    BOOL v5 = !v3 || parent == 0;
    if (v5 || parent->_parent)
    {
      id v6 = [(NSFileAccessNode *)parent pathExceptPrivate];
      name = self->_name;
      return (id)[v6 arrayByAddingObject:name];
    }
    else
    {
      return [(NSFileAccessNode *)parent pathExceptPrivate];
    }
  }
  else
  {
    BOOL v9 = (void *)MEMORY[0x1E4F1C978];
    BOOL v10 = self->_name;
    return (id)[v9 arrayWithObject:v10];
  }
}

- (id)standardizedURL
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[NSString pathWithComponents:[(NSFileAccessNode *)self pathExceptPrivate]];
  BOOL v3 = (void *)[MEMORY[0x1E4F1CB10] fileURLWithPath:v2];
  if (!v3)
  {
    id v4 = _NSFCLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "-[NSFileAccessNode standardizedURL] is returning nil.", v6, 2u);
    }
  }
  return v3;
}

- (id)name
{
  return self->_name;
}

- (id)urlOfSubitemAtPath:(id)a3 plusPath:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = [(NSFileAccessNode *)self pathFromAncestor:0];
  uint64_t v7 = v6;
  if (a3) {
    uint64_t v7 = (void *)[v6 arrayByAddingObjectsFromArray:a3];
  }
  if (a4) {
    uint64_t v7 = (void *)[v7 arrayByAddingObjectsFromArray:a4];
  }
  BOOL v8 = +[NSString pathWithComponents:v7];
  BOOL v9 = (void *)[MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
  if (!v9)
  {
    BOOL v10 = _NSFCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_181795000, v10, OS_LOG_TYPE_DEFAULT, "-[NSFileAccessNode urlOfSubitemAtPath:plusPath:] is returning nil.", v12, 2u);
    }
  }
  return v9;
}

- (void)addProgressPublisher:(id)a3
{
  if (self->_progressPublisherOrPublishers)
  {
    if (_NSIsNSSet())
    {
      id progressPublisherOrPublishers = self->_progressPublisherOrPublishers;
      [progressPublisherOrPublishers addObject:a3];
    }
    else
    {
      id v6 = self->_progressPublisherOrPublishers;
      self->_id progressPublisherOrPublishers = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v6, a3, 0);
    }
  }
  else
  {
    self->_id progressPublisherOrPublishers = a3;
  }
}

- (void)removeProgressPublisher:(id)a3
{
  id progressPublisherOrPublishers = a3;
  if (self->_progressPublisherOrPublishers == a3) {
    goto LABEL_5;
  }
  if (_NSIsNSSet())
  {
    [self->_progressPublisherOrPublishers removeObject:progressPublisherOrPublishers];
    if (![self->_progressPublisherOrPublishers count])
    {
      id progressPublisherOrPublishers = self->_progressPublisherOrPublishers;
LABEL_5:

      self->_id progressPublisherOrPublishers = 0;
    }
  }

  [(NSFileAccessNode *)self removeSelfIfUseless];
}

- (void)addProgressSubscriber:(id)a3
{
  if (self->_progressSubscriberOrSubscribers)
  {
    if (_NSIsNSSet())
    {
      id progressSubscriberOrSubscribers = self->_progressSubscriberOrSubscribers;
      [progressSubscriberOrSubscribers addObject:a3];
    }
    else
    {
      id v6 = self->_progressSubscriberOrSubscribers;
      self->_id progressSubscriberOrSubscribers = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v6, a3, 0);
    }
  }
  else
  {
    self->_id progressSubscriberOrSubscribers = a3;
  }
}

- (void)removeProgressSubscriber:(id)a3
{
  id progressSubscriberOrSubscribers = a3;
  if (self->_progressSubscriberOrSubscribers == a3) {
    goto LABEL_5;
  }
  if (_NSIsNSSet())
  {
    [self->_progressSubscriberOrSubscribers removeObject:progressSubscriberOrSubscribers];
    if (![self->_progressSubscriberOrSubscribers count])
    {
      id progressSubscriberOrSubscribers = self->_progressSubscriberOrSubscribers;
LABEL_5:

      self->_id progressSubscriberOrSubscribers = 0;
    }
  }

  [(NSFileAccessNode *)self removeSelfIfUseless];
}

- (void)forEachProgressPublisherOfItemPerformProcedure:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (_NSIsNSSet())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id progressPublisherOrPublishers = self->_progressPublisherOrPublishers;
    uint64_t v6 = [progressPublisherOrPublishers countByEnumeratingWithState:&v12 objects:v11 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(progressPublisherOrPublishers);
          }
          (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v12 + 1) + 8 * i));
        }
        uint64_t v7 = [progressPublisherOrPublishers countByEnumeratingWithState:&v12 objects:v11 count:16];
      }
      while (v7);
    }
  }
  else if (self->_progressPublisherOrPublishers)
  {
    BOOL v10 = (void (*)(id))*((void *)a3 + 2);
    v10(a3);
  }
}

- (void)forEachProgressPublisherOfItemOrContainedItemPerformProcedure:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  -[NSFileAccessNode forEachProgressPublisherOfItemPerformProcedure:](self, "forEachProgressPublisherOfItemPerformProcedure:");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  childrenByNormalizedName = self->_childrenByNormalizedName;
  uint64_t v6 = [(NSMutableDictionary *)childrenByNormalizedName countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(childrenByNormalizedName);
        }
        objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_childrenByNormalizedName, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * i)), "forEachProgressPublisherOfItemPerformProcedure:", a3);
      }
      uint64_t v7 = [(NSMutableDictionary *)childrenByNormalizedName countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v7);
  }
}

uint64_t __84__NSFileAccessNode_forEachProgressSubscriberOfItemOrContainingItemPerformProcedure___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forEachProgressThingOfItemOrContainedItemPerformProcedure:(id)a3
{
  void v7[6] = *MEMORY[0x1E4F143B8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke;
  v7[3] = &unk_1E51FDED0;
  v7[4] = self;
  v7[5] = a3;
  [(NSFileAccessNode *)self forEachProgressPublisherOfItemPerformProcedure:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_2;
  v6[3] = &unk_1E51FDEF8;
  v6[4] = self;
  void v6[5] = a3;
  [(NSFileAccessNode *)self forEachProgressSubscriberOfItemPerformProcedure:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_3;
  v5[3] = &unk_1E51FDE30;
  v5[4] = a3;
  [(NSFileAccessNode *)self forEachDescendantPerformProcedure:v5];
}

uint64_t __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

uint64_t __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

uint64_t __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_3(uint64_t a1, void *a2)
{
  v8[6] = *MEMORY[0x1E4F143B8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_4;
  v8[3] = &unk_1E51FDED0;
  uint64_t v4 = *(void *)(a1 + 32);
  v8[4] = a2;
  v8[5] = v4;
  [a2 forEachProgressPublisherOfItemPerformProcedure:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_5;
  v7[3] = &unk_1E51FDEF8;
  uint64_t v5 = *(void *)(a1 + 32);
  v7[4] = a2;
  v7[5] = v5;
  return [a2 forEachProgressSubscriberOfItemPerformProcedure:v7];
}

uint64_t __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

uint64_t __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

- (void)assertDead
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    uint64_t v2 = self;
    int v3 = 0;
    do
    {
      v3 |= [(NSString *)v2->_normalizedName isEqualToString:@"/"];
      uint64_t v2 = v2->_parent;
    }
    while (v2);
    if (v3)
    {
      uint64_t v4 = _NSFCLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "[NSFileAccessNode assertDead] found a surprisingly live node.", v5, 2u);
      }
    }
  }
}

- (void)assertLive
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!self) {
    goto LABEL_5;
  }
  uint64_t v2 = self;
  int v3 = 0;
  do
  {
    v3 |= [(NSString *)v2->_normalizedName isEqualToString:@"/"];
    uint64_t v2 = v2->_parent;
  }
  while (v2);
  if ((v3 & 1) == 0)
  {
LABEL_5:
    uint64_t v4 = _NSFCLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "[NSFileAccessNode assertLive] found a surprisingly dead node.", v5, 2u);
    }
  }
}

- (void)assertDescendantsLive
{
  [(NSFileAccessNode *)self->_lastRequestedChild assertLive];

  [(NSFileAccessNode *)self forEachDescendantPerformProcedure:&__block_literal_global_47];
}

uint64_t __41__NSFileAccessNode_assertDescendantsLive__block_invoke(uint64_t a1, id *a2)
{
  [a2[12] assertLive];

  return [a2 assertLive];
}

- (BOOL)_mayContainCriticalDebuggingInformationExcludingReactors:(BOOL)a3
{
  if (self->_accessClaimOrClaims || self->_isArbitrationBoundary) {
    return 1;
  }
  BOOL v6 = [(NSFileAccessNode *)self itemIsFilePackage];
  BOOL result = !a3 || v6;
  if (!a3 && !v6)
  {
    if (!self->_presenterOrPresenters) {
      return self->_provider != 0;
    }
    return 1;
  }
  return result;
}

- (id)_childrenExcludingExcessNodes:(BOOL)a3 excludingReactors:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  childrenByNormalizedName = self->_childrenByNormalizedName;
  uint64_t v9 = [(NSMutableDictionary *)childrenByNormalizedName countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(childrenByNormalizedName);
        }
        long long v13 = (void *)[(NSMutableDictionary *)self->_childrenByNormalizedName objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        long long v14 = v13;
        if (v5 && ![v13 _mayContainCriticalDebuggingInformationExcludingReactors:v4]) {
          objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(v14, "_childrenExcludingExcessNodes:excludingReactors:", 1, v4));
        }
        else {
          [v7 addObject:v14];
        }
      }
      uint64_t v10 = [(NSMutableDictionary *)childrenByNormalizedName countByEnumeratingWithState:&v17 objects:v16 count:16];
    }
    while (v10);
  }
  return v7;
}

- (id)descriptionWithIndenting:(id)a3 excludingExcessNodes:(BOOL)a4 excludingReactors:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v37 = a4;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)[a3 stringByAppendingString:@"    "];
  uint64_t v9 = +[NSString string];
  [(NSString *)v9 appendFormat:@"%@<%@ %p> parent: %p, name: \"%@\"", a3, objc_opt_class(), self, self->_parent, self->_name];
  if (self->_symbolicLinkDestination) {
    [(NSString *)v9 appendFormat:@" (link target to node %p)", self->_symbolicLinkDestination];
  }
  if (self->_symbolicLinkReferenceCount) {
    [(NSString *)v9 appendString:@" (a link destination)"];
  }
  if (self->_isArbitrationBoundary) {
    [(NSString *)v9 appendString:@" - an arbitration boundary"];
  }
  if (self->_provider && !v5)
  {
    [(NSString *)v9 appendFormat:@"\n%@provider:", a3];
    [(NSString *)v9 appendFormat:@"\n%@", [(NSFileReactorProxy *)self->_provider descriptionWithIndenting:v8]];
  }
  if (self->_presenterOrPresenters && !v5)
  {
    [(NSString *)v9 appendFormat:@"\n%@presenters:", a3];
    if (_NSIsNSSet())
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id presenterOrPresenters = self->_presenterOrPresenters;
      uint64_t v11 = [presenterOrPresenters countByEnumeratingWithState:&v59 objects:v58 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v60 != v13) {
              objc_enumerationMutation(presenterOrPresenters);
            }
            -[NSString appendFormat:](v9, "appendFormat:", @"\n%@", [*(id *)(*((void *)&v59 + 1) + 8 * i) descriptionWithIndenting:v8]);
          }
          uint64_t v12 = [presenterOrPresenters countByEnumeratingWithState:&v59 objects:v58 count:16];
        }
        while (v12);
      }
    }
    else
    {
      -[NSString appendFormat:](v9, "appendFormat:", @"\n%@", [self->_presenterOrPresenters descriptionWithIndenting:v8]);
    }
  }
  if (self->_accessClaimOrClaims)
  {
    [(NSString *)v9 appendFormat:@"\n%@access claims:", a3];
    if (_NSIsNSSet())
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id accessClaimOrClaims = self->_accessClaimOrClaims;
      uint64_t v16 = [accessClaimOrClaims countByEnumeratingWithState:&v54 objects:v53 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v55;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v55 != v18) {
              objc_enumerationMutation(accessClaimOrClaims);
            }
            -[NSString appendFormat:](v9, "appendFormat:", @"\n%@", [*(id *)(*((void *)&v54 + 1) + 8 * j) descriptionWithIndenting:v8]);
          }
          uint64_t v17 = [accessClaimOrClaims countByEnumeratingWithState:&v54 objects:v53 count:16];
        }
        while (v17);
      }
    }
    else
    {
      -[NSString appendFormat:](v9, "appendFormat:", @"\n%@", [self->_accessClaimOrClaims descriptionWithIndenting:v8]);
    }
  }
  if (self->_progressSubscriberOrSubscribers)
  {
    [(NSString *)v9 appendFormat:@"\n%@progress subscribers:", a3];
    if (_NSIsNSSet())
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id progressSubscriberOrSubscribers = self->_progressSubscriberOrSubscribers;
      uint64_t v21 = [progressSubscriberOrSubscribers countByEnumeratingWithState:&v49 objects:v48 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v50;
        do
        {
          for (uint64_t k = 0; k != v22; ++k)
          {
            if (*(void *)v50 != v23) {
              objc_enumerationMutation(progressSubscriberOrSubscribers);
            }
            -[NSString appendFormat:](v9, "appendFormat:", @"\n%@", [*(id *)(*((void *)&v49 + 1) + 8 * k) descriptionWithIndenting:v8]);
          }
          uint64_t v22 = [progressSubscriberOrSubscribers countByEnumeratingWithState:&v49 objects:v48 count:16];
        }
        while (v22);
      }
    }
    else
    {
      -[NSString appendFormat:](v9, "appendFormat:", @"\n%@", [self->_progressSubscriberOrSubscribers descriptionWithIndenting:v8]);
    }
  }
  if (self->_progressPublisherOrPublishers)
  {
    [(NSString *)v9 appendFormat:@"\n%@progress publishers:", a3];
    if (_NSIsNSSet())
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id progressPublisherOrPublishers = self->_progressPublisherOrPublishers;
      uint64_t v26 = [progressPublisherOrPublishers countByEnumeratingWithState:&v44 objects:v43 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v45;
        do
        {
          for (uint64_t m = 0; m != v27; ++m)
          {
            if (*(void *)v45 != v28) {
              objc_enumerationMutation(progressPublisherOrPublishers);
            }
            -[NSString appendFormat:](v9, "appendFormat:", @"\n%@", [*(id *)(*((void *)&v44 + 1) + 8 * m) descriptionWithIndenting:v8]);
          }
          uint64_t v27 = [progressPublisherOrPublishers countByEnumeratingWithState:&v44 objects:v43 count:16];
        }
        while (v27);
      }
    }
    else
    {
      -[NSString appendFormat:](v9, "appendFormat:", @"\n%@", [self->_progressPublisherOrPublishers descriptionWithIndenting:v8]);
    }
  }
  id v30 = [(NSFileAccessNode *)self _childrenExcludingExcessNodes:v37 excludingReactors:v5];
  if ([v30 count])
  {
    [(NSString *)v9 appendFormat:@"\n%@children:", a3];
    uint64_t v31 = [v8 stringByAppendingString:@"    "];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v32 = [v30 countByEnumeratingWithState:&v39 objects:v38 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v40;
      do
      {
        for (uint64_t n = 0; n != v33; ++n)
        {
          if (*(void *)v40 != v34) {
            objc_enumerationMutation(v30);
          }
          -[NSString appendFormat:](v9, "appendFormat:", @"\n%@%@\n%@", v8, *(void *)(*(void *)(*((void *)&v39 + 1) + 8 * n) + 24), [*(id *)(*((void *)&v39 + 1) + 8 * n) descriptionWithIndenting:v31 excludingExcessNodes:v37 excludingReactors:v5]);
        }
        uint64_t v33 = [v30 countByEnumeratingWithState:&v39 objects:v38 count:16];
      }
      while (v33);
    }
  }
  return v9;
}

- (id)sensitiveDescription
{
  return [(NSFileAccessNode *)self descriptionWithIndenting:&stru_1ECA5C228 excludingExcessNodes:1 excludingReactors:0];
}

- (id)description
{
  return [(NSFileAccessNode *)self descriptionWithIndenting:&stru_1ECA5C228 excludingExcessNodes:0 excludingReactors:0];
}

- (id)sensitiveSubarbiterDescription
{
  return [(NSFileAccessNode *)self descriptionWithIndenting:&stru_1ECA5C228 excludingExcessNodes:0 excludingReactors:1];
}

- (id)subarbiterDescription
{
  return [(NSFileAccessNode *)self descriptionWithIndenting:&stru_1ECA5C228 excludingExcessNodes:1 excludingReactors:1];
}

@end