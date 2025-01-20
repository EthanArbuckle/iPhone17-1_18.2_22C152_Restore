@interface MPStoreLibraryMappingRequestOperation
+ (BOOL)supportsModelClass:(Class)a3;
- (Class)modelClass;
- (MPMediaLibraryView)libraryView;
- (NSArray)albumArtistNamesToIdentifierSets;
- (NSArray)identifierSets;
- (id)responseHandler;
- (void)execute;
- (void)setAlbumArtistNamesToIdentifierSets:(id)a3;
- (void)setIdentifierSets:(id)a3;
- (void)setLibraryView:(id)a3;
- (void)setModelClass:(Class)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPStoreLibraryMappingRequestOperation

- (void)setResponseHandler:(id)a3
{
}

- (void)setModelClass:(Class)a3
{
  self->_modelClass = a3;
}

- (void)setLibraryView:(id)a3
{
}

- (void)setIdentifierSets:(id)a3
{
}

+ (BOOL)supportsModelClass:(Class)a3
{
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) != 0)
  {
    return 1;
  }
  uint64_t v5 = objc_opt_class();

  return [(objc_class *)a3 isSubclassOfClass:v5];
}

- (void)execute
{
  uint64_t v2 = MEMORY[0x1F4188790](self, a2);
  uint64_t v534 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(v2 + 272))
  {
    uint64_t v231 = v3;
    uint64_t v232 = v2;
    v233 = [MEMORY[0x1E4F28B00] currentHandler];
    [v233 handleFailureInMethod:v231 object:v232 file:@"MPStoreLibraryMappingRequestOperation.mm" lineNumber:40 description:@"Library view must not be nil."];

    uint64_t v2 = v232;
  }
  v517[0] = MEMORY[0x1E4F143A8];
  v517[1] = 3221225472;
  v517[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke;
  v517[3] = &unk_1E57F5768;
  uint64_t v289 = v2;
  v517[4] = v2;
  v266 = (void (**)(void, void, void))MEMORY[0x19971E0F0](v517);
  if ([(id)v289 isCancelled])
  {
    v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    ((void (**)(void, void, void *))v266)[2](v266, 0, v4);
    goto LABEL_184;
  }
  if ([*(id *)(v289 + 296) count]
    && ([*(id *)(v289 + 280) isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:5 userInfo:0];
    ((void (**)(void, void, void *))v266)[2](v266, 0, v4);
    goto LABEL_184;
  }
  uint64_t v5 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:*(void *)(v289 + 280)];
  v6 = +[MPPropertySet emptyPropertySet];
  v264 = v5;
  if (v5)
  {
    [v5 MLCorePropertiesForPropertySet:v6];
  }
  else
  {
    v515 = 0;
    v514 = 0;
    uint64_t v516 = 0;
  }

  v265 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
  v7 = [*(id *)(v289 + 272) library];
  [(MPMediaLibraryEntityTranslationContext *)v265 setMediaLibrary:v7];

  v8 = +[MPModelKind kindWithModelClass:*(void *)(v289 + 280)];
  [(MPMediaLibraryEntityTranslationContext *)v265 setModelKind:v8];

  if ([MEMORY[0x1E4FB87C0] canAccessAccountStore])
  {
    v9 = [(id)v289 userIdentity];
    v10 = [v9 accountDSID];
    [(MPMediaLibraryEntityTranslationContext *)v265 setPersonID:v10];
  }
  if (([*(id *)(v289 + 280) isSubclassOfClass:objc_opt_class()] & 1) == 0
    && ([*(id *)(v289 + 280) isSubclassOfClass:objc_opt_class()] & 1) == 0
    && ![*(id *)(v289 + 280) isSubclassOfClass:objc_opt_class()])
  {
    if ([*(id *)(v289 + 280) isSubclassOfClass:objc_opt_class()])
    {
      v267 = (MPStoreLibraryMappingResponse *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      *(_OWORD *)v290 = 0u;
      long long v291 = 0u;
      LODWORD(v292) = 1065353216;
      long long v512 = 0u;
      long long v511 = 0u;
      int v513 = 1065353216;
      long long v509 = 0u;
      long long v508 = 0u;
      int v510 = 1065353216;
      long long v441 = 0u;
      long long v442 = 0u;
      long long v443 = 0u;
      long long v444 = 0u;
      id v64 = *(id *)(v289 + 288);
      uint64_t v65 = [v64 countByEnumeratingWithState:&v441 objects:v526 count:16];
      if (!v65)
      {
LABEL_79:

        if ([(id)v289 isCancelled])
        {
          v77 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
          ((void (**)(void, void, MPStoreLibraryMappingResponse *))v266)[2](v266, 0, v77);
        }
        else
        {
          v112 = objc_alloc_init(MPStoreLibraryMappingResponse);
          v431[0] = MEMORY[0x1E4F143A8];
          v431[1] = 3321888768;
          v431[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_4;
          v431[3] = &unk_1EE673858;
          v431[4] = v289;
          v113 = v266;
          id v436 = v113;
          v114 = v267;
          v432 = v114;
          uint64_t v269 = std::unordered_set<std::string>::unordered_set((uint64_t)&v437, (uint64_t)v290);
          v439 = 0;
          v438 = 0;
          uint64_t v440 = 0;
          std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v438, v514, (uint64_t)v515, (v515 - (unsigned char *)v514) >> 3);
          id v115 = v264;
          id v433 = v115;
          v116 = v265;
          v434 = v116;
          v117 = v112;
          v435 = v117;
          id v278 = (id)MEMORY[0x19971E0F0](v431);
          v420[0] = MEMORY[0x1E4F143A8];
          v420[1] = 3321888768;
          v420[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_34;
          v420[3] = &unk_1EE673900;
          v420[4] = v289;
          v118 = v113;
          id v425 = v118;
          v119 = v114;
          v421 = v119;
          v260 = v118;
          id obja = (id)std::unordered_set<unsigned long long>::unordered_set((uint64_t)&v427, (uint64_t)&v511);
          v429 = 0;
          v428 = 0;
          uint64_t v430 = 0;
          std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v428, v514, (uint64_t)v515, (v515 - (unsigned char *)v514) >> 3);
          id v120 = v115;
          id v422 = v120;
          v121 = v116;
          v423 = v121;
          v77 = v117;
          v424 = v77;
          id v122 = v278;
          id v426 = v122;
          v284 = (void (**)(void))MEMORY[0x19971E0F0](v420);
          if ([(MPStoreLibraryMappingResponse *)v119 count] && *((void *)&v509 + 1))
          {
            *(void *)&long long v506 = 0;
            v505[0] = 0;
            v505[1] = 0;
            unint64_t v123 = 0;
            if ((void)v509)
            {
              v124 = (void *)v509;
              do
              {
                ++v123;
                v124 = (void *)*v124;
              }
              while (v124);
            }
            v125 = std::vector<std::string>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<std::string,void *> *>,std::__hash_const_iterator<std::__hash_node<std::string,void *> *>>(v505, (uint64_t *)v509, v123);
            v126 = (mlcore *)MEMORY[0x19971D610](v125);
            uint64_t v127 = (uint64_t)v126;
            if (*((void *)&v509 + 1) >= 2uLL)
            {
              mlcore::PlaylistPropertyCloudUniversalLibraryID(v126);
              std::allocate_shared[abi:ne180100]<mlcore::InPredicate<std::string>,std::allocator<mlcore::InPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,std::vector<std::string> const&,void>();
            }
            uint64_t v128 = mlcore::PlaylistPropertyCloudUniversalLibraryID(v126);
            std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<std::string>,std::allocator<mlcore::ComparisonPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,mlcore::ComparisonOperator,std::string const&,void>((uint64_t *)&v518, v128, 0, (uint64_t)v505[0]);
            *(_OWORD *)__p = v518;
            long long v518 = 0uLL;
            std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(&v527, v127, (long long *)__p);
            if (__p[1]) {
              std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
            }
            if (*((void *)&v518 + 1)) {
              std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v518 + 1));
            }
            __p[1] = 0;
            __p[0] = 0;
            uint64_t v496 = 0;
            v210 = (mlcore *)std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(__p, v514, (uint64_t)v515, (v515 - (unsigned char *)v514) >> 3);
            v458[0] = (void *)mlcore::PlaylistPropertyPersistentID(v210);
            std::vector<mlcore::ModelPropertyBase *>::push_back[abi:ne180100](__p, v458);
            v458[0] = (void *)mlcore::PlaylistPropertyCloudUniversalLibraryID(v211);
            std::vector<mlcore::ModelPropertyBase *>::push_back[abi:ne180100](__p, v458);
            v212 = v527;
            uint64_t v419 = 0;
            v417 = 0;
            v418 = 0;
            v213 = __p[0];
            std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v417, __p[0], (uint64_t)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 3);
            mlcore::PropertiesQuery::setPropertiesToFetch();
            v214 = (mlcore *)v417;
            if (v417)
            {
              v418 = v417;
              operator delete(v417);
            }
            mlcore::PlaylistPropertyIsHidden(v214);
            mlcore::SortDescriptor::SortDescriptor();
            std::vector<mlcore::SortDescriptor>::vector[abi:ne180100](v458, (uint64_t)&v530, 1uLL);
            mlcore::PropertiesQuery::setSortDescriptors();
            v215 = *(void **)(v289 + 272);
            v216 = v528;
            v415 = v212;
            v416 = v528;
            if (v528) {
              atomic_fetch_add_explicit(&v528->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            v407[0] = MEMORY[0x1E4F143A8];
            v407[1] = 3221225472;
            v407[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_36;
            v407[3] = &unk_1E57F57B8;
            v408 = v119;
            id v409 = v120;
            v410 = v121;
            v411 = v77;
            uint64_t v412 = v289;
            id v413 = v260;
            v414 = v284;
            [v215 performCoreQuery:&v415 withCompletion:v407];
            if (v416) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v416);
            }

            *(void *)&long long v530 = v458;
            std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100]((void ***)&v530);
            if (v213) {
              operator delete(v213);
            }
            if (v216) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v216);
            }
            __p[0] = v505;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
          }
          else
          {
            v284[2]();
          }

          if (v428)
          {
            v429 = v428;
            operator delete(v428);
          }
          std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)obja);

          if (v438)
          {
            v439 = v438;
            operator delete(v438);
          }
          std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table(v269);
        }
        std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&v508);
        std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)&v511);
        std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v290);
        goto LABEL_180;
      }
      uint64_t v66 = *(void *)v442;
LABEL_64:
      uint64_t v67 = 0;
      while (1)
      {
        if (*(void *)v442 != v66) {
          objc_enumerationMutation(v64);
        }
        v68 = *(void **)(*((void *)&v441 + 1) + 8 * v67);
        v69 = [v68 universalStore];
        v70 = [v69 globalPlaylistID];

        uint64_t v71 = [v70 length];
        BOOL v72 = v71 != 0;
        if (v71)
        {
          std::string::basic_string[abi:ne180100]<0>(v505, (char *)[v70 UTF8String]);
          std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>((uint64_t)v290, (unsigned __int8 *)v505, (uint64_t)v505);
          if (SBYTE7(v506) < 0) {
            operator delete(v505[0]);
          }
        }
        v73 = [v68 personalizedStore];
        uint64_t v74 = [v73 cloudID];

        if (v74)
        {
          std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)&v511, v74, v74);
          BOOL v72 = 1;
        }
        v75 = [v68 universalStore];
        v76 = [v75 universalCloudLibraryID];

        if ([v76 length]) {
          break;
        }
        if (v72) {
          goto LABEL_76;
        }
