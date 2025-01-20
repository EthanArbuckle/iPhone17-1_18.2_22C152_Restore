@interface CLSSearchSpecification
+ (BOOL)supportsSecureCoding;
+ (id)newlineAnchoredPredicateValueForToken:(id)a3;
- (BOOL)canUseClassPredicate;
- (BOOL)canUseGroupPredicate;
- (BOOL)canUsePersonPredicate;
- (BOOL)hasLocationConstraints;
- (BOOL)hasPersonConstraints;
- (BOOL)includeEmptyGroupsInResults;
- (BOOL)includeUnsearchablePersons;
- (BOOL)isClassMemberSearch;
- (BOOL)isClassSearch;
- (BOOL)isGroupMemberSearch;
- (BOOL)isGroupSearch;
- (BOOL)isLocationSearch;
- (BOOL)isOrganizationSearch;
- (BOOL)isPersonSearch;
- (BOOL)isValid:(BOOL)a3 error:(id *)a4;
- (BOOL)requiresDashboardEntitlement;
- (CLSAdminRequestor)adminRequestor;
- (CLSSearchSpecification)initWithCoder:(id)a3;
- (CLSSearchSpecification)initWithOptions:(unint64_t)a3 behaviors:(unint64_t)a4;
- (CLSSearchSpecification)initWithOptions:(unint64_t)a3 behaviors:(unint64_t)a4 searchString:(id)a5;
- (CLSSearchSpecification)initWithOptions:(unint64_t)a3 behaviors:(unint64_t)a4 searchString:(id)a5 requestor:(id)a6;
- (NSArray)classLocationIDs;
- (NSArray)classSortDescriptors;
- (NSArray)groupLocationIDs;
- (NSArray)groupSortDescriptors;
- (NSArray)locationPersonIDs;
- (NSArray)locationSortDescriptors;
- (NSArray)organizationSortDescriptors;
- (NSArray)personLocationIDs;
- (NSArray)personSortDescriptors;
- (NSArray)prohibitedLocationPersonIDs;
- (NSArray)prohibitedPrivilegeLocationIDs;
- (NSArray)requiredClassMemberClassIDs;
- (NSArray)requiredGroupMemberGroupIDs;
- (NSArray)requiredLocationPersonIDs;
- (NSArray)requiredPrivilegeLocationIDs;
- (NSArray)searchTokens;
- (NSString)prohibitedLocationPrivilege;
- (NSString)prohibitedPrivilege;
- (NSString)requiredLocationPrivilege;
- (NSString)requiredOrganizationEmailDomain;
- (NSString)requiredPrivilege;
- (NSString)requiredRoleID;
- (NSString)searchString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)predicate;
- (id)predicateForClasses;
- (id)predicateForGroups;
- (id)predicateForPersons;
- (id)predicateForPersonsWithObjectIDs:(id)a3;
- (id)predicateForPersonsWithPersonIDs:(id)a3;
- (id)predicateUsingSubPredicateBlock:(id)a3;
- (id)predicateWithLocationIDs:(id)a3;
- (int64_t)requiredLocationRoleType;
- (int64_t)requiredRoleType;
- (unint64_t)behaviors;
- (unint64_t)compareOptions;
- (unint64_t)options;
- (unint64_t)requiredClassMemberRole;
- (void)encodeWithCoder:(id)a3;
- (void)prohibitPrivilege:(id)a3 atLocationIDs:(id)a4;
- (void)prohibitPrivilege:(id)a3 onPersonIDs:(id)a4;
- (void)requireClassMemberRole:(unint64_t)a3 forClassIDs:(id)a4;
- (void)requireGroupMemberIDs:(id)a3;
- (void)requirePrivilege:(id)a3 atLocationIDs:(id)a4;
- (void)requirePrivilege:(id)a3 onPersonIDs:(id)a4;
- (void)requireRole:(id)a3 atLocationIDs:(id)a4;
- (void)requireRoleType:(int64_t)a3 atLocationIDs:(id)a4;
- (void)requireRoleType:(int64_t)a3 onPersonIDs:(id)a4;
- (void)restrictToClassesAtLocationIDs:(id)a3;
- (void)restrictToGroupsAtLocationIDs:(id)a3;
- (void)restrictToOrganizationsMatchingEmailDomain:(id)a3;
- (void)sanitizeSpecForABMMAID;
- (void)sanitizeSpecForEDUMAID;
- (void)setAdminRequestor:(id)a3;
- (void)setBehaviors:(unint64_t)a3;
- (void)setClassLocationIDs:(id)a3;
- (void)setClassSortDescriptors:(id)a3;
- (void)setCompareOptions:(unint64_t)a3;
- (void)setGroupLocationIDs:(id)a3;
- (void)setGroupSortDescriptors:(id)a3;
- (void)setIncludeEmptyGroupsInResults:(BOOL)a3;
- (void)setIncludeUnsearchablePersons:(BOOL)a3;
- (void)setLocationPersonIDs:(id)a3;
- (void)setLocationSortDescriptors:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setOrganizationSortDescriptors:(id)a3;
- (void)setPersonLocationIDs:(id)a3;
- (void)setPersonSortDescriptors:(id)a3;
- (void)setProhibitedLocationPersonIDs:(id)a3;
- (void)setProhibitedLocationPrivilege:(id)a3;
- (void)setProhibitedPrivilege:(id)a3;
- (void)setProhibitedPrivilegeLocationIDs:(id)a3;
- (void)setRequiredClassMemberClassIDs:(id)a3;
- (void)setRequiredClassMemberRole:(unint64_t)a3;
- (void)setRequiredGroupMemberGroupIDs:(id)a3;
- (void)setRequiredLocationPersonIDs:(id)a3;
- (void)setRequiredLocationPrivilege:(id)a3;
- (void)setRequiredLocationRoleType:(int64_t)a3;
- (void)setRequiredOrganizationEmailDomain:(id)a3;
- (void)setRequiredPrivilege:(id)a3;
- (void)setRequiredPrivilegeLocationIDs:(id)a3;
- (void)setRequiredRoleID:(id)a3;
- (void)setRequiredRoleType:(int64_t)a3;
- (void)setSearchString:(id)a3;
- (void)setSearchTokens:(id)a3;
@end

@implementation CLSSearchSpecification

- (CLSSearchSpecification)initWithOptions:(unint64_t)a3 behaviors:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CLSSearchSpecification;
  result = [(CLSSearchSpecification *)&v7 init];
  if (result)
  {
    result->_options = a3;
    result->_behaviors = a4;
    result->_compareOptions = 393;
    result->_includeUnsearchablePersons = 0;
    result->_requiredRoleType = 0;
    result->_requiredLocationRoleType = 0;
    result->_requiredClassMemberRole = 0;
  }
  return result;
}

