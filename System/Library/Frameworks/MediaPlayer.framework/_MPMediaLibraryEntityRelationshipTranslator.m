@interface _MPMediaLibraryEntityRelationshipTranslator
- (BOOL)transient;
- (Class)relationshipModelClass;
- (MPMediaLibraryEntityTranslator)entityTranslator;
- (id).cxx_construct;
- (id)validRelationshipHandler;
- (shared_ptr<std::unordered_map<std::string,)relationshipValidationProperties;
- (void)foreignPropertyBase;
- (void)setForeignPropertyBase:(void *)a3;
- (void)setRelationshipModelClass:(Class)a3;
- (void)setRelationshipValidationProperties:()shared_ptr<std:(mlcore::ModelPropertyBase *>>)a3 :unordered_map<std::string;
- (void)setTransient:(BOOL)a3;
- (void)setValidRelationshipHandler:(id)a3;
@end

@implementation _MPMediaLibraryEntityRelationshipTranslator

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

- (MPMediaLibraryEntityTranslator)entityTranslator
{
  v2 = [(_MPMediaLibraryEntityRelationshipTranslator *)self relationshipModelClass];

  return (MPMediaLibraryEntityTranslator *)+[MPMediaLibraryEntityTranslator translatorForMPModelClass:v2];
}

- (Class)relationshipModelClass
{
  return self->_relationshipModelClass;
}

- (BOOL)transient
{
  return self->_transient;
}

- (void)foreignPropertyBase
{
  return self->_foreignPropertyBase;
}

- (id)validRelationshipHandler
{
  return self->_validRelationshipHandler;
}

- (void)setValidRelationshipHandler:(id)a3
{
}

- (void)setTransient:(BOOL)a3
{
  self->_transient = a3;
}

- (void)setRelationshipValidationProperties:()shared_ptr<std:(mlcore::ModelPropertyBase *>>)a3 :unordered_map<std::string
{
  v4 = *(void **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_relationshipValidationProperties.__cntrl_;
  self->_relationshipValidationProperties.__ptr_ = v4;
  self->_relationshipValidationProperties.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)setRelationshipModelClass:(Class)a3
{
  self->_relationshipModelClass = a3;
}

- (void)setForeignPropertyBase:(void *)a3
{
  self->_foreignPropertyBase = a3;
}

- (shared_ptr<std::unordered_map<std::string,)relationshipValidationProperties
{
  cntrl = self->_relationshipValidationProperties.__cntrl_;
  objc_class *v2 = self->_relationshipValidationProperties.__ptr_;
  v2[1] = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_relationshipValidationProperties.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }

  objc_storeStrong(&self->_validRelationshipHandler, 0);
}

@end