LABEL_77:

        if (v65 == ++v67)
        {
          uint64_t v65 = [v64 countByEnumeratingWithState:&v441 objects:v526 count:16];
          if (!v65) {
            goto LABEL_79;
          }
          goto LABEL_64;
        }
      }
      std::string::basic_string[abi:ne180100]<0>(v505, (char *)[v76 UTF8String]);
      std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>((uint64_t)&v508, (unsigned __int8 *)v505, (uint64_t)v505);
      if (SBYTE7(v506) < 0) {
        operator delete(v505[0]);
      }
LABEL_76:
      [(MPStoreLibraryMappingResponse *)v267 addObject:v68];
      goto LABEL_77;
    }
    if (([*(id *)(v289 + 280) isSubclassOfClass:objc_opt_class()] & 1) != 0
      || [*(id *)(v289 + 280) isSubclassOfClass:objc_opt_class()])
    {
      v267 = (MPStoreLibraryMappingResponse *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      *(_OWORD *)v290 = 0u;
      long long v291 = 0u;
      LODWORD(v292) = 1065353216;
      long long v512 = 0u;
      long long v511 = 0u;
      int v513 = 1065353216;
      long long v509 = 0u;
      long long v508 = 0u;
      int v510 = 1065353216;
      long long v403 = 0u;
      long long v404 = 0u;
      long long v405 = 0u;
      long long v406 = 0u;
      id v283 = *(id *)(v289 + 288);
      uint64_t v88 = [v283 countByEnumeratingWithState:&v403 objects:v525 count:16];
      if (!v88) {
        goto LABEL_128;
      }
      uint64_t v89 = *(void *)v404;
      while (1)
      {
        for (uint64_t i = 0; i != v88; ++i)
        {
          if (*(void *)v404 != v89) {
            objc_enumerationMutation(v283);
          }
          v91 = *(void **)(*((void *)&v403 + 1) + 8 * i);
          v92 = [v91 personalizedStore];
          v93 = [v92 cloudAlbumID];

          uint64_t v94 = [v93 length];
          BOOL v95 = v94 != 0;
          if (v94)
          {
            std::string::basic_string[abi:ne180100]<0>(v505, (char *)[v93 UTF8String]);
            std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>((uint64_t)&v511, (unsigned __int8 *)v505, (uint64_t)v505);
            if (SBYTE7(v506) < 0) {
              operator delete(v505[0]);
            }
          }
          v96 = [v91 universalStore];
          uint64_t v97 = [v96 adamID];

          if (v97)
          {
            std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v290, v97, v97);
            BOOL v95 = 1;
          }
          v98 = [v91 universalStore];
          v99 = [v98 formerAdamIDs];

          long long v402 = 0u;
          long long v401 = 0u;
          long long v400 = 0u;
          long long v399 = 0u;
          id v100 = v99;
          uint64_t v101 = [v100 countByEnumeratingWithState:&v399 objects:v524 count:16];
          if (v101)
          {
            uint64_t v102 = *(void *)v400;
            do
            {
              for (uint64_t j = 0; j != v101; ++j)
              {
                if (*(void *)v400 != v102) {
                  objc_enumerationMutation(v100);
                }
                uint64_t v104 = [*(id *)(*((void *)&v399 + 1) + 8 * j) longLongValue];
                if (v104) {
                  std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v290, v104, v104);
                }
              }
              uint64_t v101 = [v100 countByEnumeratingWithState:&v399 objects:v524 count:16];
            }
            while (v101);
          }

          v105 = [v91 universalStore];
          uint64_t v106 = [v105 subscriptionAdamID];

          if (v106)
          {
            std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v290, v106, v106);
            BOOL v95 = 1;
          }
          v107 = [v91 universalStore];
          uint64_t v108 = [v107 purchasedAdamID];

          if (v108)
          {
            std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v290, v108, v108);
            BOOL v95 = 1;
          }
          v109 = [v91 universalStore];
          v110 = [v109 universalCloudLibraryID];

          if ([v110 length])
          {
            std::string::basic_string[abi:ne180100]<0>(v505, (char *)[v110 UTF8String]);
            std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>((uint64_t)&v508, (unsigned __int8 *)v505, (uint64_t)v505);
            if (SBYTE7(v506) < 0) {
              operator delete(v505[0]);
            }
          }
          else if (!v95)
          {
            goto LABEL_126;
          }
          [(MPStoreLibraryMappingResponse *)v267 addObject:v91];
LABEL_126:
        }
        uint64_t v88 = [v283 countByEnumeratingWithState:&v403 objects:v525 count:16];
        if (!v88)
        {
LABEL_128:

          if ([(id)v289 isCancelled])
          {
            v111 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
            ((void (**)(void, void, MPStoreLibraryMappingResponse *))v266)[2](v266, 0, v111);
            goto LABEL_323;
          }
          v184 = objc_alloc_init(MPStoreLibraryMappingResponse);
          v389[0] = MEMORY[0x1E4F143A8];
          v389[1] = 3321888768;
          v389[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_37;
          v389[3] = &unk_1EE673890;
          v389[4] = v289;
          v185 = v266;
          id v394 = v185;
          v186 = v267;
          v390 = v186;
          id v280 = (id)std::unordered_set<long long>::unordered_set((uint64_t)&v395, (uint64_t)v290);
          v397 = 0;
          v396 = 0;
          uint64_t v398 = 0;
          std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v396, v514, (uint64_t)v515, (v515 - (unsigned char *)v514) >> 3);
          id v187 = v264;
          id v391 = v187;
          v188 = v265;
          v392 = v188;
          v111 = v184;
          v393 = v111;
          v287 = (void (**)(void))MEMORY[0x19971E0F0](v389);
          if ([(MPStoreLibraryMappingResponse *)v186 count] && *((void *)&v512 + 1))
          {
            *(void *)&long long v506 = 0;
            v505[0] = 0;
            v505[1] = 0;
            unint64_t v189 = 0;
            if ((void)v512)
            {
              v190 = (void *)v512;
              do
              {
                ++v189;
                v190 = (void *)*v190;
              }
              while (v190);
            }
            std::vector<std::string>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<std::string,void *> *>,std::__hash_const_iterator<std::__hash_node<std::string,void *> *>>(v505, (uint64_t *)v512, v189);
            v378[0] = MEMORY[0x1E4F143A8];
            v378[1] = 3321888768;
            v378[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_39;
            v378[3] = &unk_1EE673820;
            memset(v385, 0, sizeof(v385));
            std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(v385, (long long *)v505[0], (long long *)v505[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v505[1] - (char *)v505[0]) >> 3));
            v258 = (void **)v385;
            v378[4] = v289;
            v386 = 0;
            uint64_t v388 = 0;
            v387 = 0;
            std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v386, v514, (uint64_t)v515, (v515 - (unsigned char *)v514) >> 3);
            v191 = v186;
            v379 = v191;
            id v192 = v187;
            id v380 = v192;
            v262 = v188;
            v381 = v262;
            v193 = v111;
            v382 = v193;
            v194 = v185;
            id v383 = v194;
            v384 = v287;
            v271 = (mlcore *)MEMORY[0x19971E0F0](v378);
            v195 = (mlcore *)mlcore::AlbumPropertyRepresentativeItemPersistentID(v271);
            v196 = (ModelPropertyBase *)mlcore::ItemPropertyStoreCloudAlbumID(v195);
            Property = (void **)MPMediaLibraryGetProperty((ModelPropertyBase *)v195, v196);
            uint64_t v198 = MEMORY[0x19971D500]();
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v505[1] - (char *)v505[0]) >> 3) >= 2) {
              std::allocate_shared[abi:ne180100]<mlcore::InPredicate<std::string>,std::allocator<mlcore::InPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,std::vector<std::string> const&,void>();
            }
            std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<std::string>,std::allocator<mlcore::ComparisonPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,mlcore::ComparisonOperator,std::string const&,void>((uint64_t *)&v530, (uint64_t)Property, 0, (uint64_t)v505[0]);
            *(_OWORD *)__p = v530;
            long long v530 = 0uLL;
            std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(v458, v198, (long long *)__p);
            if (__p[1]) {
              std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
            }
            if (*((void *)&v530 + 1)) {
              std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v530 + 1));
            }
            __p[1] = 0;
            __p[0] = 0;
            uint64_t v496 = 0;
            v217 = (mlcore *)std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(__p, v514, (uint64_t)v515, (v515 - (unsigned char *)v514) >> 3);
            v527 = (void **)mlcore::AlbumPropertyPersistentID(v217);
            std::vector<mlcore::ModelPropertyBase *>::push_back[abi:ne180100](__p, &v527);
            v527 = Property;
            std::vector<mlcore::ModelPropertyBase *>::push_back[abi:ne180100](__p, &v527);
            v218 = v458[0];
            uint64_t v377 = 0;
            v375 = 0;
            v376 = 0;
            v219 = __p[0];
            std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v375, __p[0], (uint64_t)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 3);
            mlcore::PropertiesQuery::setPropertiesToFetch();
            if (v375)
            {
              v376 = v375;
              operator delete(v375);
            }
            v220 = *(void **)(v289 + 272);
            v221 = (std::__shared_weak_count *)v458[1];
            v373 = v218;
            v374 = (std::__shared_weak_count *)v458[1];
            if (v458[1]) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)v458[1] + 1, 1uLL, memory_order_relaxed);
            }
            v364[0] = MEMORY[0x1E4F143A8];
            v364[1] = 3221225472;
            v364[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_41;
            v364[3] = &unk_1E57F57E0;
            v372 = Property;
            v365 = v191;
            id v366 = v192;
            v367 = v262;
            v368 = v193;
            uint64_t v369 = v289;
            v370 = v194;
            v222 = v271;
            v371 = v222;
            [v220 performCoreQuery:&v373 withCompletion:v364];
            if (v374) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v374);
            }

            if (v219) {
              operator delete(v219);
            }
            if (v221) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v221);
            }

            v223 = v386;
            if (v386)
            {
              v387 = v386;
              goto LABEL_318;
            }
            goto LABEL_319;
          }
          if ([(MPStoreLibraryMappingResponse *)v186 count] && *((void *)&v509 + 1))
          {
            *(void *)&long long v506 = 0;
            v505[0] = 0;
            v505[1] = 0;
            unint64_t v200 = 0;
            if ((void)v509)
            {
              v201 = (void *)v509;
              do
              {
                ++v200;
                v201 = (void *)*v201;
              }
              while (v201);
            }
            std::vector<std::string>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<std::string,void *> *>,std::__hash_const_iterator<std::__hash_node<std::string,void *> *>>(v505, (uint64_t *)v509, v200);
            v353[0] = MEMORY[0x1E4F143A8];
            v353[1] = 3321888768;
            v353[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_42;
            v353[3] = &unk_1EE673820;
            memset(v360, 0, sizeof(v360));
            std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(v360, (long long *)v505[0], (long long *)v505[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v505[1] - (char *)v505[0]) >> 3));
            v258 = v360;
            v353[4] = v289;
            v361 = 0;
            uint64_t v363 = 0;
            v362 = 0;
            std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v361, v514, (uint64_t)v515, (v515 - (unsigned char *)v514) >> 3);
            v263 = v186;
            v354 = v263;
            id v202 = v187;
            id v355 = v202;
            v203 = v188;
            v356 = v203;
            v204 = v111;
            v357 = v204;
            v205 = v185;
            id v358 = v205;
            v359 = v287;
            v272 = (mlcore *)MEMORY[0x19971E0F0](v353);
            v206 = (mlcore *)mlcore::AlbumPropertyRepresentativeItemPersistentID(v272);
            v207 = (ModelPropertyBase *)mlcore::ItemPropertyStoreCloudAlbumID(v206);
            v208 = (void **)MPMediaLibraryGetProperty((ModelPropertyBase *)v206, v207);
            uint64_t v209 = MEMORY[0x19971D500]();
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v505[1] - (char *)v505[0]) >> 3) >= 2) {
              std::allocate_shared[abi:ne180100]<mlcore::InPredicate<std::string>,std::allocator<mlcore::InPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,std::vector<std::string> const&,void>();
            }
            std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<std::string>,std::allocator<mlcore::ComparisonPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,mlcore::ComparisonOperator,std::string const&,void>((uint64_t *)&v530, (uint64_t)v208, 0, (uint64_t)v505[0]);
            *(_OWORD *)__p = v530;
            long long v530 = 0uLL;
            std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(v458, v209, (long long *)__p);
            if (__p[1]) {
              std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
            }
            if (*((void *)&v530 + 1)) {
              std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v530 + 1));
            }
            __p[1] = 0;
            __p[0] = 0;
            uint64_t v496 = 0;
            v224 = (mlcore *)std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(__p, v514, (uint64_t)v515, (v515 - (unsigned char *)v514) >> 3);
            v527 = (void **)mlcore::AlbumPropertyPersistentID(v224);
            std::vector<mlcore::ModelPropertyBase *>::push_back[abi:ne180100](__p, &v527);
            v527 = v208;
            std::vector<mlcore::ModelPropertyBase *>::push_back[abi:ne180100](__p, &v527);
            v225 = v458[0];
            uint64_t v352 = 0;
            v350 = 0;
            v351 = 0;
            v226 = __p[0];
            std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v350, __p[0], (uint64_t)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 3);
            mlcore::PropertiesQuery::setPropertiesToFetch();
            if (v350)
            {
              v351 = v350;
              operator delete(v350);
            }
            v227 = *(void **)(v289 + 272);
            v228 = (std::__shared_weak_count *)v458[1];
            v348 = v225;
            v349 = (std::__shared_weak_count *)v458[1];
            if (v458[1]) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)v458[1] + 1, 1uLL, memory_order_relaxed);
            }
            v339[0] = MEMORY[0x1E4F143A8];
            v339[1] = 3221225472;
            v339[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_4_44;
            v339[3] = &unk_1E57F57E0;
            v347 = v208;
            v340 = v263;
            id v341 = v202;
            v342 = v203;
            v343 = v204;
            uint64_t v344 = v289;
            v345 = v205;
            v229 = v272;
            v346 = v229;
            [v227 performCoreQuery:&v348 withCompletion:v339];
            if (v349) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v349);
            }

            if (v226) {
              operator delete(v226);
            }
            if (v228) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v228);
            }

            v223 = v361;
            if (v361)
            {
              v362 = v361;
LABEL_318:
              operator delete(v223);
            }