- (CLSSearchSpecification)initWithOptions:(unint64_t)a3 behaviors:(unint64_t)a4 searchString:(id)a5
{
  id v8 = a5;
  v12 = (CLSSearchSpecification *)objc_msgSend_initWithOptions_behaviors_(self, v9, a3, a4);
  if (v12)
  {
    uint64_t v13 = objc_msgSend_lowercaseString(v8, v10, v11);
    searchString = v12->_searchString;
    v12->_searchString = (NSString *)v13;
  }
  return v12;
}

- (CLSSearchSpecification)initWithOptions:(unint64_t)a3 behaviors:(unint64_t)a4 searchString:(id)a5 requestor:(id)a6
{
  id v11 = a6;
  uint64_t v13 = objc_msgSend_initWithOptions_behaviors_searchString_(self, v12, a3, a4, a5);
  v14 = (CLSSearchSpecification *)v13;
  if (v13) {
    objc_storeStrong((id *)(v13 + 56), a6);
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  objc_super v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_options(self, v8, v9);
  uint64_t v13 = objc_msgSend_behaviors(self, v11, v12);
  v16 = objc_msgSend_searchString(self, v14, v15);
  v19 = objc_msgSend_copy(v16, v17, v18);
  v21 = objc_msgSend_initWithOptions_behaviors_searchString_(v7, v20, v10, v13, v19);

  v24 = objc_msgSend_classLocationIDs(self, v22, v23);
  v27 = objc_msgSend_copy(v24, v25, v26);
  objc_msgSend_setClassLocationIDs_(v21, v28, (uint64_t)v27);

  v31 = objc_msgSend_classSortDescriptors(self, v29, v30);
  v34 = objc_msgSend_copy(v31, v32, v33);
  objc_msgSend_setClassSortDescriptors_(v21, v35, (uint64_t)v34);

  uint64_t v38 = objc_msgSend_includeUnsearchablePersons(self, v36, v37);
  objc_msgSend_setIncludeUnsearchablePersons_(v21, v39, v38);
  v42 = objc_msgSend_personSortDescriptors(self, v40, v41);
  v45 = objc_msgSend_copy(v42, v43, v44);
  objc_msgSend_setPersonSortDescriptors_(v21, v46, (uint64_t)v45);

  v49 = objc_msgSend_personLocationIDs(self, v47, v48);
  v52 = objc_msgSend_copy(v49, v50, v51);
  objc_msgSend_setPersonLocationIDs_(v21, v53, (uint64_t)v52);

  v56 = objc_msgSend_requiredRoleID(self, v54, v55);
  v59 = objc_msgSend_copy(v56, v57, v58);
  objc_msgSend_setRequiredRoleID_(v21, v60, (uint64_t)v59);

  uint64_t v63 = objc_msgSend_requiredRoleType(self, v61, v62);
  objc_msgSend_setRequiredRoleType_(v21, v64, v63);
  v67 = objc_msgSend_requiredPrivilege(self, v65, v66);
  v70 = objc_msgSend_copy(v67, v68, v69);
  objc_msgSend_setRequiredPrivilege_(v21, v71, (uint64_t)v70);

  v74 = objc_msgSend_requiredPrivilegeLocationIDs(self, v72, v73);
  v77 = objc_msgSend_copy(v74, v75, v76);
  objc_msgSend_setRequiredPrivilegeLocationIDs_(v21, v78, (uint64_t)v77);

  v81 = objc_msgSend_prohibitedPrivilege(self, v79, v80);
  v84 = objc_msgSend_copy(v81, v82, v83);
  objc_msgSend_setProhibitedPrivilege_(v21, v85, (uint64_t)v84);

  v88 = objc_msgSend_prohibitedPrivilegeLocationIDs(self, v86, v87);
  v91 = objc_msgSend_copy(v88, v89, v90);
  objc_msgSend_setProhibitedPrivilegeLocationIDs_(v21, v92, (uint64_t)v91);

  v95 = objc_msgSend_locationSortDescriptors(self, v93, v94);
  v98 = objc_msgSend_copy(v95, v96, v97);
  objc_msgSend_setLocationSortDescriptors_(v21, v99, (uint64_t)v98);

  v102 = objc_msgSend_locationPersonIDs(self, v100, v101);
  v105 = objc_msgSend_copy(v102, v103, v104);
  objc_msgSend_setLocationPersonIDs_(v21, v106, (uint64_t)v105);

  uint64_t v109 = objc_msgSend_requiredLocationRoleType(self, v107, v108);
  objc_msgSend_setRequiredLocationRoleType_(v21, v110, v109);
  v113 = objc_msgSend_requiredLocationPrivilege(self, v111, v112);
  v116 = objc_msgSend_copy(v113, v114, v115);
  objc_msgSend_setRequiredLocationPrivilege_(v21, v117, (uint64_t)v116);

  v120 = objc_msgSend_requiredLocationPersonIDs(self, v118, v119);
  v123 = objc_msgSend_copy(v120, v121, v122);
  objc_msgSend_setRequiredLocationPersonIDs_(v21, v124, (uint64_t)v123);

  v127 = objc_msgSend_prohibitedLocationPrivilege(self, v125, v126);
  v130 = objc_msgSend_copy(v127, v128, v129);
  objc_msgSend_setProhibitedLocationPrivilege_(v21, v131, (uint64_t)v130);

  v134 = objc_msgSend_prohibitedLocationPersonIDs(self, v132, v133);
  v137 = objc_msgSend_copy(v134, v135, v136);
  objc_msgSend_setProhibitedLocationPersonIDs_(v21, v138, (uint64_t)v137);

  v141 = objc_msgSend_organizationSortDescriptors(self, v139, v140);
  v144 = objc_msgSend_copy(v141, v142, v143);
  objc_msgSend_setOrganizationSortDescriptors_(v21, v145, (uint64_t)v144);

  v148 = objc_msgSend_requiredOrganizationEmailDomain(self, v146, v147);
  v151 = objc_msgSend_copy(v148, v149, v150);
  objc_msgSend_setRequiredOrganizationEmailDomain_(v21, v152, (uint64_t)v151);

  v155 = objc_msgSend_adminRequestor(self, v153, v154);
  v158 = objc_msgSend_copy(v155, v156, v157);
  objc_msgSend_setAdminRequestor_(v21, v159, (uint64_t)v158);

  uint64_t v162 = objc_msgSend_requiredClassMemberRole(self, v160, v161);
  objc_msgSend_setRequiredClassMemberRole_(v21, v163, v162);
  v166 = objc_msgSend_requiredClassMemberClassIDs(self, v164, v165);
  v169 = objc_msgSend_copy(v166, v167, v168);
  objc_msgSend_setRequiredClassMemberClassIDs_(v21, v170, (uint64_t)v169);

  v173 = objc_msgSend_groupSortDescriptors(self, v171, v172);
  v176 = objc_msgSend_copy(v173, v174, v175);
  objc_msgSend_setGroupSortDescriptors_(v21, v177, (uint64_t)v176);

  v180 = objc_msgSend_groupLocationIDs(self, v178, v179);
  v183 = objc_msgSend_copy(v180, v181, v182);
  objc_msgSend_setGroupLocationIDs_(v21, v184, (uint64_t)v183);

  v187 = objc_msgSend_requiredGroupMemberGroupIDs(self, v185, v186);
  v190 = objc_msgSend_copy(v187, v188, v189);
  objc_msgSend_setRequiredGroupMemberGroupIDs_(v21, v191, (uint64_t)v190);

  uint64_t v194 = objc_msgSend_includeEmptyGroupsInResults(self, v192, v193);
  objc_msgSend_setIncludeEmptyGroupsInResults_(v21, v195, v194);
  return v21;
}

- (CLSSearchSpecification)initWithCoder:(id)a3
{
  v91[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v90.receiver = self;
  v90.super_class = (Class)CLSSearchSpecification;
  v5 = [(CLSSearchSpecification *)&v90 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v91[0] = objc_opt_class();
    v91[1] = objc_opt_class();
    v91[2] = objc_opt_class();
    v91[3] = objc_opt_class();
    v91[4] = objc_opt_class();
    id v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v91, 5);
    uint64_t v10 = objc_msgSend_setWithArray_(v6, v9, (uint64_t)v8);

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"searchString");
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v13;

    v5->_compareOptions = objc_msgSend_decodeIntegerForKey_(v4, v15, @"compareOptions");
    v5->_options = objc_msgSend_decodeIntegerForKey_(v4, v16, @"options");
    v5->_behaviors = objc_msgSend_decodeIntegerForKey_(v4, v17, @"behaviors");
    uint64_t v19 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v18, (uint64_t)v10, @"classLocationIDs");
    classLocationIDs = v5->_classLocationIDs;
    v5->_classLocationIDs = (NSArray *)v19;

    uint64_t v22 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v21, (uint64_t)v10, @"classSortDescriptors");
    classSortDescriptors = v5->_classSortDescriptors;
    v5->_classSortDescriptors = (NSArray *)v22;

    v5->_includeUnsearchablePersons = objc_msgSend_decodeBoolForKey_(v4, v24, @"includeUnsearchablePersons");
    uint64_t v26 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v25, (uint64_t)v10, @"personSortDescriptors");
    personSortDescriptors = v5->_personSortDescriptors;
    v5->_personSortDescriptors = (NSArray *)v26;

    uint64_t v29 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v28, (uint64_t)v10, @"personLocationIDs");
    personLocationIDs = v5->_personLocationIDs;
    v5->_personLocationIDs = (NSArray *)v29;

    uint64_t v32 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v31, (uint64_t)v10, @"requiredRoleID");
    requiredRoleID = v5->_requiredRoleID;
    v5->_requiredRoleID = (NSString *)v32;

    v5->_requiredRoleType = objc_msgSend_decodeIntegerForKey_(v4, v34, @"requiredRoleType");
    uint64_t v36 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v35, (uint64_t)v10, @"requiredPrivilege");
    requiredPrivilege = v5->_requiredPrivilege;
    v5->_requiredPrivilege = (NSString *)v36;

    uint64_t v39 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v38, (uint64_t)v10, @"requiredPrivilegeLocationIDs");
    requiredPrivilegeLocationIDs = v5->_requiredPrivilegeLocationIDs;
    v5->_requiredPrivilegeLocationIDs = (NSArray *)v39;

    uint64_t v42 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v41, (uint64_t)v10, @"prohibitedPrivilege");
    prohibitedPrivilege = v5->_prohibitedPrivilege;
    v5->_prohibitedPrivilege = (NSString *)v42;

    uint64_t v45 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v44, (uint64_t)v10, @"prohibitedPrivilegeLocationIDs");
    prohibitedPrivilegeLocationIDs = v5->_prohibitedPrivilegeLocationIDs;
    v5->_prohibitedPrivilegeLocationIDs = (NSArray *)v45;

    uint64_t v48 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v47, (uint64_t)v10, @"locationSortDescriptors");
    locationSortDescriptors = v5->_locationSortDescriptors;
    v5->_locationSortDescriptors = (NSArray *)v48;

    uint64_t v51 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v50, (uint64_t)v10, @"locationPersonIDs");
    locationPersonIDs = v5->_locationPersonIDs;
    v5->_locationPersonIDs = (NSArray *)v51;

    v5->_requiredLocationRoleType = objc_msgSend_decodeIntegerForKey_(v4, v53, @"requiredLocationRoleType");
    uint64_t v55 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v54, (uint64_t)v10, @"requiredLocationPrivilege");
    requiredLocationPrivilege = v5->_requiredLocationPrivilege;
    v5->_requiredLocationPrivilege = (NSString *)v55;

    uint64_t v58 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v57, (uint64_t)v10, @"requiredLocationPersonIDs");
    requiredLocationPersonIDs = v5->_requiredLocationPersonIDs;
    v5->_requiredLocationPersonIDs = (NSArray *)v58;

    uint64_t v61 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v60, (uint64_t)v10, @"prohibitedLocationPrivilege");
    prohibitedLocationPrivilege = v5->_prohibitedLocationPrivilege;
    v5->_prohibitedLocationPrivilege = (NSString *)v61;

    uint64_t v64 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v63, (uint64_t)v10, @"prohibitedLocationPersonIDs");
    prohibitedLocationPersonIDs = v5->_prohibitedLocationPersonIDs;
    v5->_prohibitedLocationPersonIDs = (NSArray *)v64;

    uint64_t v67 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v66, (uint64_t)v10, @"organizationSortDescriptors");
    organizationSortDescriptors = v5->_organizationSortDescriptors;
    v5->_organizationSortDescriptors = (NSArray *)v67;

    uint64_t v70 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v69, (uint64_t)v10, @"requiredOrganizationEmailDomain");
    requiredOrganizationEmailDomain = v5->_requiredOrganizationEmailDomain;
    v5->_requiredOrganizationEmailDomain = (NSString *)v70;

    uint64_t v73 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v72, (uint64_t)v10, @"adminRequestor");
    adminRequestor = v5->_adminRequestor;
    v5->_adminRequestor = (CLSAdminRequestor *)v73;

    v5->_requiredClassMemberRole = objc_msgSend_decodeIntegerForKey_(v4, v75, @"requiredClassMemberRole");
    uint64_t v77 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v76, (uint64_t)v10, @"requiredClassMemberClassIDs");
    requiredClassMemberClassIDs = v5->_requiredClassMemberClassIDs;
    v5->_requiredClassMemberClassIDs = (NSArray *)v77;

    uint64_t v80 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v79, (uint64_t)v10, @"groupSortDescriptors");
    groupSortDescriptors = v5->_groupSortDescriptors;
    v5->_groupSortDescriptors = (NSArray *)v80;

    uint64_t v83 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v82, (uint64_t)v10, @"groupLocationIDs");
    groupLocationIDs = v5->_groupLocationIDs;
    v5->_groupLocationIDs = (NSArray *)v83;

    uint64_t v86 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v85, (uint64_t)v10, @"requiredGroupMemberGroupIDs");
    requiredGroupMemberGroupIDs = v5->_requiredGroupMemberGroupIDs;
    v5->_requiredGroupMemberGroupIDs = (NSArray *)v86;

    v5->_includeEmptyGroupsInResults = objc_msgSend_decodeBoolForKey_(v4, v88, @"includeEmptyGroupsInResults");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  searchString = self->_searchString;
  id v36 = a3;
  objc_msgSend_encodeObject_forKey_(v36, v5, (uint64_t)searchString, @"searchString");
  objc_msgSend_encodeInteger_forKey_(v36, v6, self->_compareOptions, @"compareOptions");
  objc_msgSend_encodeInteger_forKey_(v36, v7, self->_options, @"options");
  objc_msgSend_encodeInteger_forKey_(v36, v8, self->_behaviors, @"behaviors");
  objc_msgSend_encodeObject_forKey_(v36, v9, (uint64_t)self->_classLocationIDs, @"classLocationIDs");
  objc_msgSend_encodeObject_forKey_(v36, v10, (uint64_t)self->_classSortDescriptors, @"classSortDescriptors");
  objc_msgSend_encodeBool_forKey_(v36, v11, self->_includeUnsearchablePersons, @"includeUnsearchablePersons");
  objc_msgSend_encodeObject_forKey_(v36, v12, (uint64_t)self->_personSortDescriptors, @"personSortDescriptors");
  objc_msgSend_encodeObject_forKey_(v36, v13, (uint64_t)self->_personLocationIDs, @"personLocationIDs");
  objc_msgSend_encodeObject_forKey_(v36, v14, (uint64_t)self->_requiredRoleID, @"requiredRoleID");
  objc_msgSend_encodeInteger_forKey_(v36, v15, self->_requiredRoleType, @"requiredRoleType");
  objc_msgSend_encodeObject_forKey_(v36, v16, (uint64_t)self->_requiredPrivilege, @"requiredPrivilege");
  objc_msgSend_encodeObject_forKey_(v36, v17, (uint64_t)self->_requiredPrivilegeLocationIDs, @"requiredPrivilegeLocationIDs");
  objc_msgSend_encodeObject_forKey_(v36, v18, (uint64_t)self->_prohibitedPrivilege, @"prohibitedPrivilege");
  objc_msgSend_encodeObject_forKey_(v36, v19, (uint64_t)self->_prohibitedPrivilegeLocationIDs, @"prohibitedPrivilegeLocationIDs");
  objc_msgSend_encodeObject_forKey_(v36, v20, (uint64_t)self->_locationSortDescriptors, @"locationSortDescriptors");
  objc_msgSend_encodeObject_forKey_(v36, v21, (uint64_t)self->_locationPersonIDs, @"locationPersonIDs");
  objc_msgSend_encodeInteger_forKey_(v36, v22, self->_requiredLocationRoleType, @"requiredLocationRoleType");
  objc_msgSend_encodeObject_forKey_(v36, v23, (uint64_t)self->_requiredLocationPrivilege, @"requiredLocationPrivilege");
  objc_msgSend_encodeObject_forKey_(v36, v24, (uint64_t)self->_requiredLocationPersonIDs, @"requiredLocationPersonIDs");
  objc_msgSend_encodeObject_forKey_(v36, v25, (uint64_t)self->_prohibitedLocationPrivilege, @"prohibitedLocationPrivilege");
  objc_msgSend_encodeObject_forKey_(v36, v26, (uint64_t)self->_prohibitedLocationPersonIDs, @"prohibitedLocationPersonIDs");
  objc_msgSend_encodeObject_forKey_(v36, v27, (uint64_t)self->_organizationSortDescriptors, @"organizationSortDescriptors");
  objc_msgSend_encodeObject_forKey_(v36, v28, (uint64_t)self->_requiredOrganizationEmailDomain, @"requiredOrganizationEmailDomain");
  objc_msgSend_encodeObject_forKey_(v36, v29, (uint64_t)self->_adminRequestor, @"adminRequestor");
  objc_msgSend_encodeInteger_forKey_(v36, v30, self->_requiredClassMemberRole, @"requiredClassMemberRole");
  objc_msgSend_encodeObject_forKey_(v36, v31, (uint64_t)self->_requiredClassMemberClassIDs, @"requiredClassMemberClassIDs");
  objc_msgSend_encodeObject_forKey_(v36, v32, (uint64_t)self->_groupSortDescriptors, @"groupSortDescriptors");
  objc_msgSend_encodeObject_forKey_(v36, v33, (uint64_t)self->_groupLocationIDs, @"groupLocationIDs");
  objc_msgSend_encodeObject_forKey_(v36, v34, (uint64_t)self->_requiredGroupMemberGroupIDs, @"requiredGroupMemberGroupIDs");
  objc_msgSend_encodeBool_forKey_(v36, v35, self->_includeEmptyGroupsInResults, @"includeEmptyGroupsInResults");
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = NSStringFromSearchOptions(self->_options);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v5, (uint64_t)v4, @"options");

  v6 = NSStringFromSearchBehaviors(self->_behaviors);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)v6, @"behaviors");

  searchString = self->_searchString;
  if (searchString)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)searchString, @"searchString");
    uint64_t v10 = NSStringFromNSStringCompareOptions(self->_compareOptions);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v11, (uint64_t)v10, @"compareOptions");
  }
  if ((self->_options & 2) != 0)
  {
    classLocationIDs = self->_classLocationIDs;
    if (classLocationIDs) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)classLocationIDs, @"classLocationIDs");
    }
    classSortDescriptors = self->_classSortDescriptors;
    if (classSortDescriptors) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)classSortDescriptors, @"classSortDescriptors");
    }
  }
  if ((self->_options & 0x10) != 0)
  {
    groupLocationIDs = self->_groupLocationIDs;
    if (groupLocationIDs) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)groupLocationIDs, @"groupLocationIDs");
    }
    groupSortDescriptors = self->_groupSortDescriptors;
    if (groupSortDescriptors) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)groupSortDescriptors, @"groupSortDescriptors");
    }
  }
  if (self->_options)
  {
    v16 = objc_msgSend_numberWithBool_(NSNumber, v8, self->_includeUnsearchablePersons);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v17, (uint64_t)v16, @"includeUnsearchablePersons");

    int64_t requiredRoleType = self->_requiredRoleType;
    if (requiredRoleType)
    {
      uint64_t v19 = objc_msgSend_stringForRoleType_(CLSRole, v8, requiredRoleType);
      objc_msgSend_setObject_forKeyedSubscript_(v3, v20, (uint64_t)v19, @"requiredRoleType");
    }
    personSortDescriptors = self->_personSortDescriptors;
    if (personSortDescriptors) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)personSortDescriptors, @"personSortDescriptors");
    }
    personLocationIDs = self->_personLocationIDs;
    if (personLocationIDs) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)personLocationIDs, @"personLocationIDs");
    }
    requiredRoleID = self->_requiredRoleID;
    if (requiredRoleID) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)requiredRoleID, @"requiredRoleID");
    }
    requiredPrivilege = self->_requiredPrivilege;
    if (requiredPrivilege) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)requiredPrivilege, @"requiredPrivilege");
    }
    requiredPrivilegeLocationIDs = self->_requiredPrivilegeLocationIDs;
    if (requiredPrivilegeLocationIDs) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)requiredPrivilegeLocationIDs, @"requiredPrivilegeLocationIDs");
    }
    prohibitedPrivilege = self->_prohibitedPrivilege;
    if (prohibitedPrivilege) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)prohibitedPrivilege, @"prohibitedPrivilege");
    }
    prohibitedPrivilegeLocationIDs = self->_prohibitedPrivilegeLocationIDs;
    if (prohibitedPrivilegeLocationIDs) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)prohibitedPrivilegeLocationIDs, @"prohibitedPrivilegeLocationIDs");
    }
    if (self->_requiredClassMemberClassIDs)
    {
      v28 = objc_msgSend_stringForRole_(CLSPerson, v8, self->_requiredClassMemberRole);
      objc_msgSend_setObject_forKeyedSubscript_(v3, v29, (uint64_t)v28, @"requiredClassMemberRole");

      objc_msgSend_setObject_forKeyedSubscript_(v3, v30, (uint64_t)self->_requiredClassMemberClassIDs, @"requiredClassMemberClassIDs");
    }
    requiredGroupMemberGroupIDs = self->_requiredGroupMemberGroupIDs;
    if (requiredGroupMemberGroupIDs) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)requiredGroupMemberGroupIDs, @"requiredGroupMemberGroupIDs");
    }
  }
  if ((self->_options & 4) != 0)
  {
    locationSortDescriptors = self->_locationSortDescriptors;
    if (locationSortDescriptors) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)locationSortDescriptors, @"locationSortDescriptors");
    }
    locationPersonIDs = self->_locationPersonIDs;
    if (locationPersonIDs) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)locationPersonIDs, @"locationPersonIDs");
    }
    v34 = objc_msgSend_stringForRoleType_(CLSRole, v8, self->_requiredLocationRoleType);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v35, (uint64_t)v34, @"requiredLocationRoleType");

    requiredLocationPrivilege = self->_requiredLocationPrivilege;
    if (requiredLocationPrivilege) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)requiredLocationPrivilege, @"requiredLocationPrivilege");
    }
    requiredLocationPersonIDs = self->_requiredLocationPersonIDs;
    if (requiredLocationPersonIDs) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)requiredLocationPersonIDs, @"requiredLocationPersonIDs");
    }
    prohibitedLocationPrivilege = self->_prohibitedLocationPrivilege;
    if (prohibitedLocationPrivilege) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)prohibitedLocationPrivilege, @"prohibitedLocationPrivilege");
    }
    prohibitedLocationPersonIDs = self->_prohibitedLocationPersonIDs;
    if (prohibitedLocationPersonIDs) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)prohibitedLocationPersonIDs, @"prohibitedLocationPersonIDs");
    }
  }
  if ((self->_options & 8) != 0)
  {
    organizationSortDescriptors = self->_organizationSortDescriptors;
    if (organizationSortDescriptors) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)organizationSortDescriptors, @"organizationSortDescriptors");
    }
    requiredOrganizationEmailDomain = self->_requiredOrganizationEmailDomain;
    if (requiredOrganizationEmailDomain) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)requiredOrganizationEmailDomain, @"requiredOrganizationEmailDomain");
    }
  }
  adminRequestor = self->_adminRequestor;
  if (adminRequestor) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)adminRequestor, @"adminRequestor");
  }
  if (self->_includeEmptyGroupsInResults) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v8, @"YES", @"includeEmptyGroupsInResults");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v8, @"NO", @"includeEmptyGroupsInResults");
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newlineAnchoredPredicateValueForToken:(id)a3
{
  return (id)objc_msgSend_stringByAppendingString_(@"\n", a2, (uint64_t)a3);
}

