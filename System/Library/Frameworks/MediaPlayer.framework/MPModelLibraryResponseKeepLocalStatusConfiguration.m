@interface MPModelLibraryResponseKeepLocalStatusConfiguration
- (id).cxx_construct;
- (id)downloadablePlaylistItemEntityQueryBlock;
- (shared_ptr<mlcore::EntityQuery>)downloadableItemsQuery;
- (void)setDownloadableItemsQuery:(shared_ptr<mlcore::EntityQuery>)a3;
- (void)setDownloadablePlaylistItemEntityQueryBlock:(id)a3;
@end

@implementation MPModelLibraryResponseKeepLocalStatusConfiguration

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_downloadableItemsQuery.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }

  objc_storeStrong(&self->_downloadablePlaylistItemEntityQueryBlock, 0);
}

- (void)setDownloadableItemsQuery:(shared_ptr<mlcore::EntityQuery>)a3
{
  v4 = *(EntityQuery **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_downloadableItemsQuery.__cntrl_;
  self->_downloadableItemsQuery.__ptr_ = v4;
  self->_downloadableItemsQuery.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<mlcore::EntityQuery>)downloadableItemsQuery
{
  cntrl = self->_downloadableItemsQuery.__cntrl_;
  *v2 = self->_downloadableItemsQuery.__ptr_;
  v2[1] = (EntityQuery *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (EntityQuery *)self;
  return result;
}

- (void)setDownloadablePlaylistItemEntityQueryBlock:(id)a3
{
}

- (id)downloadablePlaylistItemEntityQueryBlock
{
  return self->_downloadablePlaylistItemEntityQueryBlock;
}

@end