LABEL_319:
            __p[0] = v258;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
            __p[0] = v505;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
          }
          else
          {
            v287[2]();
          }

          if (v396)
          {
            v397 = v396;
            operator delete(v396);
          }
          std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)v280);

LABEL_323:
          std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&v508);
          std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&v511);
          v230 = v290;
LABEL_324:
          std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)v230);
          goto LABEL_180;
        }
      }
    }
    if (![*(id *)(v289 + 280) isSubclassOfClass:objc_opt_class()])
    {
      uint64_t v199 = *(void *)(v289 + 304);
      if (v199) {
        (*(void (**)(uint64_t, void, void))(v199 + 16))(v199, 0, 0);
      }
      [(id)v289 finish];
      goto LABEL_181;
    }
    v267 = (MPStoreLibraryMappingResponse *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v512 = 0u;
    long long v511 = 0u;
    int v513 = 1065353216;
    long long v509 = 0u;
    long long v508 = 0u;
    int v510 = 1065353216;
    id objb = [MEMORY[0x1E4F1CA48] array];
    long long v337 = 0u;
    long long v338 = 0u;
    long long v335 = 0u;
    long long v336 = 0u;
    id v285 = *(id *)(v289 + 288);
    uint64_t v148 = [v285 countByEnumeratingWithState:&v335 objects:v523 count:16];
    if (v148)
    {
      uint64_t v149 = *(void *)v336;
      do
      {
        for (uint64_t k = 0; k != v148; ++k)
        {
          if (*(void *)v336 != v149) {
            objc_enumerationMutation(v285);
          }
          v151 = *(void **)(*((void *)&v335 + 1) + 8 * k);
          v152 = [v151 universalStore];
          uint64_t v153 = [v152 adamID];

          if (v153) {
            std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v511, v153, v153);
          }
          v154 = [v151 universalStore];
          v155 = [v154 formerAdamIDs];

          long long v333 = 0u;
          long long v334 = 0u;
          long long v331 = 0u;
          long long v332 = 0u;
          id v156 = v155;
          uint64_t v157 = [v156 countByEnumeratingWithState:&v331 objects:v522 count:16];
          if (v157)
          {
            uint64_t v158 = *(void *)v332;
            do
            {
              for (uint64_t m = 0; m != v157; ++m)
              {
                if (*(void *)v332 != v158) {
                  objc_enumerationMutation(v156);
                }
                uint64_t v160 = [*(id *)(*((void *)&v331 + 1) + 8 * m) longLongValue];
                if (v160) {
                  std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v511, v160, v160);
                }
              }
              uint64_t v157 = [v156 countByEnumeratingWithState:&v331 objects:v522 count:16];
            }
            while (v157);
          }

          v161 = [v151 personalizedStore];
          v162 = [v161 cloudArtistID];

          if ([v162 length])
          {
            std::string::basic_string[abi:ne180100]<0>(v290, (char *)[v162 UTF8String]);
            std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>((uint64_t)&v508, (unsigned __int8 *)v290, (uint64_t)v290);
            if (SBYTE7(v291) < 0) {
              operator delete(v290[0]);
            }
          }
          else if (!v153)
          {
            goto LABEL_208;
          }
          [(MPStoreLibraryMappingResponse *)v267 addObject:v151];
LABEL_208:
        }
        uint64_t v148 = [v285 countByEnumeratingWithState:&v335 objects:v523 count:16];
      }
      while (v148);
    }

    long long v329 = 0u;
    long long v330 = 0u;
    long long v327 = 0u;
    long long v328 = 0u;
    id v257 = *(id *)(v289 + 296);
    uint64_t v163 = [v257 countByEnumeratingWithState:&v327 objects:v521 count:16];
    if (!v163)
    {
LABEL_242:

      if ([(id)v289 isCancelled])
      {
        v183 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
        ((void (**)(void, void, MPStoreLibraryMappingResponse *))v266)[2](v266, 0, v183);
      }
      else
      {
        v234 = objc_alloc_init(MPStoreLibraryMappingResponse);
        v290[0] = 0;
        v290[1] = v290;
        *(void *)&long long v291 = 0x3032000000;
        *((void *)&v291 + 1) = __Block_byref_object_copy__37273;
        v292 = __Block_byref_object_dispose__37274;
        v308[0] = MEMORY[0x1E4F143A8];
        v308[1] = 3321888768;
        v308[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_45;
        v308[3] = &unk_1EE673938;
        v308[4] = v289;
        v235 = v266;
        id v314 = v235;
        v236 = v267;
        v309 = v236;
        id v237 = objb;
        id v310 = v237;
        id v288 = (id)std::unordered_set<long long>::unordered_set((uint64_t)&v315, (uint64_t)&v511);
        v316 = 0;
        v317 = 0;
        uint64_t v318 = 0;
        std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v316, v514, (uint64_t)v515, (v515 - (unsigned char *)v514) >> 3);
        id v238 = v264;
        id v311 = v238;
        v239 = v265;
        v312 = v239;
        v183 = v234;
        v313 = v183;
        id v293 = (id)MEMORY[0x19971E0F0](v308);
        if ((-[MPStoreLibraryMappingResponse count](v236, "count") || [v237 count])
          && *((void *)&v509 + 1))
        {
          *(void *)&long long v506 = 0;
          v505[0] = 0;
          v505[1] = 0;
          unint64_t v240 = 0;
          if ((void)v509)
          {
            v241 = (void *)v509;
            do
            {
              ++v240;
              v241 = (void *)*v241;
            }
            while (v241);
          }
          v242 = std::vector<std::string>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<std::string,void *> *>,std::__hash_const_iterator<std::__hash_node<std::string,void *> *>>(v505, (uint64_t *)v509, v240);
          v243 = (mlcore *)MEMORY[0x19971D560](v242);
          uint64_t v244 = (uint64_t)v243;
          if (*((void *)&v509 + 1) >= 2uLL)
          {
            mlcore::ArtistPropertyCloudUniversalLibraryID(v243);
            std::allocate_shared[abi:ne180100]<mlcore::InPredicate<std::string>,std::allocator<mlcore::InPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,std::vector<std::string> const&,void>();
          }
          uint64_t v245 = mlcore::ArtistPropertyCloudUniversalLibraryID(v243);
          std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<std::string>,std::allocator<mlcore::ComparisonPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,mlcore::ComparisonOperator,std::string const&,void>((uint64_t *)&v530, v245, 0, (uint64_t)v505[0]);
          *(_OWORD *)__p = v530;
          long long v530 = 0uLL;
          std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(v458, v244, (long long *)__p);
          if (__p[1]) {
            std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
          }
          if (*((void *)&v530 + 1)) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v530 + 1));
          }
          __p[1] = 0;
          __p[0] = 0;
          uint64_t v496 = 0;
          v246 = (mlcore *)std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(__p, v514, (uint64_t)v515, (v515 - (unsigned char *)v514) >> 3);
          v527 = (void **)mlcore::ArtistPropertyPersistentID(v246);
          std::vector<mlcore::ModelPropertyBase *>::push_back[abi:ne180100](__p, &v527);
          v527 = (void **)mlcore::ArtistPropertyCloudUniversalLibraryID(v247);
          std::vector<mlcore::ModelPropertyBase *>::push_back[abi:ne180100](__p, &v527);
          v248 = v458[0];
          v306 = 0;
          uint64_t v307 = 0;
          v305 = 0;
          v249 = __p[0];
          std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v305, __p[0], (uint64_t)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 3);
          mlcore::PropertiesQuery::setPropertiesToFetch();
          if (v305)
          {
            v306 = v305;
            operator delete(v305);
          }
          v250 = *(void **)(v289 + 272);
          v251 = (std::__shared_weak_count *)v458[1];
          v303 = v248;
          v304 = (std::__shared_weak_count *)v458[1];
          if (v458[1]) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)v458[1] + 1, 1uLL, memory_order_relaxed);
          }
          v294[0] = MEMORY[0x1E4F143A8];
          v294[1] = 3221225472;
          v294[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_49;
          v294[3] = &unk_1E57F5830;
          v295 = v236;
          id v296 = v238;
          v297 = v239;
          v298 = v183;
          id v299 = v237;
          uint64_t v300 = v289;
          v301 = v235;
          v302 = v290;
          [v250 performCoreQuery:&v303 withCompletion:v294];
          if (v304) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v304);
          }

          if (v249) {
            operator delete(v249);
          }
          if (v251) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v251);
          }
          __p[0] = v505;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
        }
        else
        {
          (*(void (**)(void))(*((void *)v290[1] + 5) + 16))();
        }
        _Block_object_dispose(v290, 8);

        if (v316)
        {
          v317 = v316;
          operator delete(v316);
        }
        std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)v288);
      }
      std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&v508);
      v230 = (void **)&v511;
      goto LABEL_324;
    }
    uint64_t v261 = *(void *)v328;