- (NSArray)searchTokens
{
  searchString = self->_searchString;
  if (searchString && objc_msgSend_length(searchString, a2, v2))
  {
    objc_super v7 = objc_msgSend__cls_searchableTokens(self->_searchString, v5, v6);
  }
  else
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v7;
}

- (id)predicateUsingSubPredicateBlock:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  v5 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = objc_msgSend_searchTokens(self, v6, v7, 0);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v24, v28, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v8);
        }
        v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend_length(v16, v11, v12))
        {
          uint64_t v18 = v4[2](v4, v16);
          if (v18) {
            objc_msgSend_addObject_(v5, v17, (uint64_t)v18);
          }
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v24, v28, 16);
    }
    while (v13);
  }

  if (objc_msgSend_count(v5, v19, v20))
  {
    uint64_t v22 = objc_msgSend_orPredicateWithSubpredicates_(MEMORY[0x1E4F28BA0], v21, (uint64_t)v5);
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

- (id)predicateForPersons
{
  if (objc_msgSend_canUsePersonPredicate(self, a2, v2))
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1DC686B48;
    v7[3] = &unk_1E6C976E8;
    v7[4] = self;
    v5 = objc_msgSend_predicateUsingSubPredicateBlock_(self, v4, (uint64_t)v7);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)predicateForPersonsWithPersonIDs:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_searchString(self, v5, v6);

  if (v7)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1DC686D7C;
    v12[3] = &unk_1E6C97710;
    v12[4] = self;
    id v13 = v4;
    uint64_t v10 = objc_msgSend_predicateUsingSubPredicateBlock_(self, v9, (uint64_t)v12);
  }
  else
  {
    uint64_t v10 = objc_msgSend_predicateForPersonsWithObjectIDs_(self, v8, (uint64_t)v4);
  }

  return v10;
}

