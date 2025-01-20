@interface MPModelPlaylistAuthorKind
+ (id)identityKind;
+ (id)kindWithVariants:(unint64_t)a3;
- (id)humanDescription;
- (shared_ptr<mlcore::Predicate>)predicateWithBaseProperty:(void *)a3;
- (unint64_t)variants;
@end

@implementation MPModelPlaylistAuthorKind

- (unint64_t)variants
{
  return self->_variants;
}

- (id)humanDescription
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  v4 = v3;
  unint64_t variants = self->_variants;
  if (variants)
  {
    [v3 addObject:@"host"];
    unint64_t variants = self->_variants;
    if ((variants & 2) == 0)
    {
LABEL_3:
      if ((variants & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((variants & 2) == 0)
  {
    goto LABEL_3;
  }
  [v4 addObject:@"collaborator"];
  if ((self->_variants & 4) != 0) {
LABEL_4:
  }
    [v4 addObject:@"pending-collaborator"];
LABEL_5:
  v6 = NSString;
  v7 = objc_msgSend(v4, "msv_compactDescription");
  v8 = [v6 stringWithFormat:@"playlist author: variants:[%@]", v7];

  return v8;
}

+ (id)kindWithVariants:(unint64_t)a3
{
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"PlaylistAuthor:v%lu", a3);
  uint64_t v6 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__MPModelPlaylistAuthorKind_kindWithVariants___block_invoke;
  v9[3] = &__block_descriptor_40_e35_v16__0__MPModelPlaylistAuthorKind_8l;
  v9[4] = a3;
  v7 = [a1 kindWithModelClass:v6 cacheKey:v5 block:v9];

  return v7;
}

uint64_t __46__MPModelPlaylistAuthorKind_kindWithVariants___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 16) = *(void *)(result + 32);
  return result;
}

+ (id)identityKind
{
  return +[MPModelPlaylistAuthorKind kindWithVariants:3];
}

- (shared_ptr<mlcore::Predicate>)predicateWithBaseProperty:(void *)a3
{
  v4 = (ModelPropertyBase *)mlcore::PlaylistAuthorPropertyRole((mlcore *)self);
  if (a3) {
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, v4);
  }
  std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<int>,std::allocator<mlcore::ComparisonPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::ComparisonOperator &,int const&,mlcore::ComparisonOptions &,void>();
}

@end