LABEL_212:
    uint64_t v164 = 0;
    uint64_t v255 = v163;
    while (1)
    {
      if (*(void *)v328 != v261) {
        objc_enumerationMutation(v257);
      }
      v165 = *(void **)(*((void *)&v327 + 1) + 8 * v164);
      id v286 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v325 = 0u;
      long long v326 = 0u;
      long long v323 = 0u;
      long long v324 = 0u;
      v166 = [v165 allKeys];
      id v279 = v166;
      uint64_t v167 = [v166 countByEnumeratingWithState:&v323 objects:v520 count:16];
      uint64_t v270 = v164;
      if (v167) {
        break;
      }
LABEL_238:

      if ([v286 count]) {
        [objb addObject:v286];
      }

      uint64_t v164 = v270 + 1;
      if (v270 + 1 == v255)
      {
        uint64_t v163 = [v257 countByEnumeratingWithState:&v327 objects:v521 count:16];
        if (!v163) {
          goto LABEL_242;
        }
        goto LABEL_212;
      }
    }
    uint64_t v168 = *(void *)v324;
LABEL_217:
    uint64_t v169 = 0;
    while (1)
    {
      if (*(void *)v324 != v168) {
        objc_enumerationMutation(v279);
      }
      v170 = *(void **)(*((void *)&v323 + 1) + 8 * v169);
      v171 = [v170 universalStore];
      uint64_t v172 = [v171 adamID];

      if (v172) {
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v511, v172, v172);
      }
      v173 = [v170 universalStore];
      v174 = [v173 formerAdamIDs];

      long long v321 = 0u;
      long long v322 = 0u;
      long long v319 = 0u;
      long long v320 = 0u;
      id v175 = v174;
      uint64_t v176 = [v175 countByEnumeratingWithState:&v319 objects:v519 count:16];
      if (v176)
      {
        uint64_t v177 = *(void *)v320;
        do
        {
          for (uint64_t n = 0; n != v176; ++n)
          {
            if (*(void *)v320 != v177) {
              objc_enumerationMutation(v175);
            }
            uint64_t v179 = [*(id *)(*((void *)&v319 + 1) + 8 * n) longLongValue];
            if (v179) {
              std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v511, v179, v179);
            }
          }
          uint64_t v176 = [v175 countByEnumeratingWithState:&v319 objects:v519 count:16];
        }
        while (v176);
      }

      v180 = [v170 personalizedStore];
      v181 = [v180 cloudArtistID];

      if ([v181 length]) {
        break;
      }
      if (v172) {
        goto LABEL_235;
      }
LABEL_236:

      if (++v169 == v167)
      {
        v166 = v279;
        uint64_t v167 = [v279 countByEnumeratingWithState:&v323 objects:v520 count:16];
        if (!v167) {
          goto LABEL_238;
        }
        goto LABEL_217;
      }
    }
    std::string::basic_string[abi:ne180100]<0>(v290, (char *)[v181 UTF8String]);
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>((uint64_t)&v508, (unsigned __int8 *)v290, (uint64_t)v290);
    if (SBYTE7(v291) < 0) {
      operator delete(v290[0]);
    }
LABEL_235:
    v182 = [v165 objectForKey:v170];
    [v286 setObject:v182 forKey:v170];

    goto LABEL_236;
  }
  v267 = objc_alloc_init(MPStoreLibraryMappingResponse);
  id v268 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v277 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  *(_OWORD *)v290 = 0u;
  long long v291 = 0u;
  LODWORD(v292) = 1065353216;
  long long v512 = 0u;
  long long v511 = 0u;
  int v513 = 1065353216;
  long long v509 = 0u;
  long long v508 = 0u;
  int v510 = 1065353216;
  long long v506 = 0u;
  *(_OWORD *)v505 = 0u;
  int v507 = 1065353216;
  long long v504 = 0u;
  long long v503 = 0u;
  long long v502 = 0u;
  long long v501 = 0u;
  obuint64_t j = *(id *)(v289 + 288);
  uint64_t v11 = [obj countByEnumeratingWithState:&v501 objects:v533 count:16];
  if (!v11) {
    goto LABEL_51;
  }
  id v281 = *(id *)v502;
  do
  {
    for (uint64_t ii = 0; ii != v11; ++ii)
    {
      if (*(id *)v502 != v281) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v501 + 1) + 8 * ii);
      v14 = [v13 library];
      v15 = [v14 databaseID];
      v16 = [*(id *)(v289 + 272) library];
      v17 = [v16 uniqueIdentifier];
      if ([v15 isEqualToString:v17])
      {
        BOOL v18 = [v14 persistentID] == 0;

        if (!v18) {
          goto LABEL_49;
        }
      }
      else
      {
      }
      v19 = [v13 universalStore];
      uint64_t v20 = [v19 subscriptionAdamID];

      BOOL v21 = v20 != 0;
      if (v20) {
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v290, v20, v20);
      }
      v22 = [v13 universalStore];
      uint64_t v23 = [v22 purchasedAdamID];

      if (v23)
      {
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v511, v23, v23);
        BOOL v21 = 1;
      }
      v24 = [v13 universalStore];
      uint64_t v25 = [v24 adamID];

      if (v25)
      {
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v290, v25, v25);
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v511, v25, v25);
        BOOL v21 = 1;
      }
      v26 = [v13 universalStore];
      v27 = [v26 formerAdamIDs];

      long long v500 = 0u;
      long long v499 = 0u;
      long long v498 = 0u;
      long long v497 = 0u;
      id v28 = v27;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v497 objects:v532 count:16];
      if (v29)
      {
        uint64_t v30 = *(void *)v498;
        do
        {
          for (uint64_t jj = 0; jj != v29; ++jj)
          {
            if (*(void *)v498 != v30) {
              objc_enumerationMutation(v28);
            }
            uint64_t v32 = [*(id *)(*((void *)&v497 + 1) + 8 * jj) longLongValue];
            if (v32)
            {
              std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v511, v32, v32);
              std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v290, v32, v32);
            }
          }
          uint64_t v29 = [v28 countByEnumeratingWithState:&v497 objects:v532 count:16];
        }
        while (v29);
      }

      v33 = [v13 personalizedStore];
      uint64_t v34 = [v33 cloudID];

      if (v34)
      {
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v508, v34, v34);
        BOOL v21 = 1;
      }
      v35 = [v13 universalStore];
      v36 = [v35 universalCloudLibraryID];

      if ([v36 length])
      {
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v36 UTF8String]);
        std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>((uint64_t)v505, (unsigned __int8 *)__p, (uint64_t)__p);
        if (SHIBYTE(v496) < 0) {
          operator delete(__p[0]);
        }
LABEL_46:
        v37 = [v277 objectForKey:v13];
        BOOL v38 = v37 == 0;

        if (v38)
        {
          [v268 addObject:v13];
          v39 = [MEMORY[0x1E4F1CA98] null];
          [v277 setObject:v39 forKey:v13];
        }
        goto LABEL_48;
      }
      if (v21) {
        goto LABEL_46;
      }
LABEL_48:

LABEL_49:
    }
    uint64_t v11 = [obj countByEnumeratingWithState:&v501 objects:v533 count:16];
  }
  while (v11);