- (id)predicateForClasses
{
  if (objc_msgSend_canUseClassPredicate(self, a2, v2))
  {
    uint64_t v6 = objc_msgSend_classLocationIDs(self, v4, v5);
    uint64_t v9 = objc_msgSend_count(v6, v7, v8);

    if (v9)
    {
      uint64_t v12 = objc_msgSend_classLocationIDs(self, v10, v11);
      uint64_t v14 = objc_msgSend_predicateWithLocationIDs_(self, v13, (uint64_t)v12);
    }
    else
    {
      uint64_t v14 = objc_msgSend_predicate(self, v10, v11);
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)predicateForGroups
{
  if (objc_msgSend_canUseGroupPredicate(self, a2, v2))
  {
    uint64_t v6 = objc_msgSend_groupLocationIDs(self, v4, v5);
    uint64_t v9 = objc_msgSend_count(v6, v7, v8);

    if (v9)
    {
      uint64_t v12 = objc_msgSend_groupLocationIDs(self, v10, v11);
      uint64_t v14 = objc_msgSend_predicateWithLocationIDs_(self, v13, (uint64_t)v12);
    }
    else
    {
      uint64_t v14 = objc_msgSend_predicate(self, v10, v11);
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)predicate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1DC6870DC;
  v4[3] = &unk_1E6C976E8;
  v4[4] = self;
  uint64_t v2 = objc_msgSend_predicateUsingSubPredicateBlock_(self, a2, (uint64_t)v4);

  return v2;
}

- (id)predicateWithLocationIDs:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC687258;
  v9[3] = &unk_1E6C97710;
  v9[4] = self;
  id v10 = v4;
  id v5 = v4;
  uint64_t v7 = objc_msgSend_predicateUsingSubPredicateBlock_(self, v6, (uint64_t)v9);

  return v7;
}

- (BOOL)isValid:(BOOL)a3 error:(id *)a4
{
  if (a3) {
    return 1;
  }
  if ((objc_msgSend_options(self, a2, a3) & 0x13) != 0)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = objc_msgSend_options(self, v7, v8);
    uint64_t v11 = NSStringFromSearchOptions(v10);
    objc_msgSend_cls_assignError_code_format_(v9, v12, (uint64_t)a4, 4, @"Query with options: '%@' not allowed without a valid user.", v11);

    return 0;
  }
  id v13 = objc_msgSend_adminRequestor(self, v7, v8);

  if (!v13)
  {
    objc_msgSend_cls_assignError_code_description_(MEMORY[0x1E4F28C58], v14, (uint64_t)a4, 2, @"No User Mode searches require a valid CLSAdminRequestor.");
    return 0;
  }
  return 1;
}

- (BOOL)requiresDashboardEntitlement
{
  if (self->_includeUnsearchablePersons) {
    return 1;
  }
  if (objc_msgSend_isOrganizationSearch(self, a2, v2)) {
    return 1;
  }
  uint64_t v6 = objc_msgSend_adminRequestor(self, v4, v5);

  if (v6) {
    return 1;
  }
  if ((objc_msgSend_isClassMemberSearch(self, v7, v8) & 1) != 0
    || (objc_msgSend_isGroupMemberSearch(self, v10, v11) & 1) != 0)
  {
    return 0;
  }
  if (!self->_searchString || (objc_msgSend_hasPersonConstraints(self, v12, v13) & 1) != 0) {
    return 1;
  }

  return MEMORY[0x1F4181798](self, sel_hasLocationConstraints, v14);
}

- (BOOL)canUseClassPredicate
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)canUseGroupPredicate
{
  return ((uint64_t (*)(CLSSearchSpecification *, char *))MEMORY[0x1F4181798])(self, sel_isGroupSearch);
}

- (BOOL)canUsePersonPredicate
{
  if (self->_options) {
    return objc_msgSend_hasPersonConstraints(self, a2, v2) ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)hasPersonConstraints
{
  if ((self->_options & 1) == 0) {
    return 0;
  }
  if (self->_personLocationIDs
    || !self->_searchString
    || self->_requiredRoleID
    || self->_requiredRoleType
    || self->_requiredPrivilege)
  {
    return 1;
  }
  return self->_prohibitedPrivilege != 0;
}

- (BOOL)hasLocationConstraints
{
  return (self->_options & 4) != 0
      && (self->_personLocationIDs
       || self->_requiredLocationPrivilege
       || self->_prohibitedLocationPrivilege
       || self->_requiredLocationRoleType);
}

- (BOOL)isPersonSearch
{
  if (self->_options) {
    return objc_msgSend_isClassMemberSearch(self, a2, v2) ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)isClassSearch
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)isLocationSearch
{
  return (LOBYTE(self->_options) >> 2) & 1;
}

- (BOOL)isOrganizationSearch
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (BOOL)isGroupSearch
{
  return (LOBYTE(self->_options) >> 4) & 1;
}

- (BOOL)isGroupMemberSearch
{
  if (self->_options)
  {
    requiredGroupMemberGroupIDs = self->_requiredGroupMemberGroupIDs;
    if (requiredGroupMemberGroupIDs) {
      LOBYTE(requiredGroupMemberGroupIDs) = objc_msgSend_count(requiredGroupMemberGroupIDs, a2, v2) != 0;
    }
  }
  else
  {
    LOBYTE(requiredGroupMemberGroupIDs) = 0;
  }
  return (char)requiredGroupMemberGroupIDs;
}

- (BOOL)isClassMemberSearch
{
  if (self->_options)
  {
    requiredClassMemberClassIDs = self->_requiredClassMemberClassIDs;
    if (!requiredClassMemberClassIDs) {
      return (char)requiredClassMemberClassIDs;
    }
    if (self->_requiredClassMemberRole)
    {
      LOBYTE(requiredClassMemberClassIDs) = objc_msgSend_count(requiredClassMemberClassIDs, a2, v2) != 0;
      return (char)requiredClassMemberClassIDs;
    }
  }
  LOBYTE(requiredClassMemberClassIDs) = 0;
  return (char)requiredClassMemberClassIDs;
}

- (void)sanitizeSpecForABMMAID
{
  unint64_t options = self->_options;
  if ((options & 2) != 0)
  {
    unint64_t v5 = self->_options;
    options ^= 2uLL;
    self->_unint64_t options = options;
    if ((v5 & 0x10) == 0)
    {
      if (qword_1EB5D4D10 != -1) {
        dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
      }
      uint64_t v6 = CLSLogSearch;
      if (os_log_type_enabled((os_log_t)CLSLogSearch, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_1DC60F000, v6, OS_LOG_TYPE_DEFAULT, "Search spec for ABM MAID included CLSSearchOptionsIncludeClasses - changing to groups", v11, 2u);
      }
      unint64_t options = self->_options | 0x10;
      self->_unint64_t options = options;
    }
  }
  requiredClassMemberClassIDs = self->_requiredClassMemberClassIDs;
  if (requiredClassMemberClassIDs)
  {
    uint64_t v8 = (NSArray *)objc_msgSend_copy(requiredClassMemberClassIDs, a2, v2);
    requiredGroupMemberGroupIDs = self->_requiredGroupMemberGroupIDs;
    self->_requiredGroupMemberGroupIDs = v8;

    uint64_t v10 = self->_requiredClassMemberClassIDs;
    self->_requiredClassMemberClassIDs = 0;

    self->_requiredClassMemberRole = 0;
    unint64_t options = self->_options;
  }
  objc_msgSend_setIncludeEmptyGroupsInResults_(self, a2, (options >> 5) & 1);
}

- (void)sanitizeSpecForEDUMAID
{
  unint64_t options = self->_options;
  if ((options & 0x10) != 0)
  {
    self->_unint64_t options = options ^ 0x10;
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    id v4 = CLSLogSearch;
    if (os_log_type_enabled((os_log_t)CLSLogSearch, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_error_impl(&dword_1DC60F000, v4, OS_LOG_TYPE_ERROR, "Search spec for EDU MAID included CLSSearchOptionsIncludeGroups - removing", v6, 2u);
    }
  }
  requiredGroupMemberGroupIDs = self->_requiredGroupMemberGroupIDs;
  if (requiredGroupMemberGroupIDs)
  {
    self->_requiredGroupMemberGroupIDs = 0;
  }
  objc_msgSend_setIncludeEmptyGroupsInResults_(self, a2, 1);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_unint64_t options = a3;
}

- (unint64_t)behaviors
{
  return self->_behaviors;
}

- (void)setBehaviors:(unint64_t)a3
{
  self->_behaviors = a3;
}

- (NSString)searchString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSearchString:(id)a3
{
}

- (void)setSearchTokens:(id)a3
{
}

- (unint64_t)compareOptions
{
  return self->_compareOptions;
}

- (void)setCompareOptions:(unint64_t)a3
{
  self->_compareOptions = a3;
}

- (CLSAdminRequestor)adminRequestor
{
  return (CLSAdminRequestor *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAdminRequestor:(id)a3
{
}

- (NSArray)classSortDescriptors
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setClassSortDescriptors:(id)a3
{
}

- (NSArray)classLocationIDs
{
  return self->_classLocationIDs;
}

- (void)setClassLocationIDs:(id)a3
{
}

- (NSArray)groupSortDescriptors
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setGroupSortDescriptors:(id)a3
{
}

- (NSArray)groupLocationIDs
{
  return self->_groupLocationIDs;
}

- (void)setGroupLocationIDs:(id)a3
{
}

- (BOOL)includeEmptyGroupsInResults
{
  return self->_includeEmptyGroupsInResults;
}

- (void)setIncludeEmptyGroupsInResults:(BOOL)a3
{
  self->_includeEmptyGroupsInResults = a3;
}

- (NSArray)requiredGroupMemberGroupIDs
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRequiredGroupMemberGroupIDs:(id)a3
{
}

- (BOOL)includeUnsearchablePersons
{
  return self->_includeUnsearchablePersons;
}

- (void)setIncludeUnsearchablePersons:(BOOL)a3
{
  self->_includeUnsearchablePersons = a3;
}

- (NSArray)personSortDescriptors
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPersonSortDescriptors:(id)a3
{
}

- (NSArray)personLocationIDs
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPersonLocationIDs:(id)a3
{
}

- (NSString)requiredRoleID
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setRequiredRoleID:(id)a3
{
}

- (int64_t)requiredRoleType
{
  return self->_requiredRoleType;
}

- (void)setRequiredRoleType:(int64_t)a3
{
  self->_int64_t requiredRoleType = a3;
}

- (NSString)requiredPrivilege
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setRequiredPrivilege:(id)a3
{
}

- (NSArray)requiredPrivilegeLocationIDs
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setRequiredPrivilegeLocationIDs:(id)a3
{
}

- (NSString)prohibitedPrivilege
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setProhibitedPrivilege:(id)a3
{
}

- (NSArray)prohibitedPrivilegeLocationIDs
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setProhibitedPrivilegeLocationIDs:(id)a3
{
}

- (NSArray)locationSortDescriptors
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setLocationSortDescriptors:(id)a3
{
}

- (NSArray)locationPersonIDs
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLocationPersonIDs:(id)a3
{
}

- (int64_t)requiredLocationRoleType
{
  return self->_requiredLocationRoleType;
}

- (void)setRequiredLocationRoleType:(int64_t)a3
{
  self->_requiredLocationRoleType = a3;
}

- (NSString)requiredLocationPrivilege
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setRequiredLocationPrivilege:(id)a3
{
}

- (NSArray)requiredLocationPersonIDs
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setRequiredLocationPersonIDs:(id)a3
{
}

- (NSString)prohibitedLocationPrivilege
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setProhibitedLocationPrivilege:(id)a3
{
}

- (NSArray)prohibitedLocationPersonIDs
{
  return (NSArray *)objc_getProperty(self, a2, 216, 1);
}

- (void)setProhibitedLocationPersonIDs:(id)a3
{
}

- (NSArray)organizationSortDescriptors
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (void)setOrganizationSortDescriptors:(id)a3
{
}

- (NSString)requiredOrganizationEmailDomain
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setRequiredOrganizationEmailDomain:(id)a3
{
}

- (NSArray)requiredClassMemberClassIDs
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setRequiredClassMemberClassIDs:(id)a3
{
}

- (unint64_t)requiredClassMemberRole
{
  return self->_requiredClassMemberRole;
}

- (void)setRequiredClassMemberRole:(unint64_t)a3
{
  self->_requiredClassMemberRole = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredClassMemberClassIDs, 0);
  objc_storeStrong((id *)&self->_requiredOrganizationEmailDomain, 0);
  objc_storeStrong((id *)&self->_organizationSortDescriptors, 0);
  objc_storeStrong((id *)&self->_prohibitedLocationPersonIDs, 0);
  objc_storeStrong((id *)&self->_prohibitedLocationPrivilege, 0);
  objc_storeStrong((id *)&self->_requiredLocationPersonIDs, 0);
  objc_storeStrong((id *)&self->_requiredLocationPrivilege, 0);
  objc_storeStrong((id *)&self->_locationPersonIDs, 0);
  objc_storeStrong((id *)&self->_locationSortDescriptors, 0);
  objc_storeStrong((id *)&self->_prohibitedPrivilegeLocationIDs, 0);
  objc_storeStrong((id *)&self->_prohibitedPrivilege, 0);
  objc_storeStrong((id *)&self->_requiredPrivilegeLocationIDs, 0);
  objc_storeStrong((id *)&self->_requiredPrivilege, 0);
  objc_storeStrong((id *)&self->_requiredRoleID, 0);
  objc_storeStrong((id *)&self->_personLocationIDs, 0);
  objc_storeStrong((id *)&self->_personSortDescriptors, 0);
  objc_storeStrong((id *)&self->_requiredGroupMemberGroupIDs, 0);
  objc_storeStrong((id *)&self->_groupLocationIDs, 0);
  objc_storeStrong((id *)&self->_groupSortDescriptors, 0);
  objc_storeStrong((id *)&self->_classLocationIDs, 0);
  objc_storeStrong((id *)&self->_classSortDescriptors, 0);
  objc_storeStrong((id *)&self->_adminRequestor, 0);
  objc_storeStrong((id *)&self->_searchTokens, 0);

  objc_storeStrong((id *)&self->_searchString, 0);
}

- (id)predicateForPersonsWithObjectIDs:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_includeUnsearchablePersons(self, v5, v6)) {
    objc_msgSend_predicateForObjectsWithObjectIDs_(CLSDataObserver, v7, (uint64_t)v4);
  }
  else {
  uint64_t v8 = objc_msgSend_predicateWithFormat_(MEMORY[0x1E4F28F60], v7, @"%K IN %@ && isSearchable == 1", @"objectID", v4);
  }

  return v8;
}

- (void)requireRoleType:(int64_t)a3 atLocationIDs:(id)a4
{
  id v11 = a4;
  char v9 = objc_msgSend_options(self, v7, v8);
  if (a3 && (v9 & 1) != 0)
  {
    requiredRoleID = self->_requiredRoleID;
    self->_requiredRoleID = 0;
    self->_int64_t requiredRoleType = a3;

    objc_storeStrong((id *)&self->_personLocationIDs, a4);
  }
}

- (void)requireRole:(id)a3 atLocationIDs:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (objc_msgSend_options(self, v7, v8))
  {
    self->_int64_t requiredRoleType = 0;
    if (v13)
    {
      objc_msgSend_objectID(v13, v9, v10);
      id v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      requiredRoleID = self->_requiredRoleID;
      self->_requiredRoleID = v11;
    }
    else
    {
      requiredRoleID = self->_requiredRoleID;
      self->_requiredRoleID = 0;
    }

    objc_storeStrong((id *)&self->_personLocationIDs, a4);
  }
}