LABEL_51:

  if ([(id)v289 isCancelled])
  {
    v40 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    ((void (**)(void, void, void *))v266)[2](v266, 0, v40);

    goto LABEL_179;
  }
  v485[0] = MEMORY[0x1E4F143A8];
  v485[1] = 3321888768;
  v485[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2;
  v485[3] = &unk_1EE673890;
  v485[4] = v289;
  v41 = v266;
  id v490 = v41;
  id v42 = v268;
  id v486 = v42;
  uint64_t v254 = std::unordered_set<long long>::unordered_set((uint64_t)&v491, (uint64_t)v290);
  v493 = 0;
  v492 = 0;
  uint64_t v494 = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v492, v514, (uint64_t)v515, (v515 - (unsigned char *)v514) >> 3);
  id v43 = v264;
  id v487 = v43;
  v44 = v265;
  v488 = v44;
  v45 = v267;
  v489 = v45;
  id objc = (id)MEMORY[0x19971E0F0](v485);
  v474[0] = MEMORY[0x1E4F143A8];
  v474[1] = 3321888768;
  v474[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_29;
  v474[3] = &unk_1EE6738C8;
  v474[4] = v289;
  v46 = v41;
  id v479 = v46;
  id v47 = v42;
  id v475 = v47;
  id v256 = (id)std::unordered_set<long long>::unordered_set((uint64_t)&v481, (uint64_t)&v511);
  v483 = 0;
  v482 = 0;
  uint64_t v484 = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v482, v514, (uint64_t)v515, (v515 - (unsigned char *)v514) >> 3);
  id v48 = v43;
  id v476 = v48;
  v49 = v44;
  v477 = v49;
  v50 = v45;
  v478 = v50;
  id v253 = objc;
  id v480 = v253;
  v259 = (void *)MEMORY[0x19971E0F0](v474);
  v463[0] = MEMORY[0x1E4F143A8];
  v463[1] = 3321888768;
  v463[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_31;
  v463[3] = &unk_1EE6738C8;
  v463[4] = v289;
  v51 = v46;
  id v468 = v51;
  id v52 = v47;
  id v464 = v52;
  std::unordered_set<long long>::unordered_set((uint64_t)v470, (uint64_t)&v508);
  v472 = 0;
  v471 = 0;
  uint64_t v473 = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v471, v514, (uint64_t)v515, (v515 - (unsigned char *)v514) >> 3);
  id v53 = v48;
  id v465 = v53;
  v54 = v49;
  v466 = v54;
  v55 = v50;
  v467 = v55;
  id v56 = v259;
  id v469 = v56;
  v282 = (void (**)(void))MEMORY[0x19971E0F0](v463);
  if ([v52 count] && *((void *)&v506 + 1))
  {
    uint64_t v496 = 0;
    __p[0] = 0;
    __p[1] = 0;
    unint64_t v57 = 0;
    if ((void)v506)
    {
      v58 = (void *)v506;
      do
      {
        ++v57;
        v58 = (void *)*v58;
      }
      while (v58);
    }
    v59 = std::vector<std::string>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<std::string,void *> *>,std::__hash_const_iterator<std::__hash_node<std::string,void *> *>>(__p, (uint64_t *)v506, v57);
    id v252 = v51;
    v60 = (mlcore *)MEMORY[0x19971D490](v59);
    uint64_t v61 = (uint64_t)v60;
    id v62 = v56;
    if (0xAAAAAAAAAAAAAAABLL * (((char *)__p[1] - (char *)__p[0]) >> 3) >= 2)
    {
      mlcore::ItemPropertyStoreCloudUniversalLibraryID(v60);
      std::allocate_shared[abi:ne180100]<mlcore::InPredicate<std::string>,std::allocator<mlcore::InPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,std::vector<std::string> const&,void>();
    }
    uint64_t v63 = mlcore::ItemPropertyStoreCloudUniversalLibraryID(v60);
    std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<std::string>,std::allocator<mlcore::ComparisonPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,mlcore::ComparisonOperator,std::string const&,void>((uint64_t *)&v460, v63, 0, (uint64_t)__p[0]);
    *(_OWORD *)v458 = v460;
    long long v460 = 0uLL;
    std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(&v461, v61, (long long *)v458);
    if (v458[1]) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v458[1]);
    }
    if (*((void *)&v460 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v460 + 1));
    }
    v458[1] = 0;
    v458[0] = 0;
    v459 = 0;
    v78 = (mlcore *)std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(v458, v514, (uint64_t)v515, (v515 - (unsigned char *)v514) >> 3);
    unint64_t v79 = mlcore::ItemPropertyPersistentID(v78);
    unint64_t v80 = v79;
    v81 = (char *)v458[1];
    v82 = v459;
    if (v458[1] >= v459)
    {
      v84 = (char *)v458[0];
      int64_t v85 = ((char *)v458[1] - (char *)v458[0]) >> 3;
      unint64_t v86 = v85 + 1;
      if ((unint64_t)(v85 + 1) >> 61) {
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      }
      if (((char *)v459 - (char *)v458[0]) >> 2 > v86) {
        unint64_t v86 = ((char *)v459 - (char *)v458[0]) >> 2;
      }
      if ((unint64_t)((char *)v459 - (char *)v458[0]) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v79 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v79 = v86;
      }
      if (v79) {
        unint64_t v79 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v79);
      }
      else {
        uint64_t v87 = 0;
      }
      v129 = (uint64_t *)(v79 + 8 * v85);
      v82 = (uint64_t *)(v79 + 8 * v87);
      uint64_t *v129 = v80;
      v83 = v129 + 1;
      if (v81 != v84)
      {
        do
        {
          uint64_t v130 = *((void *)v81 - 1);
          v81 -= 8;
          *--v129 = v130;
        }
        while (v81 != v84);
        v81 = (char *)v458[0];
      }
      v458[0] = v129;
      v459 = (uint64_t *)(v79 + 8 * v87);
      if (v81) {
        operator delete(v81);
      }
    }
    else
    {
      *(void *)v458[1] = v79;
      v83 = (uint64_t *)(v81 + 8);
    }
    v458[1] = v83;
    uint64_t v131 = mlcore::ItemPropertyStoreCloudUniversalLibraryID((mlcore *)v79);
    uint64_t v132 = v131;
    if (v83 < v82)
    {
      uint64_t *v83 = v131;
      v133 = v83 + 1;
      id v56 = v62;
      v134 = v252;
      goto LABEL_161;
    }
    v135 = (uint64_t *)v458[0];
    uint64_t v136 = ((char *)v83 - (char *)v458[0]) >> 3;
    unint64_t v137 = v136 + 1;
    if ((unint64_t)(v136 + 1) >> 61) {
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    }
    if (((char *)v82 - (char *)v458[0]) >> 2 > v137) {
      unint64_t v137 = ((char *)v82 - (char *)v458[0]) >> 2;
    }
    if ((unint64_t)((char *)v82 - (char *)v458[0]) >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v138 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v138 = v137;
    }
    if (v138) {
      unint64_t v138 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v138);
    }
    else {
      uint64_t v139 = 0;
    }
    v140 = (uint64_t *)(v138 + 8 * v136);
    uint64_t *v140 = v132;
    v133 = v140 + 1;
    id v56 = v62;
    if (v83 == v135)
    {
      v458[0] = v140;
      v458[1] = v140 + 1;
      v459 = (uint64_t *)(v138 + 8 * v139);
      v134 = v252;
    }
    else
    {
      v134 = v252;
      do
      {
        uint64_t v141 = *--v83;
        *--v140 = v141;
      }
      while (v83 != v135);
      v83 = (uint64_t *)v458[0];
      v458[0] = v140;
      v458[1] = v133;
      v459 = (uint64_t *)(v138 + 8 * v139);
      if (!v83)
      {
LABEL_161:
        v458[1] = v133;
        uint64_t v457 = 0;
        v455 = 0;
        v456 = 0;
        std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v455, v458[0], (uint64_t)v133, (int64_t)((uint64_t)v133 - (unint64_t)v458[0]) >> 3);
        mlcore::PropertiesQuery::setPropertiesToFetch();
        v142 = (mlcore *)v455;
        if (v455)
        {
          v456 = v455;
          operator delete(v455);
        }
        mlcore::ItemPropertyInMyLibrary(v142);
        mlcore::SortDescriptor::SortDescriptor();
        long long v530 = 0uLL;
        v531 = 0;
        *(void *)&long long v518 = &v530;
        BYTE8(v518) = 0;
        v143 = operator new(0x18uLL);
        *(void *)&long long v530 = v143;
        v531 = (char *)(v143 + 3);
        v144 = v528;
        void *v143 = MEMORY[0x1E4F76A98] + 16;
        v143[1] = v144;
        *((_DWORD *)v143 + 4) = v529;
        *((void *)&v530 + 1) = v143 + 3;
        uint64_t v145 = v461;
        mlcore::PropertiesQuery::setSortDescriptors();
        v146 = *(void **)(v289 + 272);
        v147 = v462;
        uint64_t v453 = v145;
        v454 = v462;
        if (v462) {
          atomic_fetch_add_explicit(&v462->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        v445[0] = MEMORY[0x1E4F143A8];
        v445[1] = 3221225472;
        v445[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_3_33;
        v445[3] = &unk_1E57F57B8;
        id v446 = v52;
        id v447 = v53;
        v448 = v54;
        v449 = v55;
        uint64_t v450 = v289;
        id v451 = v134;
        v452 = v282;
        [v146 performCoreQuery:&v453 withCompletion:v445];
        if (v454) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v454);
        }

        v527 = (void **)&v530;
        std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&v527);
        if (v458[0]) {
          operator delete(v458[0]);
        }
        if (v147) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v147);
        }
        v458[0] = __p;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v458);
        goto LABEL_172;
      }
    }
    operator delete(v83);
    goto LABEL_161;
  }
  v282[2]();
LABEL_172:

  if (v471)
  {
    v472 = v471;
    operator delete(v471);
  }
  std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)v470);

  if (v482)
  {
    v483 = v482;
    operator delete(v482);
  }
  std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)v256);

  if (v492)
  {
    v493 = v492;
    operator delete(v492);
  }
  std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table(v254);

LABEL_179:
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v505);
  std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)&v508);
  std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)&v511);
  std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)v290);

LABEL_180:
LABEL_181:

  if (v514)
  {
    v515 = v514;
    operator delete(v514);
  }
  v4 = v264;