- (void)requirePrivilege:(id)a3 atLocationIDs:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  if (objc_msgSend_options(self, v8, v9))
  {
    objc_storeStrong((id *)&self->_requiredPrivilege, a3);
    uint64_t v12 = (NSArray *)objc_msgSend_copy(v7, v10, v11);
    requiredPrivilegeLocationIDs = self->_requiredPrivilegeLocationIDs;
    self->_requiredPrivilegeLocationIDs = v12;
  }
}

- (void)prohibitPrivilege:(id)a3 atLocationIDs:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  if (objc_msgSend_options(self, v8, v9))
  {
    objc_storeStrong((id *)&self->_prohibitedPrivilege, a3);
    uint64_t v12 = (NSArray *)objc_msgSend_copy(v7, v10, v11);
    prohibitedPrivilegeLocationIDs = self->_prohibitedPrivilegeLocationIDs;
    self->_prohibitedPrivilegeLocationIDs = v12;
  }
}

- (void)restrictToClassesAtLocationIDs:(id)a3
{
  id v7 = a3;
  if ((objc_msgSend_options(self, v5, v6) & 2) != 0) {
    objc_storeStrong((id *)&self->_classLocationIDs, a3);
  }
}

- (void)restrictToGroupsAtLocationIDs:(id)a3
{
  id v7 = a3;
  if ((objc_msgSend_options(self, v5, v6) & 0x10) != 0) {
    objc_storeStrong((id *)&self->_groupLocationIDs, a3);
  }
}

- (void)requireRoleType:(int64_t)a3 onPersonIDs:(id)a4
{
  id v10 = a4;
  char v9 = objc_msgSend_options(self, v7, v8);
  if (a3 && (v9 & 4) != 0)
  {
    self->_requiredLocationRoleType = a3;
    objc_storeStrong((id *)&self->_locationPersonIDs, a4);
  }
}

- (void)requirePrivilege:(id)a3 onPersonIDs:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  if ((objc_msgSend_options(self, v8, v9) & 4) != 0)
  {
    objc_storeStrong((id *)&self->_requiredLocationPrivilege, a3);
    uint64_t v12 = (NSArray *)objc_msgSend_copy(v7, v10, v11);
    requiredLocationPersonIDs = self->_requiredLocationPersonIDs;
    self->_requiredLocationPersonIDs = v12;
  }
}

- (void)prohibitPrivilege:(id)a3 onPersonIDs:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  if ((objc_msgSend_options(self, v8, v9) & 4) != 0)
  {
    objc_storeStrong((id *)&self->_prohibitedLocationPrivilege, a3);
    uint64_t v12 = (NSArray *)objc_msgSend_copy(v7, v10, v11);
    prohibitedLocationPersonIDs = self->_prohibitedLocationPersonIDs;
    self->_prohibitedLocationPersonIDs = v12;
  }
}

- (void)restrictToOrganizationsMatchingEmailDomain:(id)a3
{
  id v7 = a3;
  if ((objc_msgSend_options(self, v5, v6) & 8) != 0) {
    objc_storeStrong((id *)&self->_requiredOrganizationEmailDomain, a3);
  }
}

- (void)requireClassMemberRole:(unint64_t)a3 forClassIDs:(id)a4
{
  id v12 = a4;
  if (objc_msgSend_options(self, v6, v7))
  {
    self->_requiredClassMemberRole = a3;
    id v10 = (NSArray *)objc_msgSend_copy(v12, v8, v9);
    requiredClassMemberClassIDs = self->_requiredClassMemberClassIDs;
    self->_requiredClassMemberClassIDs = v10;
  }
}

- (void)requireGroupMemberIDs:(id)a3
{
  id v10 = a3;
  if (objc_msgSend_options(self, v4, v5))
  {
    uint64_t v8 = (NSArray *)objc_msgSend_copy(v10, v6, v7);
    requiredGroupMemberGroupIDs = self->_requiredGroupMemberGroupIDs;
    self->_requiredGroupMemberGroupIDs = v8;
  }
}

@end