LABEL_184:
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_31(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v2 = *(void *)(a1 + 72);
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  else
  {
    if ([*(id *)(a1 + 40) count] && *(void *)(a1 + 112))
    {
      uint64_t v3 = *(void **)(a1 + 104);
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      v9 = 0;
      unint64_t v4 = 0;
      if (v3)
      {
        uint64_t v5 = v3;
        do
        {
          ++v4;
          uint64_t v5 = (void *)*v5;
        }
        while (v5);
      }
      v6 = std::vector<long long>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<long long,void *> *>,std::__hash_const_iterator<std::__hash_node<long long,void *> *>>((char *)&v9, v3, v4);
      v7 = (mlcore *)MEMORY[0x19971D490](v6);
      if ((unint64_t)(v10 - (void)v9) < 0x10)
      {
        mlcore::ItemPropertyStoreCloudID(v7);
        std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>();
      }
      mlcore::ItemPropertyStoreCloudID(v7);
      std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>();
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_29(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v2 = *(void *)(a1 + 72);
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  else
  {
    if ([*(id *)(a1 + 40) count] && *(void *)(a1 + 112))
    {
      uint64_t v3 = *(void **)(a1 + 104);
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      v9 = 0;
      unint64_t v4 = 0;
      if (v3)
      {
        uint64_t v5 = v3;
        do
        {
          ++v4;
          uint64_t v5 = (void *)*v5;
        }
        while (v5);
      }
      v6 = std::vector<long long>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<long long,void *> *>,std::__hash_const_iterator<std::__hash_node<long long,void *> *>>((char *)&v9, v3, v4);
      v7 = (mlcore *)MEMORY[0x19971D490](v6);
      if ((unint64_t)(v10 - (void)v9) < 0x10)
      {
        mlcore::ItemPropertyStoreID(v7);
        std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>();
      }
      mlcore::ItemPropertyStoreID(v7);
      std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>();
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_albumArtistNamesToIdentifierSets, 0);
  objc_storeStrong((id *)&self->_identifierSets, 0);

  objc_storeStrong((id *)&self->_libraryView, 0);
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*a2)
  {
    v6 = (std::__shared_weak_count *)a2[1];
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v7 = operator new(0x30uLL);
    void *v7 = &unk_1EE6729D0;
    v7[1] = a1 + 32;
    v7[2] = a1 + 40;
    v7[3] = a1 + 48;
    v7[4] = a1 + 56;
    v7[5] = a1 + 64;
    v10[3] = v7;
    mlcore::PropertiesQueryResult::enumerateResults();
    std::__function::__value_func<void ()(mlcore::PropertyCache const&,BOOL &)>::~__value_func[abi:ne180100](v10);
  }
  else
  {
    v6 = 0;
  }
  if ([*(id *)(a1 + 64) isCancelled])
  {
    uint64_t v8 = *(void *)(a1 + 72);
    v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_34(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v2 = *(void *)(a1 + 72);
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  else
  {
    if ([*(id *)(a1 + 40) count] && *(void *)(a1 + 112))
    {
      uint64_t v3 = *(void **)(a1 + 104);
      uint64_t v11 = 0;
      uint64_t v10 = 0;
      if (v3)
      {
        unint64_t v4 = -1;
        id v5 = *(void **)(a1 + 104);
        do
        {
          unint64_t v6 = v4;
          id v5 = (void *)*v5;
          ++v4;
        }
        while (v5);
        if (v4 >= 0x1FFFFFFFFFFFFFFFLL) {
          std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
        }
        v7 = std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v6 + 2);
        uint64_t v10 = v7;
        do
        {
          *v7++ = v3[2];
          uint64_t v3 = (void *)*v3;
        }
        while (v3);
        uint64_t v11 = (char *)v7;
      }
      uint64_t v8 = (mlcore *)MEMORY[0x19971D610]();
      if ((unint64_t)(v11 - v10) < 0x10)
      {
        mlcore::PlaylistPropertyStoreCloudID(v8);
        std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>();
      }
      mlcore::PlaylistPropertyStoreCloudID(v8);
      std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>();
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_37(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v2 = *(void *)(a1 + 72);
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  else
  {
    if ([*(id *)(a1 + 40) count] && *(void *)(a1 + 104))
    {
      uint64_t v3 = *(void **)(a1 + 96);
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v8 = 0;
      unint64_t v4 = 0;
      if (v3)
      {
        id v5 = v3;
        do
        {
          ++v4;
          id v5 = (void *)*v5;
        }
        while (v5);
      }
      unint64_t v6 = std::vector<long long>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<long long,void *> *>,std::__hash_const_iterator<std::__hash_node<long long,void *> *>>((char *)&v8, v3, v4);
      if (v9 - v8 == 8)
      {
        mlcore::ItemPropertyStorePlaylistID((mlcore *)v6);
        std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator &,long long const&,mlcore::ComparisonOptions &,void>();
      }
      mlcore::ItemPropertyStorePlaylistID((mlcore *)v6);
      std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>();
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_4(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v2 = *(void *)(a1 + 72);
    id v40 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);

    return;
  }
  if (![*(id *)(a1 + 40) count] || !*(void *)(a1 + 104))
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    return;
  }
  uint64_t v3 = *(uint64_t **)(a1 + 96);
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v41 = 0;
  unint64_t v4 = 0;
  if (v3)
  {
    id v5 = v3;
    do
    {
      ++v4;
      id v5 = (uint64_t *)*v5;
    }
    while (v5);
  }
  unint64_t v6 = std::vector<std::string>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<std::string,void *> *>,std::__hash_const_iterator<std::__hash_node<std::string,void *> *>>(&v41, v3, v4);
  id v7 = (mlcore *)MEMORY[0x19971D610](v6);
  uint64_t v8 = (uint64_t)v7;
  if (0xAAAAAAAAAAAAAAABLL * ((v42 - v41) >> 3) >= 2)
  {
    mlcore::PlaylistPropertyCloudGlobalID(v7);
    std::allocate_shared[abi:ne180100]<mlcore::InPredicate<std::string>,std::allocator<mlcore::InPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,std::vector<std::string> const&,void>();
  }
  uint64_t v9 = mlcore::PlaylistPropertyCloudGlobalID(v7);
  std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<std::string>,std::allocator<mlcore::ComparisonPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,mlcore::ComparisonOperator,std::string const&,void>((uint64_t *)&v61, v9, 0, v41);
  long long v59 = v61;
  long long v61 = 0uLL;
  std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(&v62, v8, &v59);
  if (*((void *)&v59 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v59 + 1));
  }
  if (*((void *)&v61 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v61 + 1));
  }
  long long v59 = 0uLL;
  unint64_t v60 = 0;
  uint64_t v10 = (mlcore *)std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v59, *(const void **)(a1 + 120), *(void *)(a1 + 128), (uint64_t)(*(void *)(a1 + 128) - *(void *)(a1 + 120)) >> 3);
  unint64_t v11 = mlcore::PlaylistPropertyPersistentID(v10);
  unint64_t v12 = v11;
  v13 = (char *)*((void *)&v59 + 1);
  unint64_t v14 = v60;
  if (*((void *)&v59 + 1) >= v60)
  {
    v16 = (char *)v59;
    uint64_t v17 = (uint64_t)(*((void *)&v59 + 1) - v59) >> 3;
    unint64_t v18 = v17 + 1;
    if ((unint64_t)(v17 + 1) >> 61) {
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    }
    if ((uint64_t)(v60 - v59) >> 2 > v18) {
      unint64_t v18 = (uint64_t)(v60 - v59) >> 2;
    }
    if (v60 - (unint64_t)v59 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v18;
    }
    if (v11) {
      unint64_t v11 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v11);
    }
    else {
      uint64_t v19 = 0;
    }
    uint64_t v20 = (unint64_t *)(v11 + 8 * v17);
    unint64_t v14 = v11 + 8 * v19;
    *uint64_t v20 = v12;
    v15 = (uint64_t *)(v20 + 1);
    if (v13 != v16)
    {
      do
      {
        unint64_t v21 = *((void *)v13 - 1);
        v13 -= 8;
        *--uint64_t v20 = v21;
      }
      while (v13 != v16);
      v13 = (char *)v59;
    }
    *(void *)&long long v59 = v20;
    unint64_t v60 = v11 + 8 * v19;
    if (v13) {
      operator delete(v13);
    }
  }
  else
  {
    **((void **)&v59 + 1) = v11;
    v15 = (uint64_t *)(v13 + 8);
  }
  *((void *)&v59 + 1) = v15;
  uint64_t v22 = mlcore::PlaylistPropertyCloudGlobalID((mlcore *)v11);
  uint64_t v23 = v22;
  if ((unint64_t)v15 >= v14)
  {
    uint64_t v25 = (uint64_t *)v59;
    uint64_t v26 = (uint64_t)((uint64_t)v15 - v59) >> 3;
    unint64_t v27 = v26 + 1;
    if ((unint64_t)(v26 + 1) >> 61) {
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    }
    if ((uint64_t)(v14 - v59) >> 2 > v27) {
      unint64_t v27 = (uint64_t)(v14 - v59) >> 2;
    }
    if (v14 - (unint64_t)v59 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v28 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v28 = v27;
    }
    if (v28) {
      unint64_t v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v28);
    }
    else {
      uint64_t v29 = 0;
    }
    uint64_t v30 = (uint64_t *)(v28 + 8 * v26);
    *uint64_t v30 = v23;
    uint64_t v24 = (uint64_t)(v30 + 1);
    if (v15 == v25)
    {
      *(void *)&long long v59 = v30;
      *((void *)&v59 + 1) = v30 + 1;
      unint64_t v60 = v28 + 8 * v29;
    }
    else
    {
      do
      {
        uint64_t v31 = *--v15;
        *--uint64_t v30 = v31;
      }
      while (v15 != v25);
      v15 = (uint64_t *)v59;
      *(void *)&long long v59 = v30;
      *((void *)&v59 + 1) = v24;
      unint64_t v60 = v28 + 8 * v29;
      if (!v15) {
        goto LABEL_51;
      }
    }
    operator delete(v15);
  }
  else
  {
    uint64_t *v15 = v22;
    uint64_t v24 = (uint64_t)(v15 + 1);
  }
LABEL_51:
  *((void *)&v59 + 1) = v24;
  unint64_t v57 = 0;
  uint64_t v58 = 0;
  __p = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, (const void *)v59, v24, (v24 - (uint64_t)v59) >> 3);
  mlcore::PropertiesQuery::setPropertiesToFetch();
  uint64_t v32 = (mlcore *)__p;
  if (__p)
  {
    unint64_t v57 = __p;
    operator delete(__p);
  }
  mlcore::PlaylistPropertyIsHidden(v32);
  mlcore::SortDescriptor::SortDescriptor();
  id v53 = 0;
  v54 = 0;
  v55 = 0;
  id v64 = &v53;
  char v65 = 0;
  v33 = operator new(0x18uLL);
  id v53 = v33;
  v54 = (char *)(v33 + 3);
  v55 = (char *)(v33 + 3);
  uint64_t v34 = v66[1];
  void *v33 = MEMORY[0x1E4F76A98] + 16;
  v33[1] = v34;
  *((_DWORD *)v33 + 4) = v67;
  uint64_t v35 = v62;
  mlcore::PropertiesQuery::setSortDescriptors();
  v36 = *(void **)(*(void *)(a1 + 32) + 272);
  v37 = v63;
  uint64_t v51 = v35;
  id v52 = v63;
  if (v63) {
    atomic_fetch_add_explicit(&v63->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_5;
  v44[3] = &unk_1E57F5790;
  id v45 = *(id *)(a1 + 40);
  id v46 = *(id *)(a1 + 48);
  id v47 = *(id *)(a1 + 56);
  id v38 = *(id *)(a1 + 64);
  uint64_t v39 = *(void *)(a1 + 32);
  id v48 = v38;
  uint64_t v49 = v39;
  id v50 = *(id *)(a1 + 72);
  [v36 performCoreQuery:&v51 withCompletion:v44];
  if (v52) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v52);
  }

  v66[0] = (void **)&v53;
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](v66);
  if ((void)v59) {
    operator delete((void *)v59);
  }
  if (v37) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v37);
  }
  *(void *)&long long v59 = &v41;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v59);
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  v11[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*a2)
  {
    unint64_t v6 = (std::__shared_weak_count *)a2[1];
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id v7 = operator new(0x30uLL);
    void *v7 = &unk_1EE672EF8;
    v7[1] = a1 + 32;
    v7[2] = a1 + 40;
    v7[3] = a1 + 48;
    v7[4] = a1 + 56;
    v7[5] = a1 + 64;
    v11[3] = v7;
    mlcore::PropertiesQueryResult::enumerateResults();
    std::__function::__value_func<void ()(mlcore::PropertyCache const&,BOOL &)>::~__value_func[abi:ne180100](v11);
  }
  else
  {
    unint64_t v6 = 0;
  }
  int v8 = [*(id *)(a1 + 64) isCancelled];
  uint64_t v9 = *(void *)(a1 + 72);
  if (v8)
  {
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
  else
  {
    (*(void (**)(void, void, void))(v9 + 16))(*(void *)(a1 + 72), *(void *)(a1 + 56), 0);
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_3_38(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*a2)
  {
    unint64_t v6 = (std::__shared_weak_count *)a2[1];
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id v7 = *(void **)(*(void *)(a1 + 32) + 272);
    if (v7)
    {
      [v7 mlCoreView];
      long long v8 = v19;
    }
    else
    {
      long long v8 = 0uLL;
    }
    long long v17 = v8;
    long long v19 = 0uLL;
    mlcore::EntityCache::EntityCache();
    if (*((void *)&v17 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v17 + 1));
    }
    if (*((void *)&v19 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v19 + 1));
    }
    mlcore::EntityCache::setCacheDisabled((mlcore::EntityCache *)v18);
    __p = 0;
    v15 = 0;
    uint64_t v16 = 0;
    uint64_t v9 = std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, *(const void **)(a1 + 80), *(void *)(a1 + 88), (uint64_t)(*(void *)(a1 + 88) - *(void *)(a1 + 80)) >> 3);
    MEMORY[0x19971D500](v9);
    mlcore::EntityCache::setPropertiesToFetchForEntityClass();
    if (__p)
    {
      v15 = __p;
      operator delete(__p);
    }
    uint64_t v10 = operator new(0x38uLL);
    void *v10 = &unk_1EE672CE8;
    v10[1] = a1 + 40;
    v10[2] = v18;
    v10[3] = a1 + 48;
    v10[4] = a1 + 56;
    void v10[5] = a1 + 64;
    v10[6] = a1 + 32;
    uint64_t v20 = v10;
    mlcore::PropertiesQueryResult::enumerateResults();
    std::__function::__value_func<void ()(mlcore::PropertyCache const&,BOOL &)>::~__value_func[abi:ne180100](&v19);
    MEMORY[0x19971BD20](v18);
  }
  else
  {
    unint64_t v6 = 0;
  }
  int v11 = [*(id *)(a1 + 32) isCancelled];
  uint64_t v12 = *(void *)(a1 + 72);
  if (v11)
  {
    v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
  }
  else
  {
    (*(void (**)(void, void, void))(v12 + 16))(*(void *)(a1 + 72), *(void *)(a1 + 64), 0);
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v2 = *(void *)(a1 + 72);
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  else
  {
    if ([*(id *)(a1 + 40) count] && *(void *)(a1 + 104))
    {
      uint64_t v3 = *(void **)(a1 + 96);
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v9 = 0;
      unint64_t v4 = 0;
      if (v3)
      {
        id v5 = v3;
        do
        {
          ++v4;
          id v5 = (void *)*v5;
        }
        while (v5);
      }
      unint64_t v6 = std::vector<long long>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<long long,void *> *>,std::__hash_const_iterator<std::__hash_node<long long,void *> *>>((char *)&v9, v3, v4);
      id v7 = (mlcore *)MEMORY[0x19971D490](v6);
      if ((unint64_t)(v10 - (void)v9) < 0x10)
      {
        mlcore::ItemPropertySubscriptionStoreItemID(v7);
        std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>();
      }
      mlcore::ItemPropertySubscriptionStoreItemID(v7);
      std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>();
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  unint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = v6[38];
  if (v7)
  {
    (*(void (**)(void, id, id))(v7 + 16))(v6[38], v8, v5);
    unint64_t v6 = *(void **)(a1 + 32);
  }
  [v6 finishWithError:v5];
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setAlbumArtistNamesToIdentifierSets:(id)a3
{
}

- (NSArray)albumArtistNamesToIdentifierSets
{
  return self->_albumArtistNamesToIdentifierSets;
}

- (NSArray)identifierSets
{
  return self->_identifierSets;
}

- (Class)modelClass
{
  return self->_modelClass;
}

- (MPMediaLibraryView)libraryView
{
  return self->_libraryView;
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_3_33(uint64_t a1, void *a2, void *a3)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*a2)
  {
    unint64_t v6 = (std::__shared_weak_count *)a2[1];
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v7 = operator new(0x30uLL);
    void *v7 = &unk_1EE672B30;
    v7[1] = a1 + 32;
    v7[2] = a1 + 40;
    v7[3] = a1 + 48;
    v7[4] = a1 + 56;
    v7[5] = a1 + 64;
    v10[3] = v7;
    mlcore::PropertiesQueryResult::enumerateResults();
    std::__function::__value_func<void ()(mlcore::PropertyCache const&,BOOL &)>::~__value_func[abi:ne180100](v10);
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ([*(id *)(a1 + 64) isCancelled])
  {
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_39(uint64_t a1)
{
  v50[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (mlcore *)MEMORY[0x19971D490]();
  uint64_t v3 = (uint64_t)v2;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 96) - *(void *)(a1 + 88)) >> 3) >= 2)
  {
    mlcore::ItemPropertyStoreCloudAlbumID(v2);
    std::allocate_shared[abi:ne180100]<mlcore::InPredicate<std::string>,std::allocator<mlcore::InPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,std::vector<std::string> const&,void>();
  }
  uint64_t v4 = mlcore::ItemPropertyStoreCloudAlbumID(v2);
  std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<std::string>,std::allocator<mlcore::ComparisonPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,mlcore::ComparisonOperator,std::string const&,void>((uint64_t *)&v41, v4, 0, *(void *)(a1 + 88));
  long long v49 = v41;
  long long v41 = 0uLL;
  uint64_t v43 = 0;
  v44 = 0;
  uint64_t v42 = 0;
  uint64_t v23 = (void **)&v42;
  LOBYTE(v24) = 0;
  uint64_t v42 = operator new(0x10uLL);
  uint64_t v43 = v42;
  v44 = v42 + 2;
  uint64_t v43 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::Predicate>>,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate>*>((uint64_t)&v44, &v49, v50, v42);
  mlcore::CreateAndPredicate();
  std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(&v45, v3, &v47);
  if (*((void *)&v47 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v47 + 1));
  }
  uint64_t v23 = (void **)&v42;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v23);
  if (*((void *)&v49 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v49 + 1));
  }
  id v5 = (mlcore *)*((void *)&v41 + 1);
  if (*((void *)&v41 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v41 + 1));
  }
  uint64_t v6 = mlcore::ItemPropertyAlbumPersistentID(v5);
  uint64_t v7 = (mlcore *)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(1uLL);
  uint64_t v9 = v8;
  *(void *)uint64_t v7 = v6;
  uint64_t v10 = mlcore::ItemPropertyStoreCloudAlbumID(v7);
  uint64_t v11 = v10;
  if (v9 < 2)
  {
    uint64_t v13 = 2;
    if ((unint64_t)((8 * v9) >> 2) > 2) {
      uint64_t v13 = (8 * v9) >> 2;
    }
    if ((unint64_t)(8 * v9) >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    if (v14) {
      unint64_t v14 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v14);
    }
    uint64_t v15 = 0;
    *(void *)(v14 + 8) = v11;
    uint64_t v12 = v14 + 16;
    do
    {
      *(void *)(v14 + v15) = *(void *)((char *)v7 + v15);
      v15 -= 8;
    }
    while (v15 != -8);
    uint64_t v16 = (mlcore *)v14;
    operator delete(v7);
    uint64_t v7 = v16;
  }
  else
  {
    *((void *)v7 + 1) = v10;
    uint64_t v12 = (uint64_t)v7 + 16;
  }
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  __p = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, v7, v12, (v12 - (uint64_t)v7) >> 3);
  mlcore::PropertiesQuery::setPropertiesToFetch();
  long long v17 = (mlcore *)__p;
  if (__p)
  {
    uint64_t v39 = __p;
    operator delete(__p);
  }
  mlcore::ItemPropertyInMyLibrary(v17);
  mlcore::SortDescriptor::SortDescriptor();
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  *(void *)&long long v49 = &v23;
  BYTE8(v49) = 0;
  unint64_t v18 = (void **)operator new(0x18uLL);
  uint64_t v23 = v18;
  uint64_t v24 = (char *)(v18 + 3);
  uint64_t v25 = (char *)(v18 + 3);
  long long v19 = (void *)*((void *)&v47 + 1);
  *unint64_t v18 = (void *)(MEMORY[0x1E4F76A98] + 16);
  v18[1] = v19;
  *((_DWORD *)v18 + 4) = v48;
  uint64_t v20 = v45;
  mlcore::PropertiesQuery::setSortDescriptors();
  uint64_t v21 = *(void *)(a1 + 32);
  uint64_t v22 = *(void **)(v21 + 272);
  uint64_t v36 = v20;
  v37 = v46;
  if (v46)
  {
    atomic_fetch_add_explicit(&v46->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v21 = *(void *)(a1 + 32);
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3321888768;
  v26[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_40;
  v26[3] = &unk_1EE6737E8;
  v26[4] = v21;
  v33 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v33, *(const void **)(a1 + 112), *(void *)(a1 + 120), (uint64_t)(*(void *)(a1 + 120) - *(void *)(a1 + 112)) >> 3);
  id v27 = *(id *)(a1 + 40);
  id v28 = *(id *)(a1 + 48);
  id v29 = *(id *)(a1 + 56);
  id v30 = *(id *)(a1 + 64);
  id v31 = *(id *)(a1 + 72);
  id v32 = *(id *)(a1 + 80);
  [v22 performCoreQuery:&v36 withCompletion:v26];
  if (v37) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v37);
  }

  if (v33)
  {
    uint64_t v34 = v33;
    operator delete(v33);
  }
  *(void *)&long long v47 = &v23;
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100]((void ***)&v47);
  operator delete(v7);
  if (v46) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v46);
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*a2)
  {
    uint64_t v6 = (std::__shared_weak_count *)a2[1];
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v7 = operator new(0x38uLL);
    void *v7 = &unk_1EE672A28;
    v7[1] = a1 + 88;
    v7[2] = a1 + 32;
    v7[3] = a1 + 40;
    v7[4] = a1 + 48;
    v7[5] = a1 + 56;
    v7[6] = a1 + 64;
    v10[3] = v7;
    mlcore::PropertiesQueryResult::enumerateResults();
    std::__function::__value_func<void ()(mlcore::PropertyCache const&,BOOL &)>::~__value_func[abi:ne180100](v10);
  }
  else
  {
    uint64_t v6 = 0;
  }
  if ([*(id *)(a1 + 64) isCancelled])
  {
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_42(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (mlcore *)MEMORY[0x19971D490]();
  uint64_t v3 = (uint64_t)v2;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 96) - *(void *)(a1 + 88)) >> 3) >= 2)
  {
    mlcore::ItemPropertyStoreCloudAlbumID(v2);
    std::allocate_shared[abi:ne180100]<mlcore::InPredicate<std::string>,std::allocator<mlcore::InPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,std::vector<std::string> const&,void>();
  }
  uint64_t v4 = mlcore::ItemPropertyStoreCloudAlbumID(v2);
  std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<std::string>,std::allocator<mlcore::ComparisonPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,mlcore::ComparisonOperator,std::string const&,void>((uint64_t *)&v40, v4, 0, *(void *)(a1 + 88));
  long long v23 = v40;
  long long v40 = 0uLL;
  std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(&v41, v3, &v23);
  if (*((void *)&v23 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v23 + 1));
  }
  id v5 = (mlcore *)*((void *)&v40 + 1);
  if (*((void *)&v40 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v40 + 1));
  }
  uint64_t v6 = mlcore::ItemPropertyAlbumPersistentID(v5);
  uint64_t v7 = (mlcore *)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(1uLL);
  uint64_t v9 = v8;
  *(void *)uint64_t v7 = v6;
  uint64_t v10 = mlcore::ItemPropertyStoreCloudAlbumID(v7);
  uint64_t v11 = v10;
  if (v9 < 2)
  {
    uint64_t v13 = 2;
    if ((unint64_t)((8 * v9) >> 2) > 2) {
      uint64_t v13 = (8 * v9) >> 2;
    }
    if ((unint64_t)(8 * v9) >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    if (v14) {
      unint64_t v14 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v14);
    }
    uint64_t v15 = 0;
    *(void *)(v14 + 8) = v11;
    uint64_t v12 = v14 + 16;
    do
    {
      *(void *)(v14 + v15) = *(void *)((char *)v7 + v15);
      v15 -= 8;
    }
    while (v15 != -8);
    uint64_t v16 = (mlcore *)v14;
    operator delete(v7);
    uint64_t v7 = v16;
  }
  else
  {
    *((void *)v7 + 1) = v10;
    uint64_t v12 = (uint64_t)v7 + 16;
  }
  id v38 = 0;
  uint64_t v39 = 0;
  v37 = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v37, v7, v12, (v12 - (uint64_t)v7) >> 3);
  mlcore::PropertiesQuery::setPropertiesToFetch();
  long long v17 = v37;
  if (v37)
  {
    id v38 = v37;
    operator delete(v37);
  }
  mlcore::ItemPropertyInMyLibrary(v17);
  mlcore::SortDescriptor::SortDescriptor();
  long long v23 = 0uLL;
  uint64_t v24 = 0;
  uint64_t v43 = &v23;
  char v44 = 0;
  unint64_t v18 = operator new(0x18uLL);
  *(void *)&long long v23 = v18;
  *((void *)&v23 + 1) = v18 + 3;
  uint64_t v24 = (char *)(v18 + 3);
  long long v19 = v45[1];
  *unint64_t v18 = MEMORY[0x1E4F76A98] + 16;
  v18[1] = v19;
  *((_DWORD *)v18 + 4) = v46;
  uint64_t v20 = v41;
  mlcore::PropertiesQuery::setSortDescriptors();
  uint64_t v21 = *(void *)(a1 + 32);
  uint64_t v22 = *(void **)(v21 + 272);
  uint64_t v35 = v20;
  uint64_t v36 = v42;
  if (v42)
  {
    atomic_fetch_add_explicit(&v42->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v21 = *(void *)(a1 + 32);
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3321888768;
  v25[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_3_43;
  v25[3] = &unk_1EE6737E8;
  v25[4] = v21;
  __p = 0;
  v33 = 0;
  uint64_t v34 = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, *(const void **)(a1 + 112), *(void *)(a1 + 120), (uint64_t)(*(void *)(a1 + 120) - *(void *)(a1 + 112)) >> 3);
  id v26 = *(id *)(a1 + 40);
  id v27 = *(id *)(a1 + 48);
  id v28 = *(id *)(a1 + 56);
  id v29 = *(id *)(a1 + 64);
  id v30 = *(id *)(a1 + 72);
  id v31 = *(id *)(a1 + 80);
  [v22 performCoreQuery:&v35 withCompletion:v25];
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }

  if (__p)
  {
    v33 = __p;
    operator delete(__p);
  }
  v45[0] = (void **)&v23;
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](v45);
  operator delete(v7);
  if (v42) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v42);
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_4_44(uint64_t a1, void *a2, void *a3)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*a2)
  {
    uint64_t v6 = (std::__shared_weak_count *)a2[1];
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v7 = operator new(0x38uLL);
    void *v7 = &unk_1EE672A80;
    v7[1] = a1 + 88;
    v7[2] = a1 + 32;
    v7[3] = a1 + 40;
    v7[4] = a1 + 48;
    v7[5] = a1 + 56;
    v7[6] = a1 + 64;
    v10[3] = v7;
    mlcore::PropertiesQueryResult::enumerateResults();
    std::__function::__value_func<void ()(mlcore::PropertyCache const&,BOOL &)>::~__value_func[abi:ne180100](v10);
  }
  else
  {
    uint64_t v6 = 0;
  }
  if ([*(id *)(a1 + 64) isCancelled])
  {
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_45(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v2 = *(void *)(a1 + 80);
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  else
  {
    if (([*(id *)(a1 + 40) count] || objc_msgSend(*(id *)(a1 + 48), "count")) && *(void *)(a1 + 112))
    {
      uint64_t v3 = *(void **)(a1 + 104);
      memset(__p, 0, 24);
      unint64_t v4 = 0;
      if (v3)
      {
        id v5 = v3;
        do
        {
          ++v4;
          id v5 = (void *)*v5;
        }
        while (v5);
      }
      uint64_t v6 = std::vector<long long>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<long long,void *> *>,std::__hash_const_iterator<std::__hash_node<long long,void *> *>>((char *)__p, v3, v4);
      uint64_t v7 = (mlcore *)MEMORY[0x19971D560](v6);
      if (*(void *)(a1 + 112) >= 2uLL)
      {
        mlcore::ArtistPropertyStoreID(v7);
        std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>();
      }
      mlcore::ArtistPropertyStoreID(v7);
      std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>();
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*a2)
  {
    uint64_t v6 = (std::__shared_weak_count *)a2[1];
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v7 = operator new(0x38uLL);
    void *v7 = &unk_1EE672AD8;
    v7[1] = a1 + 32;
    v7[2] = a1 + 40;
    v7[3] = a1 + 48;
    v7[4] = a1 + 56;
    v7[5] = a1 + 64;
    v7[6] = a1 + 72;
    v10[3] = v7;
    mlcore::PropertiesQueryResult::enumerateResults();
    std::__function::__value_func<void ()(mlcore::PropertyCache const&,BOOL &)>::~__value_func[abi:ne180100](v10);
  }
  else
  {
    uint64_t v6 = 0;
  }
  if ([*(id *)(a1 + 72) isCancelled])
  {
    uint64_t v8 = *(void *)(a1 + 80);
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) + 16))();
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_46(uint64_t a1, void *a2, void *a3)
{
  v11[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*a2)
  {
    uint64_t v6 = (std::__shared_weak_count *)a2[1];
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v7 = operator new(0x38uLL);
    void *v7 = &unk_1EE672DF0;
    v7[1] = a1 + 32;
    v7[2] = a1 + 40;
    v7[3] = a1 + 48;
    v7[4] = a1 + 56;
    v7[5] = a1 + 64;
    v7[6] = a1 + 72;
    v11[3] = v7;
    mlcore::PropertiesQueryResult::enumerateResults();
    std::__function::__value_func<void ()(mlcore::PropertyCache const&,BOOL &)>::~__value_func[abi:ne180100](v11);
  }
  else
  {
    uint64_t v6 = 0;
  }
  int v8 = [*(id *)(a1 + 72) isCancelled];
  uint64_t v9 = *(void *)(a1 + 80);
  if (v8)
  {
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
  else
  {
    (*(void (**)(void, void, void))(v9 + 16))(*(void *)(a1 + 80), *(void *)(a1 + 56), 0);
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_3_43(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*a2)
  {
    uint64_t v6 = (std::__shared_weak_count *)a2[1];
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 272);
    if (v7)
    {
      [v7 mlCoreView];
      long long v8 = v18;
    }
    else
    {
      long long v8 = 0uLL;
    }
    long long v16 = v8;
    long long v18 = 0uLL;
    mlcore::EntityCache::EntityCache();
    if (*((void *)&v16 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v16 + 1));
    }
    if (*((void *)&v18 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v18 + 1));
    }
    mlcore::EntityCache::setCacheDisabled((mlcore::EntityCache *)v17);
    __p = 0;
    unint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v9 = std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, *(const void **)(a1 + 88), *(void *)(a1 + 96), (uint64_t)(*(void *)(a1 + 96) - *(void *)(a1 + 88)) >> 3);
    MEMORY[0x19971D500](v9);
    mlcore::EntityCache::setPropertiesToFetchForEntityClass();
    if (__p)
    {
      unint64_t v14 = __p;
      operator delete(__p);
    }
    uint64_t v10 = operator new(0x38uLL);
    void *v10 = &unk_1EE672D98;
    v10[1] = a1 + 40;
    v10[2] = v17;
    v10[3] = a1 + 48;
    v10[4] = a1 + 56;
    void v10[5] = a1 + 64;
    v10[6] = a1 + 32;
    long long v19 = v10;
    mlcore::PropertiesQueryResult::enumerateResults();
    std::__function::__value_func<void ()(mlcore::PropertyCache const&,BOOL &)>::~__value_func[abi:ne180100](&v18);
    MEMORY[0x19971BD20](v17);
  }
  else
  {
    uint64_t v6 = 0;
  }
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v11 = *(void *)(a1 + 72);
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_40(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*a2)
  {
    uint64_t v6 = (std::__shared_weak_count *)a2[1];
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 272);
    if (v7)
    {
      [v7 mlCoreView];
      long long v8 = v18;
    }
    else
    {
      long long v8 = 0uLL;
    }
    long long v16 = v8;
    long long v18 = 0uLL;
    mlcore::EntityCache::EntityCache();
    if (*((void *)&v16 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v16 + 1));
    }
    if (*((void *)&v18 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v18 + 1));
    }
    mlcore::EntityCache::setCacheDisabled((mlcore::EntityCache *)v17);
    __p = 0;
    unint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v9 = std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, *(const void **)(a1 + 88), *(void *)(a1 + 96), (uint64_t)(*(void *)(a1 + 96) - *(void *)(a1 + 88)) >> 3);
    MEMORY[0x19971D500](v9);
    mlcore::EntityCache::setPropertiesToFetchForEntityClass();
    if (__p)
    {
      unint64_t v14 = __p;
      operator delete(__p);
    }
    uint64_t v10 = operator new(0x38uLL);
    void *v10 = &unk_1EE672D40;
    v10[1] = a1 + 40;
    v10[2] = v17;
    v10[3] = a1 + 48;
    v10[4] = a1 + 56;
    void v10[5] = a1 + 64;
    v10[6] = a1 + 32;
    long long v19 = v10;
    mlcore::PropertiesQueryResult::enumerateResults();
    std::__function::__value_func<void ()(mlcore::PropertyCache const&,BOOL &)>::~__value_func[abi:ne180100](&v18);
    MEMORY[0x19971BD20](v17);
  }
  else
  {
    uint64_t v6 = 0;
  }
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v11 = *(void *)(a1 + 72);
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_35(uint64_t a1, void *a2, void *a3)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*a2)
  {
    uint64_t v6 = (std::__shared_weak_count *)a2[1];
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v7 = operator new(0x30uLL);
    void *v7 = &unk_1EE672F50;
    v7[1] = a1 + 32;
    v7[2] = a1 + 40;
    v7[3] = a1 + 48;
    v7[4] = a1 + 56;
    v7[5] = a1 + 64;
    v10[3] = v7;
    mlcore::PropertiesQueryResult::enumerateResults();
    std::__function::__value_func<void ()(mlcore::PropertyCache const&,BOOL &)>::~__value_func[abi:ne180100](v10);
  }
  else
  {
    uint64_t v6 = 0;
  }
  if ([*(id *)(a1 + 64) isCancelled])
  {
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_32(uint64_t a1, void *a2, void *a3)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*a2)
  {
    uint64_t v6 = (std::__shared_weak_count *)a2[1];
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v7 = operator new(0x30uLL);
    void *v7 = &unk_1EE672EA0;
    v7[1] = a1 + 32;
    v7[2] = a1 + 40;
    v7[3] = a1 + 48;
    v7[4] = a1 + 56;
    v7[5] = a1 + 64;
    v10[3] = v7;
    mlcore::PropertiesQueryResult::enumerateResults();
    std::__function::__value_func<void ()(mlcore::PropertyCache const&,BOOL &)>::~__value_func[abi:ne180100](v10);
  }
  else
  {
    uint64_t v6 = 0;
  }
  if ([*(id *)(a1 + 64) isCancelled])
  {
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_30(uint64_t a1, void *a2, void *a3)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*a2)
  {
    uint64_t v6 = (std::__shared_weak_count *)a2[1];
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v7 = operator new(0x30uLL);
    void *v7 = &unk_1EE672E48;
    v7[1] = a1 + 32;
    v7[2] = a1 + 40;
    v7[3] = a1 + 48;
    v7[4] = a1 + 56;
    v7[5] = a1 + 64;
    v10[3] = v7;
    mlcore::PropertiesQueryResult::enumerateResults();
    std::__function::__value_func<void ()(mlcore::PropertyCache const&,BOOL &)>::~__value_func[abi:ne180100](v10);
  }
  else
  {
    uint64_t v6 = 0;
  }
  if ([*(id *)(a1 + 64) isCancelled])
  {
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v11[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*a2)
  {
    uint64_t v6 = (std::__shared_weak_count *)a2[1];
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v7 = operator new(0x30uLL);
    void *v7 = &unk_1EE672FA8;
    v7[1] = a1 + 32;
    v7[2] = a1 + 40;
    v7[3] = a1 + 48;
    v7[4] = a1 + 56;
    v7[5] = a1 + 64;
    v11[3] = v7;
    mlcore::PropertiesQueryResult::enumerateResults();
    std::__function::__value_func<void ()(mlcore::PropertyCache const&,BOOL &)>::~__value_func[abi:ne180100](v11);
  }
  else
  {
    uint64_t v6 = 0;
  }
  int v8 = [*(id *)(a1 + 64) isCancelled];
  uint64_t v9 = *(void *)(a1 + 72);
  if (v8)
  {
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
  else
  {
    (*(void (**)(void, void, void))(v9 + 16))(*(void *)(a1 + 72), *(void *)(a1 + 56), 0);
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

@end