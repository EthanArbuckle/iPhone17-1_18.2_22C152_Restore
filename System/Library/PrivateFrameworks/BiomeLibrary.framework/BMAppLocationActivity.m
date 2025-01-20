@interface BMAppLocationActivity
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAppLocationActivity)initWithBundleID:(id)a3 activityType:(id)a4 beginningOfActivity:(id)a5 contentDescription:(id)a6 expirationDate:(id)a7 isEligibleForPrediction:(id)a8 isPubliclyIndexable:(id)a9 itemIdentifier:(id)a10 itemRelatedContentURL:(id)a11 itemRelatedUniqueIdentifier:(id)a12 shortcutAvailability:(id)a13 suggestedInvocationPhrase:(id)a14 title:(id)a15 userActivityRequiredString:(id)a16 userActivityUUID:(id)a17 sourceID:(id)a18 sourceBundleID:(id)a19 sourceItemID:(id)a20 sourceGroupID:(id)a21 calendarUserActivityDate:(id)a22 calendarUserActivityExternalID:(id)a23 calendarUserActivityEndDate:(id)a24 locationName:(id)a25 latitude:(id)a26 longitude:(id)a27 city:(id)a28 stateOrProvince:(id)a29 country:(id)a30 thoroughfare:(id)a31 fullyFormattedAddress:(id)a32 subThoroughfare:(id)a33 postalCode:(id)a34 phoneNumbers:(id)a35 displayName:(id)a36 URL:(id)a37;
- (BMAppLocationActivity)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)beginningOfActivity;
- (BOOL)hasBeginningOfActivity;
- (BOOL)hasIsEligibleForPrediction;
- (BOOL)hasIsPubliclyIndexable;
- (BOOL)hasLatitude;
- (BOOL)hasLongitude;
- (BOOL)hasShortcutAvailability;
- (BOOL)isEligibleForPrediction;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPubliclyIndexable;
- (NSArray)phoneNumbers;
- (NSDate)calendarUserActivityDate;
- (NSDate)calendarUserActivityEndDate;
- (NSDate)expirationDate;
- (NSString)activityType;
- (NSString)bundleID;
- (NSString)calendarUserActivityExternalID;
- (NSString)city;
- (NSString)contentDescription;
- (NSString)country;
- (NSString)description;
- (NSString)displayName;
- (NSString)fullyFormattedAddress;
- (NSString)itemIdentifier;
- (NSString)itemRelatedUniqueIdentifier;
- (NSString)locationName;
- (NSString)postalCode;
- (NSString)sourceBundleID;
- (NSString)sourceGroupID;
- (NSString)sourceID;
- (NSString)sourceItemID;
- (NSString)stateOrProvince;
- (NSString)subThoroughfare;
- (NSString)suggestedInvocationPhrase;
- (NSString)thoroughfare;
- (NSString)title;
- (NSString)userActivityRequiredString;
- (NSString)userActivityUUID;
- (NSURL)URL;
- (NSURL)itemRelatedContentURL;
- (double)latitude;
- (double)longitude;
- (id)_phoneNumbersJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)shortcutAvailability;
- (unsigned)dataVersion;
- (void)setHasBeginningOfActivity:(BOOL)a3;
- (void)setHasIsEligibleForPrediction:(BOOL)a3;
- (void)setHasIsPubliclyIndexable:(BOOL)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setHasShortcutAvailability:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMAppLocationActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
  objc_storeStrong((id *)&self->_fullyFormattedAddress, 0);
  objc_storeStrong((id *)&self->_thoroughfare, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_stateOrProvince, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_calendarUserActivityExternalID, 0);
  objc_storeStrong((id *)&self->_sourceGroupID, 0);
  objc_storeStrong((id *)&self->_sourceItemID, 0);
  objc_storeStrong((id *)&self->_sourceBundleID, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_userActivityUUID, 0);
  objc_storeStrong((id *)&self->_userActivityRequiredString, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_suggestedInvocationPhrase, 0);
  objc_storeStrong((id *)&self->_itemRelatedUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_contentDescription, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_raw_URL, 0);

  objc_storeStrong((id *)&self->_raw_itemRelatedContentURL, 0);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (NSString)subThoroughfare
{
  return self->_subThoroughfare;
}

- (NSString)fullyFormattedAddress
{
  return self->_fullyFormattedAddress;
}

- (NSString)thoroughfare
{
  return self->_thoroughfare;
}

- (NSString)country
{
  return self->_country;
}

- (NSString)stateOrProvince
{
  return self->_stateOrProvince;
}

- (NSString)city
{
  return self->_city;
}

- (void)setHasLongitude:(BOOL)a3
{
  self->_hasLongitude = a3;
}

- (BOOL)hasLongitude
{
  return self->_hasLongitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setHasLatitude:(BOOL)a3
{
  self->_hasLatitude = a3;
}

- (BOOL)hasLatitude
{
  return self->_hasLatitude;
}

- (double)latitude
{
  return self->_latitude;
}

- (NSString)locationName
{
  return self->_locationName;
}

- (NSString)calendarUserActivityExternalID
{
  return self->_calendarUserActivityExternalID;
}

- (NSString)sourceGroupID
{
  return self->_sourceGroupID;
}

- (NSString)sourceItemID
{
  return self->_sourceItemID;
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (NSString)sourceID
{
  return self->_sourceID;
}

- (NSString)userActivityUUID
{
  return self->_userActivityUUID;
}

- (NSString)userActivityRequiredString
{
  return self->_userActivityRequiredString;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)suggestedInvocationPhrase
{
  return self->_suggestedInvocationPhrase;
}

- (void)setHasShortcutAvailability:(BOOL)a3
{
  self->_hasShortcutAvailability = a3;
}

- (BOOL)hasShortcutAvailability
{
  return self->_hasShortcutAvailability;
}

- (int)shortcutAvailability
{
  return self->_shortcutAvailability;
}

- (NSString)itemRelatedUniqueIdentifier
{
  return self->_itemRelatedUniqueIdentifier;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setHasIsPubliclyIndexable:(BOOL)a3
{
  self->_hasIsPubliclyIndexable = a3;
}

- (BOOL)hasIsPubliclyIndexable
{
  return self->_hasIsPubliclyIndexable;
}

- (BOOL)isPubliclyIndexable
{
  return self->_isPubliclyIndexable;
}

- (void)setHasIsEligibleForPrediction:(BOOL)a3
{
  self->_hasIsEligibleForPrediction = a3;
}

- (BOOL)hasIsEligibleForPrediction
{
  return self->_hasIsEligibleForPrediction;
}

- (BOOL)isEligibleForPrediction
{
  return self->_isEligibleForPrediction;
}

- (NSString)contentDescription
{
  return self->_contentDescription;
}

- (void)setHasBeginningOfActivity:(BOOL)a3
{
  self->_hasBeginningOfActivity = a3;
}

- (BOOL)hasBeginningOfActivity
{
  return self->_hasBeginningOfActivity;
}

- (BOOL)beginningOfActivity
{
  return self->_beginningOfActivity;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMAppLocationActivity *)self bundleID];
    uint64_t v7 = [v5 bundleID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMAppLocationActivity *)self bundleID];
      v10 = [v5 bundleID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_143;
      }
    }
    v13 = [(BMAppLocationActivity *)self activityType];
    uint64_t v14 = [v5 activityType];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMAppLocationActivity *)self activityType];
      v17 = [v5 activityType];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_143;
      }
    }
    if ([(BMAppLocationActivity *)self hasBeginningOfActivity]
      || [v5 hasBeginningOfActivity])
    {
      if (![(BMAppLocationActivity *)self hasBeginningOfActivity]) {
        goto LABEL_143;
      }
      if (![v5 hasBeginningOfActivity]) {
        goto LABEL_143;
      }
      int v19 = [(BMAppLocationActivity *)self beginningOfActivity];
      if (v19 != [v5 beginningOfActivity]) {
        goto LABEL_143;
      }
    }
    v20 = [(BMAppLocationActivity *)self contentDescription];
    uint64_t v21 = [v5 contentDescription];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      v23 = [(BMAppLocationActivity *)self contentDescription];
      v24 = [v5 contentDescription];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_143;
      }
    }
    v26 = [(BMAppLocationActivity *)self expirationDate];
    uint64_t v27 = [v5 expirationDate];
    if (v26 == (void *)v27)
    {
    }
    else
    {
      v28 = (void *)v27;
      v29 = [(BMAppLocationActivity *)self expirationDate];
      v30 = [v5 expirationDate];
      int v31 = [v29 isEqual:v30];

      if (!v31) {
        goto LABEL_143;
      }
    }
    if ([(BMAppLocationActivity *)self hasIsEligibleForPrediction]
      || [v5 hasIsEligibleForPrediction])
    {
      if (![(BMAppLocationActivity *)self hasIsEligibleForPrediction]) {
        goto LABEL_143;
      }
      if (![v5 hasIsEligibleForPrediction]) {
        goto LABEL_143;
      }
      int v32 = [(BMAppLocationActivity *)self isEligibleForPrediction];
      if (v32 != [v5 isEligibleForPrediction]) {
        goto LABEL_143;
      }
    }
    if ([(BMAppLocationActivity *)self hasIsPubliclyIndexable]
      || [v5 hasIsPubliclyIndexable])
    {
      if (![(BMAppLocationActivity *)self hasIsPubliclyIndexable]) {
        goto LABEL_143;
      }
      if (![v5 hasIsPubliclyIndexable]) {
        goto LABEL_143;
      }
      int v33 = [(BMAppLocationActivity *)self isPubliclyIndexable];
      if (v33 != [v5 isPubliclyIndexable]) {
        goto LABEL_143;
      }
    }
    v34 = [(BMAppLocationActivity *)self itemIdentifier];
    uint64_t v35 = [v5 itemIdentifier];
    if (v34 == (void *)v35)
    {
    }
    else
    {
      v36 = (void *)v35;
      v37 = [(BMAppLocationActivity *)self itemIdentifier];
      v38 = [v5 itemIdentifier];
      int v39 = [v37 isEqual:v38];

      if (!v39) {
        goto LABEL_143;
      }
    }
    v40 = [(BMAppLocationActivity *)self itemRelatedContentURL];
    uint64_t v41 = [v5 itemRelatedContentURL];
    if (v40 == (void *)v41)
    {
    }
    else
    {
      v42 = (void *)v41;
      v43 = [(BMAppLocationActivity *)self itemRelatedContentURL];
      v44 = [v5 itemRelatedContentURL];
      int v45 = [v43 isEqual:v44];

      if (!v45) {
        goto LABEL_143;
      }
    }
    v46 = [(BMAppLocationActivity *)self itemRelatedUniqueIdentifier];
    uint64_t v47 = [v5 itemRelatedUniqueIdentifier];
    if (v46 == (void *)v47)
    {
    }
    else
    {
      v48 = (void *)v47;
      v49 = [(BMAppLocationActivity *)self itemRelatedUniqueIdentifier];
      v50 = [v5 itemRelatedUniqueIdentifier];
      int v51 = [v49 isEqual:v50];

      if (!v51) {
        goto LABEL_143;
      }
    }
    if ([(BMAppLocationActivity *)self hasShortcutAvailability]
      || [v5 hasShortcutAvailability])
    {
      if (![(BMAppLocationActivity *)self hasShortcutAvailability]) {
        goto LABEL_143;
      }
      if (![v5 hasShortcutAvailability]) {
        goto LABEL_143;
      }
      int v52 = [(BMAppLocationActivity *)self shortcutAvailability];
      if (v52 != [v5 shortcutAvailability]) {
        goto LABEL_143;
      }
    }
    v53 = [(BMAppLocationActivity *)self suggestedInvocationPhrase];
    uint64_t v54 = [v5 suggestedInvocationPhrase];
    if (v53 == (void *)v54)
    {
    }
    else
    {
      v55 = (void *)v54;
      v56 = [(BMAppLocationActivity *)self suggestedInvocationPhrase];
      v57 = [v5 suggestedInvocationPhrase];
      int v58 = [v56 isEqual:v57];

      if (!v58) {
        goto LABEL_143;
      }
    }
    v59 = [(BMAppLocationActivity *)self title];
    uint64_t v60 = [v5 title];
    if (v59 == (void *)v60)
    {
    }
    else
    {
      v61 = (void *)v60;
      v62 = [(BMAppLocationActivity *)self title];
      v63 = [v5 title];
      int v64 = [v62 isEqual:v63];

      if (!v64) {
        goto LABEL_143;
      }
    }
    v65 = [(BMAppLocationActivity *)self userActivityRequiredString];
    uint64_t v66 = [v5 userActivityRequiredString];
    if (v65 == (void *)v66)
    {
    }
    else
    {
      v67 = (void *)v66;
      v68 = [(BMAppLocationActivity *)self userActivityRequiredString];
      v69 = [v5 userActivityRequiredString];
      int v70 = [v68 isEqual:v69];

      if (!v70) {
        goto LABEL_143;
      }
    }
    v71 = [(BMAppLocationActivity *)self userActivityUUID];
    uint64_t v72 = [v5 userActivityUUID];
    if (v71 == (void *)v72)
    {
    }
    else
    {
      v73 = (void *)v72;
      v74 = [(BMAppLocationActivity *)self userActivityUUID];
      v75 = [v5 userActivityUUID];
      int v76 = [v74 isEqual:v75];

      if (!v76) {
        goto LABEL_143;
      }
    }
    v77 = [(BMAppLocationActivity *)self sourceID];
    uint64_t v78 = [v5 sourceID];
    if (v77 == (void *)v78)
    {
    }
    else
    {
      v79 = (void *)v78;
      v80 = [(BMAppLocationActivity *)self sourceID];
      v81 = [v5 sourceID];
      int v82 = [v80 isEqual:v81];

      if (!v82) {
        goto LABEL_143;
      }
    }
    v83 = [(BMAppLocationActivity *)self sourceBundleID];
    uint64_t v84 = [v5 sourceBundleID];
    if (v83 == (void *)v84)
    {
    }
    else
    {
      v85 = (void *)v84;
      v86 = [(BMAppLocationActivity *)self sourceBundleID];
      v87 = [v5 sourceBundleID];
      int v88 = [v86 isEqual:v87];

      if (!v88) {
        goto LABEL_143;
      }
    }
    v89 = [(BMAppLocationActivity *)self sourceItemID];
    uint64_t v90 = [v5 sourceItemID];
    if (v89 == (void *)v90)
    {
    }
    else
    {
      v91 = (void *)v90;
      v92 = [(BMAppLocationActivity *)self sourceItemID];
      v93 = [v5 sourceItemID];
      int v94 = [v92 isEqual:v93];

      if (!v94) {
        goto LABEL_143;
      }
    }
    v95 = [(BMAppLocationActivity *)self sourceGroupID];
    uint64_t v96 = [v5 sourceGroupID];
    if (v95 == (void *)v96)
    {
    }
    else
    {
      v97 = (void *)v96;
      v98 = [(BMAppLocationActivity *)self sourceGroupID];
      v99 = [v5 sourceGroupID];
      int v100 = [v98 isEqual:v99];

      if (!v100) {
        goto LABEL_143;
      }
    }
    v101 = [(BMAppLocationActivity *)self calendarUserActivityDate];
    uint64_t v102 = [v5 calendarUserActivityDate];
    if (v101 == (void *)v102)
    {
    }
    else
    {
      v103 = (void *)v102;
      v104 = [(BMAppLocationActivity *)self calendarUserActivityDate];
      v105 = [v5 calendarUserActivityDate];
      int v106 = [v104 isEqual:v105];

      if (!v106) {
        goto LABEL_143;
      }
    }
    v107 = [(BMAppLocationActivity *)self calendarUserActivityExternalID];
    uint64_t v108 = [v5 calendarUserActivityExternalID];
    if (v107 == (void *)v108)
    {
    }
    else
    {
      v109 = (void *)v108;
      v110 = [(BMAppLocationActivity *)self calendarUserActivityExternalID];
      v111 = [v5 calendarUserActivityExternalID];
      int v112 = [v110 isEqual:v111];

      if (!v112) {
        goto LABEL_143;
      }
    }
    v113 = [(BMAppLocationActivity *)self calendarUserActivityEndDate];
    uint64_t v114 = [v5 calendarUserActivityEndDate];
    if (v113 == (void *)v114)
    {
    }
    else
    {
      v115 = (void *)v114;
      v116 = [(BMAppLocationActivity *)self calendarUserActivityEndDate];
      v117 = [v5 calendarUserActivityEndDate];
      int v118 = [v116 isEqual:v117];

      if (!v118) {
        goto LABEL_143;
      }
    }
    v119 = [(BMAppLocationActivity *)self locationName];
    uint64_t v120 = [v5 locationName];
    if (v119 == (void *)v120)
    {
    }
    else
    {
      v121 = (void *)v120;
      v122 = [(BMAppLocationActivity *)self locationName];
      v123 = [v5 locationName];
      int v124 = [v122 isEqual:v123];

      if (!v124) {
        goto LABEL_143;
      }
    }
    if (-[BMAppLocationActivity hasLatitude](self, "hasLatitude") || [v5 hasLatitude])
    {
      if (![(BMAppLocationActivity *)self hasLatitude]) {
        goto LABEL_143;
      }
      if (![v5 hasLatitude]) {
        goto LABEL_143;
      }
      [(BMAppLocationActivity *)self latitude];
      double v126 = v125;
      [v5 latitude];
      if (v126 != v127) {
        goto LABEL_143;
      }
    }
    if (-[BMAppLocationActivity hasLongitude](self, "hasLongitude") || [v5 hasLongitude])
    {
      if (![(BMAppLocationActivity *)self hasLongitude]) {
        goto LABEL_143;
      }
      if (![v5 hasLongitude]) {
        goto LABEL_143;
      }
      [(BMAppLocationActivity *)self longitude];
      double v129 = v128;
      [v5 longitude];
      if (v129 != v130) {
        goto LABEL_143;
      }
    }
    v131 = [(BMAppLocationActivity *)self city];
    uint64_t v132 = [v5 city];
    if (v131 == (void *)v132)
    {
    }
    else
    {
      v133 = (void *)v132;
      v134 = [(BMAppLocationActivity *)self city];
      v135 = [v5 city];
      int v136 = [v134 isEqual:v135];

      if (!v136) {
        goto LABEL_143;
      }
    }
    v137 = [(BMAppLocationActivity *)self stateOrProvince];
    uint64_t v138 = [v5 stateOrProvince];
    if (v137 == (void *)v138)
    {
    }
    else
    {
      v139 = (void *)v138;
      v140 = [(BMAppLocationActivity *)self stateOrProvince];
      v141 = [v5 stateOrProvince];
      int v142 = [v140 isEqual:v141];

      if (!v142) {
        goto LABEL_143;
      }
    }
    v143 = [(BMAppLocationActivity *)self country];
    uint64_t v144 = [v5 country];
    if (v143 == (void *)v144)
    {
    }
    else
    {
      v145 = (void *)v144;
      v146 = [(BMAppLocationActivity *)self country];
      v147 = [v5 country];
      int v148 = [v146 isEqual:v147];

      if (!v148) {
        goto LABEL_143;
      }
    }
    v149 = [(BMAppLocationActivity *)self thoroughfare];
    uint64_t v150 = [v5 thoroughfare];
    if (v149 == (void *)v150)
    {
    }
    else
    {
      v151 = (void *)v150;
      v152 = [(BMAppLocationActivity *)self thoroughfare];
      v153 = [v5 thoroughfare];
      int v154 = [v152 isEqual:v153];

      if (!v154) {
        goto LABEL_143;
      }
    }
    v155 = [(BMAppLocationActivity *)self fullyFormattedAddress];
    uint64_t v156 = [v5 fullyFormattedAddress];
    if (v155 == (void *)v156)
    {
    }
    else
    {
      v157 = (void *)v156;
      v158 = [(BMAppLocationActivity *)self fullyFormattedAddress];
      v159 = [v5 fullyFormattedAddress];
      int v160 = [v158 isEqual:v159];

      if (!v160) {
        goto LABEL_143;
      }
    }
    v161 = [(BMAppLocationActivity *)self subThoroughfare];
    uint64_t v162 = [v5 subThoroughfare];
    if (v161 == (void *)v162)
    {
    }
    else
    {
      v163 = (void *)v162;
      v164 = [(BMAppLocationActivity *)self subThoroughfare];
      v165 = [v5 subThoroughfare];
      int v166 = [v164 isEqual:v165];

      if (!v166) {
        goto LABEL_143;
      }
    }
    v167 = [(BMAppLocationActivity *)self postalCode];
    uint64_t v168 = [v5 postalCode];
    if (v167 == (void *)v168)
    {
    }
    else
    {
      v169 = (void *)v168;
      v170 = [(BMAppLocationActivity *)self postalCode];
      v171 = [v5 postalCode];
      int v172 = [v170 isEqual:v171];

      if (!v172) {
        goto LABEL_143;
      }
    }
    v173 = [(BMAppLocationActivity *)self phoneNumbers];
    uint64_t v174 = [v5 phoneNumbers];
    if (v173 == (void *)v174)
    {
    }
    else
    {
      v175 = (void *)v174;
      v176 = [(BMAppLocationActivity *)self phoneNumbers];
      v177 = [v5 phoneNumbers];
      int v178 = [v176 isEqual:v177];

      if (!v178) {
        goto LABEL_143;
      }
    }
    v179 = [(BMAppLocationActivity *)self displayName];
    uint64_t v180 = [v5 displayName];
    if (v179 == (void *)v180)
    {
    }
    else
    {
      v181 = (void *)v180;
      v182 = [(BMAppLocationActivity *)self displayName];
      v183 = [v5 displayName];
      int v184 = [v182 isEqual:v183];

      if (!v184)
      {
LABEL_143:
        char v12 = 0;
LABEL_144:

        goto LABEL_145;
      }
    }
    v186 = [(BMAppLocationActivity *)self URL];
    v187 = [v5 URL];
    if (v186 == v187)
    {
      char v12 = 1;
    }
    else
    {
      v188 = [(BMAppLocationActivity *)self URL];
      v189 = [v5 URL];
      char v12 = [v188 isEqual:v189];
    }
    goto LABEL_144;
  }
  char v12 = 0;
LABEL_145:

  return v12;
}

- (NSURL)URL
{
  raw_URL = self->_raw_URL;
  if (raw_URL)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_URL toType:4];
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSDate)calendarUserActivityEndDate
{
  if (self->_hasRaw_calendarUserActivityEndDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_calendarUserActivityEndDate];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)calendarUserActivityDate
{
  if (self->_hasRaw_calendarUserActivityDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_calendarUserActivityDate];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSURL)itemRelatedContentURL
{
  raw_itemRelatedContentURL = self->_raw_itemRelatedContentURL;
  if (raw_itemRelatedContentURL)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_itemRelatedContentURL toType:4];
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSDate)expirationDate
{
  if (self->_hasRaw_expirationDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_expirationDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v125[35] = *MEMORY[0x1E4F143B8];
  v3 = [(BMAppLocationActivity *)self bundleID];
  uint64_t v4 = [(BMAppLocationActivity *)self activityType];
  if ([(BMAppLocationActivity *)self hasBeginningOfActivity])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAppLocationActivity beginningOfActivity](self, "beginningOfActivity"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = [(BMAppLocationActivity *)self contentDescription];
  uint64_t v7 = [(BMAppLocationActivity *)self expirationDate];
  if (v7)
  {
    v8 = NSNumber;
    v9 = [(BMAppLocationActivity *)self expirationDate];
    [v9 timeIntervalSince1970];
    objc_msgSend(v8, "numberWithDouble:");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }

  if ([(BMAppLocationActivity *)self hasIsEligibleForPrediction])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAppLocationActivity isEligibleForPrediction](self, "isEligibleForPrediction"));
    id v123 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v123 = 0;
  }
  if ([(BMAppLocationActivity *)self hasIsPubliclyIndexable])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAppLocationActivity isPubliclyIndexable](self, "isPubliclyIndexable"));
    id v122 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v122 = 0;
  }
  v121 = [(BMAppLocationActivity *)self itemIdentifier];
  int v11 = [(BMAppLocationActivity *)self itemRelatedContentURL];
  uint64_t v120 = [v11 absoluteString];

  v119 = [(BMAppLocationActivity *)self itemRelatedUniqueIdentifier];
  if ([(BMAppLocationActivity *)self hasShortcutAvailability])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMAppLocationActivity shortcutAvailability](self, "shortcutAvailability"));
    id v118 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v118 = 0;
  }
  v117 = [(BMAppLocationActivity *)self suggestedInvocationPhrase];
  v116 = [(BMAppLocationActivity *)self title];
  v115 = [(BMAppLocationActivity *)self userActivityRequiredString];
  uint64_t v114 = [(BMAppLocationActivity *)self userActivityUUID];
  v113 = [(BMAppLocationActivity *)self sourceID];
  int v112 = [(BMAppLocationActivity *)self sourceBundleID];
  v111 = [(BMAppLocationActivity *)self sourceItemID];
  v110 = [(BMAppLocationActivity *)self sourceGroupID];
  char v12 = [(BMAppLocationActivity *)self calendarUserActivityDate];
  if (v12)
  {
    v13 = NSNumber;
    uint64_t v14 = [(BMAppLocationActivity *)self calendarUserActivityDate];
    [v14 timeIntervalSinceReferenceDate];
    objc_msgSend(v13, "numberWithDouble:");
    id v109 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v109 = 0;
  }

  uint64_t v108 = [(BMAppLocationActivity *)self calendarUserActivityExternalID];
  v15 = [(BMAppLocationActivity *)self calendarUserActivityEndDate];
  if (v15)
  {
    v16 = NSNumber;
    v17 = [(BMAppLocationActivity *)self calendarUserActivityEndDate];
    [v17 timeIntervalSinceReferenceDate];
    objc_msgSend(v16, "numberWithDouble:");
    id v107 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v107 = 0;
  }

  int v106 = [(BMAppLocationActivity *)self locationName];
  if (![(BMAppLocationActivity *)self hasLatitude]
    || ([(BMAppLocationActivity *)self latitude], fabs(v18) == INFINITY))
  {
    id v105 = 0;
  }
  else
  {
    [(BMAppLocationActivity *)self latitude];
    int v19 = NSNumber;
    [(BMAppLocationActivity *)self latitude];
    objc_msgSend(v19, "numberWithDouble:");
    id v105 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAppLocationActivity *)self hasLongitude]
    || ([(BMAppLocationActivity *)self longitude], fabs(v20) == INFINITY))
  {
    id v22 = 0;
  }
  else
  {
    [(BMAppLocationActivity *)self longitude];
    uint64_t v21 = NSNumber;
    [(BMAppLocationActivity *)self longitude];
    objc_msgSend(v21, "numberWithDouble:");
    id v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v104 = [(BMAppLocationActivity *)self city];
  v103 = [(BMAppLocationActivity *)self stateOrProvince];
  uint64_t v102 = [(BMAppLocationActivity *)self country];
  v101 = [(BMAppLocationActivity *)self thoroughfare];
  int v100 = [(BMAppLocationActivity *)self fullyFormattedAddress];
  v99 = [(BMAppLocationActivity *)self subThoroughfare];
  v98 = [(BMAppLocationActivity *)self postalCode];
  v97 = [(BMAppLocationActivity *)self _phoneNumbersJSONArray];
  uint64_t v96 = [(BMAppLocationActivity *)self displayName];
  v23 = [(BMAppLocationActivity *)self URL];
  uint64_t v24 = [v23 absoluteString];

  v124[0] = @"bundleID";
  uint64_t v25 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v85 = (void *)v25;
  v125[0] = v25;
  v124[1] = @"activityType";
  uint64_t v26 = v4;
  if (!v4)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v84 = (void *)v26;
  v125[1] = v26;
  v124[2] = @"beginningOfActivity";
  uint64_t v27 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v83 = (void *)v27;
  v125[2] = v27;
  v124[3] = @"contentDescription";
  uint64_t v28 = v6;
  if (!v6)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  int v82 = (void *)v28;
  v125[3] = v28;
  v124[4] = @"expirationDate";
  uint64_t v29 = (uint64_t)v10;
  if (!v10)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v81 = (void *)v29;
  v125[4] = v29;
  v124[5] = @"isEligibleForPrediction";
  uint64_t v30 = (uint64_t)v123;
  if (!v123)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v87 = (void *)v6;
  v125[5] = v30;
  v124[6] = @"isPubliclyIndexable";
  uint64_t v31 = (uint64_t)v122;
  if (!v122)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v125[6] = v31;
  v124[7] = @"itemIdentifier";
  int v32 = v121;
  if (!v121)
  {
    int v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v125[7] = v32;
  v124[8] = @"itemRelatedContentURL";
  uint64_t v33 = (uint64_t)v120;
  if (!v120)
  {
    uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v91 = (void *)v33;
  v125[8] = v33;
  v124[9] = @"itemRelatedUniqueIdentifier";
  uint64_t v34 = (uint64_t)v119;
  if (!v119)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v78 = (void *)v34;
  v125[9] = v34;
  v124[10] = @"shortcutAvailability";
  uint64_t v35 = (uint64_t)v118;
  if (!v118)
  {
    uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v90 = (void *)v35;
  v125[10] = v35;
  v124[11] = @"suggestedInvocationPhrase";
  uint64_t v36 = (uint64_t)v117;
  if (!v117)
  {
    uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
  }
  v89 = (void *)v36;
  v125[11] = v36;
  v124[12] = @"title";
  uint64_t v37 = (uint64_t)v116;
  if (!v116)
  {
    uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
  }
  v38 = (void *)v37;
  v125[12] = v37;
  v124[13] = @"userActivityRequiredString";
  uint64_t v39 = (uint64_t)v115;
  if (!v115)
  {
    uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
  }
  v77 = (void *)v39;
  v125[13] = v39;
  v124[14] = @"userActivityUUID";
  uint64_t v40 = (uint64_t)v114;
  if (!v114)
  {
    uint64_t v40 = [MEMORY[0x1E4F1CA98] null];
  }
  int v76 = (void *)v40;
  v125[14] = v40;
  v124[15] = @"sourceID";
  uint64_t v41 = (uint64_t)v113;
  if (!v113)
  {
    uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
  }
  v75 = (void *)v41;
  v125[15] = v41;
  v124[16] = @"sourceBundleID";
  uint64_t v42 = (uint64_t)v112;
  if (!v112)
  {
    uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
  }
  v74 = (void *)v42;
  v125[16] = v42;
  v124[17] = @"sourceItemID";
  uint64_t v43 = (uint64_t)v111;
  if (!v111)
  {
    uint64_t v43 = [MEMORY[0x1E4F1CA98] null];
  }
  v73 = (void *)v43;
  v125[17] = v43;
  v124[18] = @"sourceGroupID";
  uint64_t v44 = (uint64_t)v110;
  if (!v110)
  {
    uint64_t v44 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v72 = (void *)v44;
  v125[18] = v44;
  v124[19] = @"calendarUserActivityDate";
  uint64_t v45 = (uint64_t)v109;
  if (!v109)
  {
    uint64_t v45 = [MEMORY[0x1E4F1CA98] null];
  }
  v71 = (void *)v45;
  v125[19] = v45;
  v124[20] = @"calendarUserActivityExternalID";
  uint64_t v46 = (uint64_t)v108;
  if (!v108)
  {
    uint64_t v46 = [MEMORY[0x1E4F1CA98] null];
  }
  int v70 = (void *)v46;
  v125[20] = v46;
  v124[21] = @"calendarUserActivityEndDate";
  uint64_t v47 = (uint64_t)v107;
  if (!v107)
  {
    uint64_t v47 = [MEMORY[0x1E4F1CA98] null];
  }
  v69 = (void *)v47;
  v125[21] = v47;
  v124[22] = @"locationName";
  uint64_t v48 = (uint64_t)v106;
  if (!v106)
  {
    uint64_t v48 = [MEMORY[0x1E4F1CA98] null];
  }
  v68 = (void *)v48;
  v125[22] = v48;
  v124[23] = @"latitude";
  uint64_t v49 = (uint64_t)v105;
  if (!v105)
  {
    uint64_t v49 = [MEMORY[0x1E4F1CA98] null];
  }
  int v94 = (void *)v4;
  v67 = (void *)v49;
  v125[23] = v49;
  v124[24] = @"longitude";
  uint64_t v50 = (uint64_t)v22;
  if (!v22)
  {
    uint64_t v50 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v66 = (void *)v50;
  v125[24] = v50;
  v124[25] = @"city";
  uint64_t v51 = (uint64_t)v104;
  if (!v104)
  {
    uint64_t v51 = [MEMORY[0x1E4F1CA98] null];
  }
  v65 = (void *)v51;
  v125[25] = v51;
  v124[26] = @"stateOrProvince";
  uint64_t v52 = (uint64_t)v103;
  if (!v103)
  {
    uint64_t v52 = [MEMORY[0x1E4F1CA98] null];
  }
  int v64 = (void *)v52;
  v125[26] = v52;
  v124[27] = @"country";
  uint64_t v53 = (uint64_t)v102;
  if (!v102)
  {
    uint64_t v53 = [MEMORY[0x1E4F1CA98] null];
  }
  v95 = (void *)v24;
  v63 = (void *)v53;
  v125[27] = v53;
  v124[28] = @"thoroughfare";
  uint64_t v54 = v101;
  if (!v101)
  {
    uint64_t v54 = [MEMORY[0x1E4F1CA98] null];
  }
  v92 = v22;
  v93 = v5;
  v125[28] = v54;
  v124[29] = @"fullyFormattedAddress";
  v55 = v100;
  if (!v100)
  {
    v55 = [MEMORY[0x1E4F1CA98] null];
  }
  int v88 = v10;
  v125[29] = v55;
  v124[30] = @"subThoroughfare";
  v56 = v99;
  if (!v99)
  {
    v56 = [MEMORY[0x1E4F1CA98] null];
  }
  v79 = (void *)v31;
  v125[30] = v56;
  v124[31] = @"postalCode";
  v57 = v98;
  if (!v98)
  {
    v57 = [MEMORY[0x1E4F1CA98] null];
  }
  v125[31] = v57;
  v124[32] = @"phoneNumbers";
  int v58 = v97;
  if (!v97)
  {
    int v58 = [MEMORY[0x1E4F1CA98] null];
  }
  v80 = (void *)v30;
  v125[32] = v58;
  v124[33] = @"displayName";
  v59 = v96;
  if (!v96)
  {
    v59 = [MEMORY[0x1E4F1CA98] null];
  }
  v125[33] = v59;
  v124[34] = @"URL";
  uint64_t v60 = v95;
  if (!v95)
  {
    uint64_t v60 = [MEMORY[0x1E4F1CA98] null];
  }
  v125[34] = v60;
  id v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v125 forKeys:v124 count:35];
  if (!v95) {

  }
  v61 = v38;
  if (!v96)
  {

    v61 = v38;
  }
  if (!v97)
  {

    v61 = v38;
  }
  if (!v98)
  {

    v61 = v38;
  }
  if (!v99)
  {

    v61 = v38;
  }
  if (!v100)
  {

    v61 = v38;
  }
  if (!v101)
  {

    v61 = v38;
  }
  if (!v102)
  {

    v61 = v38;
  }
  if (!v103)
  {

    v61 = v38;
  }
  if (v104)
  {
    if (v92) {
      goto LABEL_120;
    }
  }
  else
  {

    v61 = v38;
    if (v92) {
      goto LABEL_120;
    }
  }

  v61 = v38;
LABEL_120:
  if (!v105)
  {

    v61 = v38;
  }
  if (!v106)
  {

    v61 = v38;
  }
  if (!v107)
  {

    v61 = v38;
  }
  if (!v108)
  {

    v61 = v38;
  }
  if (!v109)
  {

    v61 = v38;
  }
  if (!v110)
  {

    v61 = v38;
  }
  if (!v111)
  {

    v61 = v38;
  }
  if (!v112)
  {

    v61 = v38;
  }
  if (!v113)
  {

    v61 = v38;
  }
  if (!v114)
  {

    v61 = v38;
  }
  if (!v115)
  {

    v61 = v38;
  }
  if (!v116) {

  }
  if (!v117) {
  if (!v118)
  }

  if (!v119) {
  if (!v120)
  }

  if (!v121) {
  if (!v122)
  }

  if (v123)
  {
    if (v88) {
      goto LABEL_158;
    }
  }
  else
  {

    if (v88)
    {
LABEL_158:
      if (v87) {
        goto LABEL_159;
      }
      goto LABEL_169;
    }
  }

  if (v87)
  {
LABEL_159:
    if (v93) {
      goto LABEL_160;
    }
    goto LABEL_170;
  }
LABEL_169:

  if (v93)
  {
LABEL_160:
    if (v94) {
      goto LABEL_161;
    }
LABEL_171:

    if (v3) {
      goto LABEL_162;
    }
    goto LABEL_172;
  }
LABEL_170:

  if (!v94) {
    goto LABEL_171;
  }
LABEL_161:
  if (v3) {
    goto LABEL_162;
  }
LABEL_172:

LABEL_162:

  return v86;
}

- (id)_phoneNumbersJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMAppLocationActivity *)self phoneNumbers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMAppLocationActivity)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v384[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"bundleID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v301 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v301 = v7;
LABEL_4:
    v8 = [v6 objectForKeyedSubscript:@"activityType"];
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v300 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v300 = v8;
LABEL_7:
      v9 = [v6 objectForKeyedSubscript:@"beginningOfActivity"];
      if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v297 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v297 = v9;
LABEL_10:
        uint64_t v10 = [v6 objectForKeyedSubscript:@"contentDescription"];
        v299 = (void *)v10;
        if (!v10 || (long long v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v298 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v298 = v11;
LABEL_13:
          uint64_t v12 = [v6 objectForKeyedSubscript:@"expirationDate"];
          v296 = (void *)v12;
          if (!v12 || (long long v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v294 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v30 = v13;
            id v31 = objc_alloc(MEMORY[0x1E4F1C9C8]);
            [v30 doubleValue];
            id v294 = (id)objc_msgSend(v31, "initWithTimeIntervalSince1970:");

            goto LABEL_16;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v54 = objc_alloc_init(MEMORY[0x1E4F28D48]);
            id v55 = v13;
            id v294 = [v54 dateFromString:v55];

            goto LABEL_16;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v294 = v13;
LABEL_16:
            uint64_t v14 = [v6 objectForKeyedSubscript:@"isEligibleForPrediction"];
            v293 = (void *)v14;
            if (!v14 || (uint64_t v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v292 = 0;
              goto LABEL_19;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v292 = v15;
LABEL_19:
              uint64_t v16 = [v6 objectForKeyedSubscript:@"isPubliclyIndexable"];
              v288 = self;
              v291 = (void *)v16;
              if (!v16 || (v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v284 = v7;
                double v18 = v8;
                id v290 = 0;
                goto LABEL_22;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v284 = v7;
                double v18 = v8;
                id v290 = v17;
LABEL_22:
                int v19 = v9;
                double v20 = [v6 objectForKeyedSubscript:@"itemIdentifier"];
                v289 = v20;
                uint64_t v21 = a4;
                if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v22 = 0;
                  goto LABEL_25;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v22 = v20;
LABEL_25:
                  uint64_t v23 = [v6 objectForKeyedSubscript:@"itemRelatedContentURL"];
                  v287 = v22;
                  v286 = (void *)v23;
                  if (!v23 || (uint64_t v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    uint64_t v25 = 0;
LABEL_28:
                    v283 = v25;
                    uint64_t v26 = [v6 objectForKeyedSubscript:@"itemRelatedUniqueIdentifier"];
                    v282 = (void *)v26;
                    v280 = v21;
                    if (v26 && (uint64_t v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      v9 = v19;
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        v8 = v18;
                        if (!v280)
                        {
                          id v281 = 0;
                          uint64_t v37 = 0;
                          uint64_t v36 = v301;
                          uint64_t v34 = v300;
                          a4 = v297;
                          uint64_t v7 = v284;
LABEL_355:

                          goto LABEL_356;
                        }
                        id v86 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v87 = *MEMORY[0x1E4F502C8];
                        uint64_t v363 = *MEMORY[0x1E4F28568];
                        id v278 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"itemRelatedUniqueIdentifier"];
                        id v364 = v278;
                        v279 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v364 forKeys:&v363 count:1];
                        id v281 = 0;
                        uint64_t v37 = 0;
                        id *v280 = (id)objc_msgSend(v86, "initWithDomain:code:userInfo:", v87, 2);
                        uint64_t v36 = v301;
                        uint64_t v34 = v300;
                        a4 = v297;
                        uint64_t v7 = v284;
                        goto LABEL_354;
                      }
                      id v281 = v27;
                    }
                    else
                    {
                      id v281 = 0;
                      v9 = v19;
                    }
                    uint64_t v28 = [v6 objectForKeyedSubscript:@"shortcutAvailability"];
                    v279 = (void *)v28;
                    if (!v28)
                    {
                      id v278 = 0;
                      v8 = v18;
                      goto LABEL_67;
                    }
                    uint64_t v29 = (void *)v28;
                    objc_opt_class();
                    v8 = v18;
                    if (objc_opt_isKindOfClass())
                    {
                      id v278 = 0;
LABEL_67:
                      uint64_t v7 = v284;
                      goto LABEL_68;
                    }
                    objc_opt_class();
                    uint64_t v7 = v284;
                    if (objc_opt_isKindOfClass())
                    {
                      id v278 = v29;
LABEL_68:
                      uint64_t v62 = [v6 objectForKeyedSubscript:@"suggestedInvocationPhrase"];
                      v277 = (void *)v62;
                      if (!v62 || (v63 = (void *)v62, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v276 = 0;
                        goto LABEL_71;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v276 = v63;
LABEL_71:
                        uint64_t v64 = [v6 objectForKeyedSubscript:@"title"];
                        v285 = (void *)v64;
                        if (!v64 || (v65 = (void *)v64, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          id v275 = 0;
                          goto LABEL_74;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v275 = v65;
LABEL_74:
                          uint64_t v66 = [v6 objectForKeyedSubscript:@"userActivityRequiredString"];
                          v274 = (void *)v66;
                          if (!v66 || (v67 = (void *)v66, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v273 = 0;
                            goto LABEL_77;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v273 = v67;
LABEL_77:
                            uint64_t v68 = [v6 objectForKeyedSubscript:@"userActivityUUID"];
                            v272 = (void *)v68;
                            if (!v68 || (v69 = (void *)v68, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              id v271 = 0;
                              goto LABEL_80;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v271 = v69;
LABEL_80:
                              uint64_t v70 = [v6 objectForKeyedSubscript:@"sourceID"];
                              v270 = (void *)v70;
                              if (!v70 || (v71 = (void *)v70, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v269 = 0;
                                goto LABEL_83;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v269 = v71;
LABEL_83:
                                uint64_t v72 = [v6 objectForKeyedSubscript:@"sourceBundleID"];
                                v268 = (void *)v72;
                                if (!v72 || (v73 = (void *)v72, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  id v267 = 0;
                                  goto LABEL_86;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v267 = v73;
LABEL_86:
                                  uint64_t v74 = [v6 objectForKeyedSubscript:@"sourceItemID"];
                                  v266 = (void *)v74;
                                  if (!v74
                                    || (v75 = (void *)v74, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    id v265 = 0;
LABEL_89:
                                    id v76 = [v6 objectForKeyedSubscript:@"sourceGroupID"];
                                    v264 = v76;
                                    if (!v76) {
                                      goto LABEL_147;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v76 = 0;
                                      goto LABEL_147;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v76 = v76;
LABEL_147:
                                      uint64_t v104 = [v6 objectForKeyedSubscript:@"calendarUserActivityDate"];
                                      v263 = v76;
                                      v261 = (void *)v104;
                                      if (!v104
                                        || (id v105 = (void *)v104, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        id v262 = 0;
                                        goto LABEL_150;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v131 = v105;
                                        id v132 = objc_alloc(MEMORY[0x1E4F1C9C8]);
                                        [v131 doubleValue];
                                        id v262 = (id)objc_msgSend(v132, "initWithTimeIntervalSinceReferenceDate:");

                                        goto LABEL_150;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v143 = objc_alloc_init(MEMORY[0x1E4F28D48]);
                                        uint64_t v144 = v105;
                                        id v145 = v143;
                                        id v146 = v144;
                                        id v262 = [v145 dateFromString:v146];

                                        goto LABEL_150;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v262 = v105;
LABEL_150:
                                        uint64_t v106 = [v6 objectForKeyedSubscript:@"calendarUserActivityExternalID"];
                                        v260 = (void *)v106;
                                        if (!v106
                                          || (id v107 = (void *)v106, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          id v259 = 0;
                                          goto LABEL_153;
                                        }
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          id v259 = v107;
LABEL_153:
                                          uint64_t v108 = [v6 objectForKeyedSubscript:@"calendarUserActivityEndDate"];
                                          v258 = (void *)v108;
                                          if (!v108
                                            || (id v109 = (void *)v108,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            id v257 = 0;
                                            goto LABEL_156;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v137 = v109;
                                            id v138 = objc_alloc(MEMORY[0x1E4F1C9C8]);
                                            [v137 doubleValue];
                                            id v257 = (id)objc_msgSend(v138, "initWithTimeIntervalSinceReferenceDate:");

                                            goto LABEL_156;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v149 = objc_alloc_init(MEMORY[0x1E4F28D48]);
                                            id v150 = v258;
                                            id v257 = [v149 dateFromString:v150];

                                            goto LABEL_156;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v257 = v109;
LABEL_156:
                                            uint64_t v110 = [v6 objectForKeyedSubscript:@"locationName"];
                                            v256 = (void *)v110;
                                            if (!v110
                                              || (v111 = (void *)v110,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              id v255 = 0;
                                              goto LABEL_159;
                                            }
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v255 = v111;
LABEL_159:
                                              uint64_t v112 = [v6 objectForKeyedSubscript:@"latitude"];
                                              v254 = (void *)v112;
                                              if (!v112
                                                || (v113 = (void *)v112,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                id v114 = 0;
                                                goto LABEL_162;
                                              }
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                id v114 = v113;
LABEL_162:
                                                uint64_t v115 = [v6 objectForKeyedSubscript:@"longitude"];
                                                v253 = v114;
                                                v249 = (void *)v115;
                                                if (!v115
                                                  || (v116 = (void *)v115,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  id v248 = 0;
                                                  goto LABEL_165;
                                                }
                                                objc_opt_class();
                                                if (objc_opt_isKindOfClass())
                                                {
                                                  id v248 = v116;
LABEL_165:
                                                  uint64_t v117 = [v6 objectForKeyedSubscript:@"city"];
                                                  v247 = (void *)v117;
                                                  if (!v117
                                                    || (id v118 = (void *)v117,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    id v246 = 0;
                                                    goto LABEL_168;
                                                  }
                                                  objc_opt_class();
                                                  if (objc_opt_isKindOfClass())
                                                  {
                                                    id v246 = v118;
LABEL_168:
                                                    v119 = [v6 objectForKeyedSubscript:@"stateOrProvince"];
                                                    v244 = v119;
                                                    if (!v119
                                                      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      id v243 = 0;
                                                      goto LABEL_171;
                                                    }
                                                    objc_opt_class();
                                                    if (objc_opt_isKindOfClass())
                                                    {
                                                      id v243 = v119;
LABEL_171:
                                                      uint64_t v120 = [v6 objectForKeyedSubscript:@"country"];
                                                      v242 = (void *)v120;
                                                      if (!v120
                                                        || (v121 = (void *)v120,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                      {
                                                        id v241 = 0;
                                                        goto LABEL_174;
                                                      }
                                                      objc_opt_class();
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        id v241 = v121;
LABEL_174:
                                                        uint64_t v122 = [v6 objectForKeyedSubscript:@"thoroughfare"];
                                                        v239 = (void *)v122;
                                                        if (!v122
                                                          || (id v123 = (void *)v122,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          id v240 = 0;
                                                          goto LABEL_177;
                                                        }
                                                        objc_opt_class();
                                                        if (objc_opt_isKindOfClass())
                                                        {
                                                          id v240 = v123;
LABEL_177:
                                                          uint64_t v124 = [v6 objectForKeyedSubscript:@"fullyFormattedAddress"];
                                                          v236 = (void *)v124;
                                                          if (!v124
                                                            || (double v125 = (void *)v124,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                          {
                                                            id v237 = 0;
                                                            goto LABEL_180;
                                                          }
                                                          objc_opt_class();
                                                          if (objc_opt_isKindOfClass())
                                                          {
                                                            id v237 = v125;
LABEL_180:
                                                            uint64_t v126 = [v6 objectForKeyedSubscript:@"subThoroughfare"];
                                                            v234 = (void *)v126;
                                                            if (!v126
                                                              || (double v127 = (void *)v126,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                            {
                                                              id v235 = 0;
LABEL_183:
                                                              id v128 = [v6 objectForKeyedSubscript:@"postalCode"];
                                                              v233 = v128;
                                                              if (!v128)
                                                              {
LABEL_263:
                                                                v164 = [v6 objectForKeyedSubscript:@"phoneNumbers"];
                                                                v165 = [MEMORY[0x1E4F1CA98] null];
                                                                int v166 = [v164 isEqual:v165];

                                                                v232 = v128;
                                                                if (v166)
                                                                {

LABEL_268:
                                                                  v167 = 0;
                                                                  goto LABEL_269;
                                                                }
                                                                if (!v164) {
                                                                  goto LABEL_268;
                                                                }
                                                                objc_opt_class();
                                                                id obj = v164;
                                                                if (objc_opt_isKindOfClass())
                                                                {
                                                                  v167 = v164;
LABEL_269:
                                                                  v251 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v167, "count"));
                                                                  long long v302 = 0u;
                                                                  long long v303 = 0u;
                                                                  long long v304 = 0u;
                                                                  long long v305 = 0u;
                                                                  id obj = v167;
                                                                  uint64_t v168 = [obj countByEnumeratingWithState:&v302 objects:v316 count:16];
                                                                  if (!v168) {
                                                                    goto LABEL_278;
                                                                  }
                                                                  uint64_t v169 = v168;
                                                                  uint64_t v170 = *(void *)v303;
LABEL_271:
                                                                  uint64_t v171 = 0;
                                                                  while (1)
                                                                  {
                                                                    if (*(void *)v303 != v170) {
                                                                      objc_enumerationMutation(obj);
                                                                    }
                                                                    int v172 = *(void **)(*((void *)&v302 + 1) + 8 * v171);
                                                                    objc_opt_class();
                                                                    if (objc_opt_isKindOfClass()) {
                                                                      break;
                                                                    }
                                                                    objc_opt_class();
                                                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                    {
                                                                      if (v280)
                                                                      {
                                                                        id v190 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                        uint64_t v191 = *MEMORY[0x1E4F502C8];
                                                                        uint64_t v312 = *MEMORY[0x1E4F28568];
                                                                        v230 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"phoneNumbers"];
                                                                        v313 = v230;
                                                                        uint64_t v185 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v313 forKeys:&v312 count:1];
                                                                        v186 = v190;
                                                                        uint64_t v187 = v191;
                                                                        goto LABEL_296;
                                                                      }
                                                                      goto LABEL_305;
                                                                    }
                                                                    id v173 = v172;
                                                                    [v251 addObject:v173];

                                                                    if (v169 == ++v171)
                                                                    {
                                                                      uint64_t v169 = [obj countByEnumeratingWithState:&v302 objects:v316 count:16];
                                                                      double v20 = v289;
                                                                      v119 = v244;
                                                                      if (v169) {
                                                                        goto LABEL_271;
                                                                      }
LABEL_278:

                                                                      uint64_t v174 = [v6 objectForKeyedSubscript:@"displayName"];
                                                                      v230 = (void *)v174;
                                                                      if (!v174)
                                                                      {
                                                                        id v231 = 0;
                                                                        v176 = v287;
                                                                        goto LABEL_319;
                                                                      }
                                                                      v175 = (void *)v174;
                                                                      objc_opt_class();
                                                                      v176 = v287;
                                                                      if (objc_opt_isKindOfClass())
                                                                      {
                                                                        id v231 = 0;
                                                                        goto LABEL_319;
                                                                      }
                                                                      objc_opt_class();
                                                                      if (objc_opt_isKindOfClass())
                                                                      {
                                                                        id v231 = v175;
                                                                        double v20 = v289;
                                                                        v119 = v244;
LABEL_319:
                                                                        v203 = [v6 objectForKeyedSubscript:@"URL"];
                                                                        v228 = v203;
                                                                        if (v203)
                                                                        {
                                                                          objc_opt_class();
                                                                          if (objc_opt_isKindOfClass())
                                                                          {
                                                                            v203 = 0;
                                                                            goto LABEL_327;
                                                                          }
                                                                          objc_opt_class();
                                                                          if (objc_opt_isKindOfClass())
                                                                          {
                                                                            id v204 = v203;
                                                                            uint64_t v205 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v204];
                                                                            if (v205)
                                                                            {
                                                                              v203 = (void *)v205;

                                                                              goto LABEL_327;
                                                                            }
                                                                            v215 = v204;
                                                                            if (v280)
                                                                            {
                                                                              id v245 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                              uint64_t v216 = *MEMORY[0x1E4F502C8];
                                                                              uint64_t v308 = *MEMORY[0x1E4F28568];
                                                                              v217 = (void *)[[NSString alloc] initWithFormat:@"-initWithString: for %@ returned nil", @"URL"];
                                                                              v309 = v217;
                                                                              v218 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v309 forKeys:&v308 count:1];
                                                                              id *v280 = (id)[v245 initWithDomain:v216 code:2 userInfo:v218];
                                                                            }
                                                                            v219 = v215;

                                                                            uint64_t v37 = 0;
                                                                            v229 = v219;
                                                                            uint64_t v36 = v301;
                                                                            uint64_t v34 = v300;
                                                                            a4 = v297;
                                                                            double v20 = v289;

LABEL_330:
                                                                            v196 = v231;
LABEL_331:

                                                                            goto LABEL_332;
                                                                          }
                                                                          if (v280)
                                                                          {
                                                                            id v211 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                            uint64_t v212 = *MEMORY[0x1E4F502C8];
                                                                            uint64_t v306 = *MEMORY[0x1E4F28568];
                                                                            v213 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"URL"];
                                                                            v307 = v213;
                                                                            v214 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v307 forKeys:&v306 count:1];
                                                                            id *v280 = (id)[v211 initWithDomain:v212 code:2 userInfo:v214];

                                                                            double v20 = v289;
                                                                          }
                                                                          uint64_t v37 = 0;
                                                                          uint64_t v36 = v301;
                                                                          uint64_t v34 = v300;
LABEL_297:
                                                                          a4 = v297;
LABEL_329:

                                                                          goto LABEL_330;
                                                                        }
LABEL_327:
                                                                        id v227 = v128;
                                                                        v226 = v176;
                                                                        uint64_t v36 = v301;
                                                                        uint64_t v34 = v300;
                                                                        a4 = v297;
                                                                        v206 = objc_retain(-[BMAppLocationActivity initWithBundleID:activityType:beginningOfActivity:contentDescription:expirationDate:isEligibleForPrediction:isPubliclyIndexable:itemIdentifier:itemRelatedContentURL:itemRelatedUniqueIdentifier:shortcutAvailability:suggestedInvocationPhrase:title:userActivityRequiredString:userActivityUUID:sourceID:sourceBundleID:sourceItemID:sourceGroupID:calendarUserActivityDate:calendarUserActivityExternalID:calendarUserActivityEndDate:locationName:latitude:longitude:city:stateOrProvince:country:thoroughfare:fullyFormattedAddress:subThoroughfare:postalCode:phoneNumbers:displayName:URL:](v288, "initWithBundleID:activityType:beginningOfActivity:contentDescription:expirationDate:isEligibleForPrediction:isPubliclyIndexable:itemIdentifier:itemRelatedContentURL:itemRelatedUniqueIdentifier:shortcutAvailability:suggestedInvocationPhrase:title:userActivityRequiredString:userActivityUUID:sourceID:sourceBundleID:sourceItemID:sourceGroupID:calendarUserActivityDate:calendarUserActivityExternalID:calendarUserActivityEndDate:locationName:latitude:longitude:city:stateOrProvince:country:thoroughfare:fullyFormattedAddress:subThoroughfare:postalCode:phoneNumbers:displayName:URL:", v301,
                                                                                   v300,
                                                                                   v297,
                                                                                   v298,
                                                                                   v294,
                                                                                   v292,
                                                                                   v290,
                                                                                   v226,
                                                                                   v283,
                                                                                   v281,
                                                                                   v278,
                                                                                   v276,
                                                                                   v275,
                                                                                   v273,
                                                                                   v271,
                                                                                   v269,
                                                                                   v267,
                                                                                   v265,
                                                                                   v263,
                                                                                   v262,
                                                                                   v259,
                                                                                   v257,
                                                                                   v255,
                                                                                   v253,
                                                                                   v248,
                                                                                   v246,
                                                                                   v243,
                                                                                   v241,
                                                                                   v240,
                                                                                   v237,
                                                                                   v235,
                                                                                   v227,
                                                                                   v251,
                                                                                   v231,
                                                                                   v203));

                                                                        v288 = v206;
                                                                        uint64_t v37 = v206;
                                                                      }
                                                                      else
                                                                      {
                                                                        if (!v280)
                                                                        {
                                                                          id v231 = 0;
                                                                          uint64_t v37 = 0;
                                                                          uint64_t v36 = v301;
                                                                          uint64_t v34 = v300;
                                                                          a4 = v297;
                                                                          double v20 = v289;
                                                                          v119 = v244;
                                                                          goto LABEL_330;
                                                                        }
                                                                        id v208 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                        uint64_t v209 = *MEMORY[0x1E4F502C8];
                                                                        uint64_t v310 = *MEMORY[0x1E4F28568];
                                                                        v228 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"displayName"];
                                                                        v311 = v228;
                                                                        v210 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v311 forKeys:&v310 count:1];
                                                                        id *v280 = (id)[v208 initWithDomain:v209 code:2 userInfo:v210];

                                                                        id v231 = 0;
                                                                        uint64_t v37 = 0;
                                                                        uint64_t v36 = v301;
                                                                        uint64_t v34 = v300;
                                                                        a4 = v297;
                                                                        double v20 = v289;
                                                                      }
                                                                      v119 = v244;
                                                                      goto LABEL_329;
                                                                    }
                                                                  }
                                                                  if (v280)
                                                                  {
                                                                    id v183 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                    uint64_t v184 = *MEMORY[0x1E4F502C8];
                                                                    uint64_t v314 = *MEMORY[0x1E4F28568];
                                                                    v230 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"phoneNumbers"];
                                                                    v315 = v230;
                                                                    uint64_t v185 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v315 forKeys:&v314 count:1];
                                                                    v186 = v183;
                                                                    uint64_t v187 = v184;
LABEL_296:
                                                                    v228 = (void *)v185;
                                                                    uint64_t v36 = v301;
                                                                    uint64_t v34 = v300;
                                                                    double v20 = v289;
                                                                    v119 = v244;
                                                                    uint64_t v37 = 0;
                                                                    id *v280 = (id)objc_msgSend(v186, "initWithDomain:code:userInfo:", v187, 2);
                                                                    id v231 = obj;
                                                                    goto LABEL_297;
                                                                  }
LABEL_305:
                                                                  uint64_t v37 = 0;
                                                                  v196 = obj;
                                                                  uint64_t v36 = v301;
                                                                  uint64_t v34 = v300;
                                                                  a4 = v297;
                                                                  double v20 = v289;
                                                                  v119 = v244;
                                                                  goto LABEL_331;
                                                                }
                                                                if (v280)
                                                                {
                                                                  id v199 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                  uint64_t v200 = *MEMORY[0x1E4F502C8];
                                                                  uint64_t v317 = *MEMORY[0x1E4F28568];
                                                                  v251 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"phoneNumbers"];
                                                                  v318 = v251;
                                                                  uint64_t v201 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v318 forKeys:&v317 count:1];
                                                                  id v202 = (id)[v199 initWithDomain:v200 code:2 userInfo:v201];
                                                                  uint64_t v37 = 0;
                                                                  id *v280 = v202;
                                                                  v196 = (void *)v201;
                                                                  uint64_t v36 = v301;
                                                                  uint64_t v34 = v300;
                                                                  a4 = v297;
                                                                  goto LABEL_331;
                                                                }
                                                                uint64_t v37 = 0;
                                                                uint64_t v36 = v301;
                                                                uint64_t v34 = v300;
                                                                a4 = v297;
LABEL_332:

                                                                goto LABEL_333;
                                                              }
                                                              objc_opt_class();
                                                              if (objc_opt_isKindOfClass())
                                                              {
                                                                id v128 = 0;
                                                                goto LABEL_263;
                                                              }
                                                              objc_opt_class();
                                                              if (objc_opt_isKindOfClass())
                                                              {
                                                                id v128 = v128;
                                                                goto LABEL_263;
                                                              }
                                                              if (v280)
                                                              {
                                                                id v197 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                uint64_t v198 = *MEMORY[0x1E4F502C8];
                                                                uint64_t v319 = *MEMORY[0x1E4F28568];
                                                                id obj = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"postalCode"];
                                                                id v320 = obj;
                                                                v252 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v320 forKeys:&v319 count:1];
                                                                v232 = 0;
                                                                uint64_t v37 = 0;
                                                                id *v280 = (id)objc_msgSend(v197, "initWithDomain:code:userInfo:", v198, 2);
                                                                uint64_t v36 = v301;
                                                                uint64_t v34 = v300;
                                                                a4 = v297;

                                                                goto LABEL_332;
                                                              }
                                                              v232 = 0;
                                                              uint64_t v37 = 0;
LABEL_370:
                                                              uint64_t v36 = v301;
                                                              uint64_t v34 = v300;
                                                              a4 = v297;
LABEL_333:

LABEL_334:
                                                              goto LABEL_335;
                                                            }
                                                            objc_opt_class();
                                                            if (objc_opt_isKindOfClass())
                                                            {
                                                              id v235 = v127;
                                                              goto LABEL_183;
                                                            }
                                                            if (v280)
                                                            {
                                                              id v194 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                              uint64_t v195 = *MEMORY[0x1E4F502C8];
                                                              uint64_t v321 = *MEMORY[0x1E4F28568];
                                                              v232 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"subThoroughfare"];
                                                              v322 = v232;
                                                              v233 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v322 forKeys:&v321 count:1];
                                                              id v235 = 0;
                                                              uint64_t v37 = 0;
                                                              id *v280 = (id)objc_msgSend(v194, "initWithDomain:code:userInfo:", v195, 2);
                                                              goto LABEL_370;
                                                            }
                                                            id v235 = 0;
                                                            uint64_t v37 = 0;
LABEL_368:
                                                            uint64_t v36 = v301;
                                                            uint64_t v34 = v300;
                                                            a4 = v297;
                                                            goto LABEL_334;
                                                          }
                                                          if (v280)
                                                          {
                                                            id v188 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                            uint64_t v189 = *MEMORY[0x1E4F502C8];
                                                            uint64_t v323 = *MEMORY[0x1E4F28568];
                                                            id v235 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"fullyFormattedAddress"];
                                                            id v324 = v235;
                                                            v234 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v324 forKeys:&v323 count:1];
                                                            id v237 = 0;
                                                            uint64_t v37 = 0;
                                                            id *v280 = (id)objc_msgSend(v188, "initWithDomain:code:userInfo:", v189, 2);
                                                            goto LABEL_368;
                                                          }
                                                          id v237 = 0;
                                                          uint64_t v37 = 0;
LABEL_323:
                                                          uint64_t v36 = v301;
                                                          uint64_t v34 = v300;
                                                          a4 = v297;
LABEL_335:

                                                          goto LABEL_336;
                                                        }
                                                        if (v280)
                                                        {
                                                          id v179 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                          uint64_t v180 = *MEMORY[0x1E4F502C8];
                                                          uint64_t v325 = *MEMORY[0x1E4F28568];
                                                          id v237 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"thoroughfare"];
                                                          id v326 = v237;
                                                          v236 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v326 forKeys:&v325 count:1];
                                                          id v240 = 0;
                                                          uint64_t v37 = 0;
                                                          id *v280 = (id)objc_msgSend(v179, "initWithDomain:code:userInfo:", v180, 2);
                                                          goto LABEL_323;
                                                        }
                                                        id v240 = 0;
                                                        uint64_t v37 = 0;
LABEL_315:
                                                        uint64_t v36 = v301;
                                                        uint64_t v34 = v300;
                                                        a4 = v297;
LABEL_336:

                                                        goto LABEL_337;
                                                      }
                                                      if (v280)
                                                      {
                                                        id v177 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                        uint64_t v178 = *MEMORY[0x1E4F502C8];
                                                        uint64_t v327 = *MEMORY[0x1E4F28568];
                                                        id v240 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"country"];
                                                        id v328 = v240;
                                                        v239 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v328 forKeys:&v327 count:1];
                                                        id v241 = 0;
                                                        uint64_t v37 = 0;
                                                        id *v280 = (id)objc_msgSend(v177, "initWithDomain:code:userInfo:", v178, 2);
                                                        goto LABEL_315;
                                                      }
                                                      id v241 = 0;
                                                      uint64_t v37 = 0;
                                                      uint64_t v36 = v301;
                                                      uint64_t v34 = v300;
                                                      a4 = v297;
LABEL_337:

                                                      goto LABEL_338;
                                                    }
                                                    if (v280)
                                                    {
                                                      id v250 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                      uint64_t v163 = *MEMORY[0x1E4F502C8];
                                                      uint64_t v329 = *MEMORY[0x1E4F28568];
                                                      id v241 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"stateOrProvince"];
                                                      id v330 = v241;
                                                      v242 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v330 forKeys:&v329 count:1];
                                                      id v243 = 0;
                                                      uint64_t v37 = 0;
                                                      id *v280 = (id)objc_msgSend(v250, "initWithDomain:code:userInfo:", v163, 2);
                                                      uint64_t v36 = v301;
                                                      uint64_t v34 = v300;
                                                      a4 = v297;
                                                      goto LABEL_337;
                                                    }
                                                    id v243 = 0;
                                                    uint64_t v37 = 0;
                                                    uint64_t v36 = v301;
                                                    uint64_t v34 = v300;
                                                    a4 = v297;
LABEL_338:

                                                    goto LABEL_339;
                                                  }
                                                  if (v280)
                                                  {
                                                    id v161 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                    uint64_t v162 = *MEMORY[0x1E4F502C8];
                                                    uint64_t v331 = *MEMORY[0x1E4F28568];
                                                    id v243 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"city"];
                                                    id v332 = v243;
                                                    v119 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v332 forKeys:&v331 count:1];
                                                    id v246 = 0;
                                                    uint64_t v37 = 0;
                                                    id *v280 = (id)[v161 initWithDomain:v162 code:2 userInfo:v119];
                                                    uint64_t v36 = v301;
                                                    uint64_t v34 = v300;
                                                    a4 = v297;
                                                    goto LABEL_338;
                                                  }
                                                  id v246 = 0;
                                                  uint64_t v37 = 0;
                                                  uint64_t v36 = v301;
                                                  uint64_t v34 = v300;
                                                  a4 = v297;
LABEL_339:

                                                  goto LABEL_340;
                                                }
                                                if (v280)
                                                {
                                                  id v157 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  uint64_t v158 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v333 = *MEMORY[0x1E4F28568];
                                                  id v159 = [NSString alloc];
                                                  uint64_t v225 = objc_opt_class();
                                                  int v160 = v159;
                                                  double v20 = v289;
                                                  id v246 = (id)[v160 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v225, @"longitude"];
                                                  id v334 = v246;
                                                  v247 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v334 forKeys:&v333 count:1];
                                                  id v248 = 0;
                                                  uint64_t v37 = 0;
                                                  id *v280 = (id)objc_msgSend(v157, "initWithDomain:code:userInfo:", v158, 2);
                                                  uint64_t v36 = v301;
                                                  uint64_t v34 = v300;
                                                  a4 = v297;
                                                  goto LABEL_339;
                                                }
                                                id v248 = 0;
                                                uint64_t v37 = 0;
LABEL_299:
                                                uint64_t v36 = v301;
                                                uint64_t v34 = v300;
                                                a4 = v297;
LABEL_340:

                                                goto LABEL_341;
                                              }
                                              if (v280)
                                              {
                                                id v153 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                uint64_t v154 = *MEMORY[0x1E4F502C8];
                                                uint64_t v335 = *MEMORY[0x1E4F28568];
                                                id v155 = [NSString alloc];
                                                uint64_t v224 = objc_opt_class();
                                                uint64_t v156 = v155;
                                                double v20 = v289;
                                                id v248 = (id)[v156 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v224, @"latitude"];
                                                id v336 = v248;
                                                v249 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v336 forKeys:&v335 count:1];
                                                v253 = 0;
                                                uint64_t v37 = 0;
                                                id *v280 = (id)objc_msgSend(v153, "initWithDomain:code:userInfo:", v154, 2);
                                                goto LABEL_299;
                                              }
                                              v253 = 0;
                                              uint64_t v37 = 0;
                                              uint64_t v36 = v301;
                                              uint64_t v34 = v300;
                                              a4 = v297;
LABEL_341:

                                              goto LABEL_342;
                                            }
                                            if (v280)
                                            {
                                              id v151 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              uint64_t v152 = *MEMORY[0x1E4F502C8];
                                              uint64_t v337 = *MEMORY[0x1E4F28568];
                                              v253 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"locationName"];
                                              v338 = v253;
                                              v254 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v338 forKeys:&v337 count:1];
                                              id v255 = 0;
                                              uint64_t v37 = 0;
                                              id *v280 = (id)objc_msgSend(v151, "initWithDomain:code:userInfo:", v152, 2);
                                              uint64_t v36 = v301;
                                              uint64_t v34 = v300;
                                              a4 = v297;
                                              goto LABEL_341;
                                            }
                                            id v255 = 0;
                                            uint64_t v37 = 0;
LABEL_302:
                                            uint64_t v36 = v301;
                                            uint64_t v34 = v300;
                                            a4 = v297;
LABEL_342:

                                            goto LABEL_343;
                                          }
                                          if (v280)
                                          {
                                            id v192 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            uint64_t v193 = *MEMORY[0x1E4F502C8];
                                            uint64_t v339 = *MEMORY[0x1E4F28568];
                                            id v255 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"calendarUserActivityEndDate"];
                                            id v340 = v255;
                                            v256 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v340 forKeys:&v339 count:1];
                                            id v257 = 0;
                                            uint64_t v37 = 0;
                                            id *v280 = (id)objc_msgSend(v192, "initWithDomain:code:userInfo:", v193, 2);
                                            goto LABEL_302;
                                          }
                                          id v257 = 0;
                                          uint64_t v37 = 0;
LABEL_221:
                                          uint64_t v36 = v301;
                                          uint64_t v34 = v300;
                                          a4 = v297;
LABEL_343:

                                          goto LABEL_344;
                                        }
                                        if (v280)
                                        {
                                          id v147 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          uint64_t v148 = *MEMORY[0x1E4F502C8];
                                          uint64_t v341 = *MEMORY[0x1E4F28568];
                                          id v257 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"calendarUserActivityExternalID"];
                                          id v342 = v257;
                                          v258 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v342 forKeys:&v341 count:1];
                                          id v259 = 0;
                                          uint64_t v37 = 0;
                                          id *v280 = (id)objc_msgSend(v147, "initWithDomain:code:userInfo:", v148, 2);
                                          goto LABEL_221;
                                        }
                                        id v259 = 0;
                                        uint64_t v37 = 0;
LABEL_288:
                                        uint64_t v36 = v301;
                                        uint64_t v34 = v300;
                                        a4 = v297;
LABEL_344:

                                        goto LABEL_345;
                                      }
                                      if (v280)
                                      {
                                        id v181 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v182 = *MEMORY[0x1E4F502C8];
                                        uint64_t v343 = *MEMORY[0x1E4F28568];
                                        id v259 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"calendarUserActivityDate"];
                                        id v344 = v259;
                                        v260 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v344 forKeys:&v343 count:1];
                                        id v262 = 0;
                                        uint64_t v37 = 0;
                                        id *v280 = (id)objc_msgSend(v181, "initWithDomain:code:userInfo:", v182, 2);
                                        goto LABEL_288;
                                      }
                                      id v262 = 0;
                                      uint64_t v37 = 0;
LABEL_211:
                                      uint64_t v36 = v301;
                                      uint64_t v34 = v300;
                                      a4 = v297;
LABEL_345:

                                      goto LABEL_346;
                                    }
                                    if (v280)
                                    {
                                      id v141 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v142 = *MEMORY[0x1E4F502C8];
                                      uint64_t v345 = *MEMORY[0x1E4F28568];
                                      id v262 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sourceGroupID"];
                                      id v346 = v262;
                                      v261 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v346 forKeys:&v345 count:1];
                                      v263 = 0;
                                      uint64_t v37 = 0;
                                      id *v280 = (id)objc_msgSend(v141, "initWithDomain:code:userInfo:", v142, 2);
                                      goto LABEL_211;
                                    }
                                    v263 = 0;
                                    uint64_t v37 = 0;
LABEL_253:
                                    uint64_t v36 = v301;
                                    uint64_t v34 = v300;
                                    a4 = v297;
LABEL_346:

                                    goto LABEL_347;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v265 = v75;
                                    goto LABEL_89;
                                  }
                                  if (v280)
                                  {
                                    id v139 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v140 = *MEMORY[0x1E4F502C8];
                                    uint64_t v347 = *MEMORY[0x1E4F28568];
                                    v263 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sourceItemID"];
                                    v348 = v263;
                                    v264 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v348 forKeys:&v347 count:1];
                                    id v265 = 0;
                                    uint64_t v37 = 0;
                                    id *v280 = (id)objc_msgSend(v139, "initWithDomain:code:userInfo:", v140, 2);
                                    goto LABEL_253;
                                  }
                                  id v265 = 0;
                                  uint64_t v37 = 0;
LABEL_245:
                                  uint64_t v36 = v301;
                                  uint64_t v34 = v300;
                                  a4 = v297;
LABEL_347:

                                  goto LABEL_348;
                                }
                                if (v280)
                                {
                                  id v135 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  uint64_t v136 = *MEMORY[0x1E4F502C8];
                                  uint64_t v349 = *MEMORY[0x1E4F28568];
                                  id v265 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sourceBundleID"];
                                  id v350 = v265;
                                  v266 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v350 forKeys:&v349 count:1];
                                  id v267 = 0;
                                  uint64_t v37 = 0;
                                  id *v280 = (id)objc_msgSend(v135, "initWithDomain:code:userInfo:", v136, 2);
                                  goto LABEL_245;
                                }
                                id v267 = 0;
                                uint64_t v37 = 0;
LABEL_239:
                                uint64_t v36 = v301;
                                uint64_t v34 = v300;
                                a4 = v297;
LABEL_348:

                                goto LABEL_349;
                              }
                              if (v280)
                              {
                                id v133 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v134 = *MEMORY[0x1E4F502C8];
                                uint64_t v351 = *MEMORY[0x1E4F28568];
                                id v267 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sourceID"];
                                id v352 = v267;
                                v268 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v352 forKeys:&v351 count:1];
                                id v269 = 0;
                                uint64_t v37 = 0;
                                id *v280 = (id)objc_msgSend(v133, "initWithDomain:code:userInfo:", v134, 2);
                                goto LABEL_239;
                              }
                              id v269 = 0;
                              uint64_t v37 = 0;
LABEL_233:
                              uint64_t v36 = v301;
                              uint64_t v34 = v300;
                              a4 = v297;
LABEL_349:

                              goto LABEL_350;
                            }
                            if (v280)
                            {
                              id v129 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v130 = *MEMORY[0x1E4F502C8];
                              uint64_t v353 = *MEMORY[0x1E4F28568];
                              id v269 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"userActivityUUID"];
                              id v354 = v269;
                              v270 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v354 forKeys:&v353 count:1];
                              id v271 = 0;
                              uint64_t v37 = 0;
                              id *v280 = (id)objc_msgSend(v129, "initWithDomain:code:userInfo:", v130, 2);
                              goto LABEL_233;
                            }
                            id v271 = 0;
                            uint64_t v37 = 0;
LABEL_225:
                            uint64_t v36 = v301;
                            uint64_t v34 = v300;
                            a4 = v297;
LABEL_350:

                            goto LABEL_351;
                          }
                          if (v280)
                          {
                            id v98 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v99 = *MEMORY[0x1E4F502C8];
                            uint64_t v355 = *MEMORY[0x1E4F28568];
                            id v271 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"userActivityRequiredString"];
                            id v356 = v271;
                            v272 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v356 forKeys:&v355 count:1];
                            id v273 = 0;
                            uint64_t v37 = 0;
                            id *v280 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v99, 2);
                            goto LABEL_225;
                          }
                          id v273 = 0;
                          uint64_t v37 = 0;
LABEL_216:
                          uint64_t v36 = v301;
                          uint64_t v34 = v300;
                          a4 = v297;
LABEL_351:

                          goto LABEL_352;
                        }
                        if (v280)
                        {
                          id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v95 = *MEMORY[0x1E4F502C8];
                          uint64_t v357 = *MEMORY[0x1E4F28568];
                          id v273 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"title"];
                          id v358 = v273;
                          v274 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v358 forKeys:&v357 count:1];
                          id v275 = 0;
                          uint64_t v37 = 0;
                          id *v280 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v95, 2);
                          goto LABEL_216;
                        }
                        id v275 = 0;
                        uint64_t v37 = 0;
LABEL_208:
                        uint64_t v36 = v301;
                        uint64_t v34 = v300;
                        a4 = v297;
LABEL_352:

                        goto LABEL_353;
                      }
                      if (v280)
                      {
                        id v92 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v93 = *MEMORY[0x1E4F502C8];
                        uint64_t v359 = *MEMORY[0x1E4F28568];
                        id v275 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"suggestedInvocationPhrase"];
                        id v360 = v275;
                        v285 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v360 forKeys:&v359 count:1];
                        id v276 = 0;
                        uint64_t v37 = 0;
                        id *v280 = (id)objc_msgSend(v92, "initWithDomain:code:userInfo:", v93, 2);
                        goto LABEL_208;
                      }
                      id v276 = 0;
                      uint64_t v37 = 0;
                      uint64_t v36 = v301;
                      uint64_t v34 = v300;
                      a4 = v297;
LABEL_353:

                      goto LABEL_354;
                    }
                    if (v280)
                    {
                      id v88 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v89 = *MEMORY[0x1E4F502C8];
                      uint64_t v361 = *MEMORY[0x1E4F28568];
                      id v90 = [NSString alloc];
                      uint64_t v223 = objc_opt_class();
                      v91 = v90;
                      double v20 = v289;
                      id v276 = (id)[v91 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v223, @"shortcutAvailability"];
                      id v362 = v276;
                      v277 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v362 forKeys:&v361 count:1];
                      id v278 = 0;
                      uint64_t v37 = 0;
                      id *v280 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v89, 2);
                      uint64_t v36 = v301;
                      uint64_t v34 = v300;
                      a4 = v297;
                      goto LABEL_353;
                    }
                    id v278 = 0;
                    uint64_t v37 = 0;
                    uint64_t v36 = v301;
                    uint64_t v34 = v300;
                    a4 = v297;
LABEL_354:

                    goto LABEL_355;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v51 = v24;
                    uint64_t v52 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v51];
                    if (v52)
                    {
                      uint64_t v53 = v52;

                      uint64_t v25 = (void *)v53;
                      goto LABEL_28;
                    }
                    v283 = v51;
                    if (v21)
                    {
                      id v100 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v101 = *MEMORY[0x1E4F502C8];
                      uint64_t v367 = *MEMORY[0x1E4F28568];
                      uint64_t v102 = (void *)[[NSString alloc] initWithFormat:@"-initWithString: for %@ returned nil", @"itemRelatedContentURL"];
                      v368 = v102;
                      v103 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v368 forKeys:&v367 count:1];
                      *uint64_t v21 = (id)[v100 initWithDomain:v101 code:2 userInfo:v103];
                    }
                    uint64_t v37 = 0;
                    v286 = v51;
                  }
                  else
                  {
                    if (!v21)
                    {
                      uint64_t v37 = 0;
                      uint64_t v36 = v301;
                      uint64_t v34 = v300;
                      a4 = v297;
                      v9 = v19;
                      v8 = v18;
                      uint64_t v7 = v284;
LABEL_357:

                      goto LABEL_358;
                    }
                    id v83 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v84 = *MEMORY[0x1E4F502C8];
                    uint64_t v365 = *MEMORY[0x1E4F28568];
                    v283 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"itemRelatedContentURL"];
                    v366 = v283;
                    v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v366 forKeys:&v365 count:1];
                    *uint64_t v21 = (id)[v83 initWithDomain:v84 code:2 userInfo:v85];

                    uint64_t v37 = 0;
                  }
                  uint64_t v36 = v301;
                  uint64_t v34 = v300;
                  a4 = v297;
                  double v20 = v289;
LABEL_143:
                  v9 = v19;
                  v8 = v18;
                  uint64_t v7 = v284;
LABEL_356:

                  goto LABEL_357;
                }
                if (a4)
                {
                  id v79 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v80 = *MEMORY[0x1E4F502C8];
                  uint64_t v369 = *MEMORY[0x1E4F28568];
                  id v81 = [NSString alloc];
                  uint64_t v222 = objc_opt_class();
                  int v82 = v81;
                  double v20 = v289;
                  v286 = (void *)[v82 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v222, @"itemIdentifier"];
                  v370 = v286;
                  v283 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v370 forKeys:&v369 count:1];
                  v287 = 0;
                  uint64_t v37 = 0;
                  *a4 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v80, 2);
                  uint64_t v36 = v301;
                  uint64_t v34 = v300;
                  a4 = v297;
                  goto LABEL_143;
                }
                v287 = 0;
                uint64_t v37 = 0;
                uint64_t v36 = v301;
                uint64_t v34 = v300;
                a4 = v297;
                v9 = v19;
                v8 = v18;
                uint64_t v7 = v284;
LABEL_358:

                self = v288;
                goto LABEL_359;
              }
              if (a4)
              {
                id v77 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v78 = *MEMORY[0x1E4F502C8];
                uint64_t v371 = *MEMORY[0x1E4F28568];
                v287 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isPubliclyIndexable"];
                v372 = v287;
                double v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v372 forKeys:&v371 count:1];
                id v290 = 0;
                uint64_t v37 = 0;
                *a4 = (id)[v77 initWithDomain:v78 code:2 userInfo:v20];
                uint64_t v36 = v301;
                uint64_t v34 = v300;
                a4 = v297;
                goto LABEL_358;
              }
              id v290 = 0;
              uint64_t v37 = 0;
LABEL_126:
              uint64_t v36 = v301;
              uint64_t v34 = v300;
              a4 = v297;
LABEL_359:

              goto LABEL_360;
            }
            if (a4)
            {
              id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v57 = *MEMORY[0x1E4F502C8];
              uint64_t v373 = *MEMORY[0x1E4F28568];
              int v58 = self;
              id v59 = [NSString alloc];
              uint64_t v221 = objc_opt_class();
              uint64_t v60 = v59;
              self = v58;
              id v290 = (id)[v60 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v221, @"isEligibleForPrediction"];
              id v374 = v290;
              v291 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v374 forKeys:&v373 count:1];
              id v61 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v57, 2);
              id v292 = 0;
              uint64_t v37 = 0;
              *a4 = v61;
              goto LABEL_126;
            }
            id v292 = 0;
            uint64_t v37 = 0;
LABEL_134:
            uint64_t v36 = v301;
            uint64_t v34 = v300;
            a4 = v297;
LABEL_360:

            goto LABEL_361;
          }
          if (a4)
          {
            id v295 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v96 = *MEMORY[0x1E4F502C8];
            uint64_t v375 = *MEMORY[0x1E4F28568];
            id v292 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"expirationDate"];
            id v376 = v292;
            v293 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v376 forKeys:&v375 count:1];
            id v97 = (id)objc_msgSend(v295, "initWithDomain:code:userInfo:", v96, 2);
            id v294 = 0;
            uint64_t v37 = 0;
            *a4 = v97;
            goto LABEL_134;
          }
          id v294 = 0;
          uint64_t v37 = 0;
LABEL_58:
          uint64_t v36 = v301;
          uint64_t v34 = v300;
          a4 = v297;
LABEL_361:

          goto LABEL_362;
        }
        if (a4)
        {
          id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v46 = *MEMORY[0x1E4F502C8];
          uint64_t v377 = *MEMORY[0x1E4F28568];
          uint64_t v47 = self;
          id v48 = [NSString alloc];
          uint64_t v220 = objc_opt_class();
          uint64_t v49 = v48;
          self = v47;
          id v294 = (id)[v49 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v220, @"contentDescription"];
          id v378 = v294;
          v296 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v378 forKeys:&v377 count:1];
          id v50 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v46, 2);
          id v298 = 0;
          uint64_t v37 = 0;
          *a4 = v50;
          goto LABEL_58;
        }
        id v298 = 0;
        uint64_t v37 = 0;
        uint64_t v36 = v301;
        uint64_t v34 = v300;
        a4 = v297;
LABEL_362:

        goto LABEL_363;
      }
      if (a4)
      {
        id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v43 = *MEMORY[0x1E4F502C8];
        uint64_t v379 = *MEMORY[0x1E4F28568];
        id v298 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"beginningOfActivity"];
        id v380 = v298;
        v299 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v380 forKeys:&v379 count:1];
        id v44 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v43, 2);
        uint64_t v37 = 0;
        *a4 = v44;
        a4 = 0;
        uint64_t v36 = v301;
        uint64_t v34 = v300;
        goto LABEL_362;
      }
      uint64_t v37 = 0;
      uint64_t v36 = v301;
      uint64_t v34 = v300;
LABEL_363:

      goto LABEL_364;
    }
    if (a4)
    {
      id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v39 = *MEMORY[0x1E4F502C8];
      uint64_t v381 = *MEMORY[0x1E4F28568];
      uint64_t v40 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"activityType"];
      v382 = v40;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v382 forKeys:&v381 count:1];
      id v41 = (id)[v38 initWithDomain:v39 code:2 userInfo:v9];
      uint64_t v34 = 0;
      uint64_t v37 = 0;
      *a4 = v41;
      a4 = v40;
      uint64_t v36 = v301;
      goto LABEL_363;
    }
    uint64_t v34 = 0;
    uint64_t v37 = 0;
    uint64_t v36 = v301;
LABEL_364:

    goto LABEL_365;
  }
  if (a4)
  {
    id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v33 = *MEMORY[0x1E4F502C8];
    uint64_t v383 = *MEMORY[0x1E4F28568];
    uint64_t v34 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleID"];
    v384[0] = v34;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v384 forKeys:&v383 count:1];
    id v35 = (id)[v32 initWithDomain:v33 code:2 userInfo:v8];
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    *a4 = v35;
    goto LABEL_364;
  }
  uint64_t v36 = 0;
  uint64_t v37 = 0;
LABEL_365:

  return v37;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMAppLocationActivity *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_activityType) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasBeginningOfActivity) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_contentDescription) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_expirationDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasIsEligibleForPrediction) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsPubliclyIndexable) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_itemIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_raw_itemRelatedContentURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_itemRelatedUniqueIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasShortcutAvailability) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_suggestedInvocationPhrase) {
    PBDataWriterWriteStringField();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_userActivityRequiredString) {
    PBDataWriterWriteStringField();
  }
  if (self->_userActivityUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceID) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceBundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceItemID) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceGroupID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_calendarUserActivityDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_calendarUserActivityExternalID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_calendarUserActivityEndDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_locationName) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasLatitude) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasLongitude) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_city) {
    PBDataWriterWriteStringField();
  }
  if (self->_stateOrProvince) {
    PBDataWriterWriteStringField();
  }
  if (self->_country) {
    PBDataWriterWriteStringField();
  }
  if (self->_thoroughfare) {
    PBDataWriterWriteStringField();
  }
  if (self->_fullyFormattedAddress) {
    PBDataWriterWriteStringField();
  }
  if (self->_subThoroughfare) {
    PBDataWriterWriteStringField();
  }
  if (self->_postalCode) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_phoneNumbers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_displayName) {
    PBDataWriterWriteStringField();
  }
  if (self->_raw_URL) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)BMAppLocationActivity;
  uint64_t v5 = [(BMEventBase *)&v73 init];
  if (!v5) {
    goto LABEL_125;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    long long v10 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v9]) {
        break;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v7;
        uint64_t v15 = *(void *)&v4[v14];
        unint64_t v16 = v15 + 1;
        if (v15 == -1 || v16 > *(void *)&v4[*v8]) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
        *(void *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0) {
          goto LABEL_13;
        }
        v11 += 7;
        BOOL v18 = v12++ >= 9;
        if (v18)
        {
          unint64_t v13 = 0;
          int v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v19 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v13 = 0;
      }
LABEL_15:
      if (v19 || (v13 & 7) == 4) {
        break;
      }
      switch((v13 >> 3))
      {
        case 1u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 104;
          goto LABEL_90;
        case 2u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 112;
          goto LABEL_90;
        case 3u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          v5->_hasBeginningOfActivity = 1;
          while (2)
          {
            uint64_t v26 = *v7;
            uint64_t v27 = *(void *)&v4[v26];
            unint64_t v28 = v27 + 1;
            if (v27 == -1 || v28 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)&v4[*v10] + v27);
              *(void *)&v4[v26] = v28;
              v25 |= (unint64_t)(v29 & 0x7F) << v23;
              if (v29 < 0)
              {
                v23 += 7;
                BOOL v18 = v24++ >= 9;
                if (v18)
                {
                  uint64_t v25 = 0;
                  goto LABEL_98;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v25 = 0;
          }
LABEL_98:
          BOOL v65 = v25 != 0;
          uint64_t v66 = 80;
          goto LABEL_107;
        case 4u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 120;
          goto LABEL_90;
        case 5u:
          v5->_hasRaw_expirationDate = 1;
          uint64_t v30 = *v7;
          unint64_t v31 = *(void *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(void *)&v4[*v8])
          {
            id v32 = *(objc_class **)(*(void *)&v4[*v10] + v31);
            *(void *)&v4[v30] = v31 + 8;
          }
          else
          {
            v4[*v9] = 1;
            id v32 = 0;
          }
          uint64_t v67 = 24;
          goto LABEL_122;
        case 6u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          v5->_hasIsEligibleForPrediction = 1;
          while (2)
          {
            uint64_t v36 = *v7;
            uint64_t v37 = *(void *)&v4[v36];
            unint64_t v38 = v37 + 1;
            if (v37 == -1 || v38 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)&v4[*v10] + v37);
              *(void *)&v4[v36] = v38;
              v35 |= (unint64_t)(v39 & 0x7F) << v33;
              if (v39 < 0)
              {
                v33 += 7;
                BOOL v18 = v34++ >= 9;
                if (v18)
                {
                  uint64_t v35 = 0;
                  goto LABEL_102;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v35 = 0;
          }
LABEL_102:
          BOOL v65 = v35 != 0;
          uint64_t v66 = 82;
          goto LABEL_107;
        case 7u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v42 = 0;
          v5->_hasIsPubliclyIndexable = 1;
          while (2)
          {
            uint64_t v43 = *v7;
            uint64_t v44 = *(void *)&v4[v43];
            unint64_t v45 = v44 + 1;
            if (v44 == -1 || v45 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v46 = *(unsigned char *)(*(void *)&v4[*v10] + v44);
              *(void *)&v4[v43] = v45;
              v42 |= (unint64_t)(v46 & 0x7F) << v40;
              if (v46 < 0)
              {
                v40 += 7;
                BOOL v18 = v41++ >= 9;
                if (v18)
                {
                  uint64_t v42 = 0;
                  goto LABEL_106;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v42 = 0;
          }
LABEL_106:
          BOOL v65 = v42 != 0;
          uint64_t v66 = 84;
LABEL_107:
          *((unsigned char *)&v5->super.super.isa + v66) = v65;
          continue;
        case 8u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 128;
          goto LABEL_90;
        case 9u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 32;
          goto LABEL_90;
        case 0xAu:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 136;
          goto LABEL_90;
        case 0xBu:
          char v47 = 0;
          unsigned int v48 = 0;
          uint64_t v49 = 0;
          v5->_hasShortcutAvailability = 1;
          break;
        case 0xCu:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 144;
          goto LABEL_90;
        case 0xDu:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 152;
          goto LABEL_90;
        case 0xEu:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 160;
          goto LABEL_90;
        case 0xFu:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 168;
          goto LABEL_90;
        case 0x10u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 176;
          goto LABEL_90;
        case 0x11u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 184;
          goto LABEL_90;
        case 0x12u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 192;
          goto LABEL_90;
        case 0x13u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 200;
          goto LABEL_90;
        case 0x14u:
          v5->_hasRaw_calendarUserActivityDate = 1;
          uint64_t v54 = *v7;
          unint64_t v55 = *(void *)&v4[v54];
          if (v55 <= 0xFFFFFFFFFFFFFFF7 && v55 + 8 <= *(void *)&v4[*v8])
          {
            id v32 = *(objc_class **)(*(void *)&v4[*v10] + v55);
            *(void *)&v4[v54] = v55 + 8;
          }
          else
          {
            v4[*v9] = 1;
            id v32 = 0;
          }
          uint64_t v67 = 48;
          goto LABEL_122;
        case 0x15u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 208;
          goto LABEL_90;
        case 0x16u:
          v5->_hasRaw_calendarUserActivityEndDate = 1;
          uint64_t v56 = *v7;
          unint64_t v57 = *(void *)&v4[v56];
          if (v57 <= 0xFFFFFFFFFFFFFFF7 && v57 + 8 <= *(void *)&v4[*v8])
          {
            id v32 = *(objc_class **)(*(void *)&v4[*v10] + v57);
            *(void *)&v4[v56] = v57 + 8;
          }
          else
          {
            v4[*v9] = 1;
            id v32 = 0;
          }
          uint64_t v67 = 64;
          goto LABEL_122;
        case 0x17u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 216;
          goto LABEL_90;
        case 0x18u:
          v5->_hasLatitude = 1;
          uint64_t v58 = *v7;
          unint64_t v59 = *(void *)&v4[v58];
          if (v59 <= 0xFFFFFFFFFFFFFFF7 && v59 + 8 <= *(void *)&v4[*v8])
          {
            id v32 = *(objc_class **)(*(void *)&v4[*v10] + v59);
            *(void *)&v4[v58] = v59 + 8;
          }
          else
          {
            v4[*v9] = 1;
            id v32 = 0;
          }
          uint64_t v67 = 224;
          goto LABEL_122;
        case 0x19u:
          v5->_hasLongitude = 1;
          uint64_t v60 = *v7;
          unint64_t v61 = *(void *)&v4[v60];
          if (v61 <= 0xFFFFFFFFFFFFFFF7 && v61 + 8 <= *(void *)&v4[*v8])
          {
            id v32 = *(objc_class **)(*(void *)&v4[*v10] + v61);
            *(void *)&v4[v60] = v61 + 8;
          }
          else
          {
            v4[*v9] = 1;
            id v32 = 0;
          }
          uint64_t v67 = 232;
LABEL_122:
          *(Class *)((char *)&v5->super.super.isa + v67) = v32;
          continue;
        case 0x1Au:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 240;
          goto LABEL_90;
        case 0x1Bu:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 248;
          goto LABEL_90;
        case 0x1Cu:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 256;
          goto LABEL_90;
        case 0x1Du:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 264;
          goto LABEL_90;
        case 0x1Eu:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 272;
          goto LABEL_90;
        case 0x1Fu:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 280;
          goto LABEL_90;
        case 0x20u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 288;
          goto LABEL_90;
        case 0x21u:
          uint64_t v62 = PBReaderReadString();
          if (!v62) {
            goto LABEL_127;
          }
          v63 = (void *)v62;
          [v6 addObject:v62];

          continue;
        case 0x22u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 304;
          goto LABEL_90;
        case 0x23u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 72;
LABEL_90:
          uint64_t v64 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_127:

          goto LABEL_124;
      }
      while (1)
      {
        uint64_t v50 = *v7;
        uint64_t v51 = *(void *)&v4[v50];
        unint64_t v52 = v51 + 1;
        if (v51 == -1 || v52 > *(void *)&v4[*v8]) {
          break;
        }
        char v53 = *(unsigned char *)(*(void *)&v4[*v10] + v51);
        *(void *)&v4[v50] = v52;
        v49 |= (unint64_t)(v53 & 0x7F) << v47;
        if ((v53 & 0x80) == 0) {
          goto LABEL_109;
        }
        v47 += 7;
        BOOL v18 = v48++ >= 9;
        if (v18)
        {
          LODWORD(v49) = 0;
          goto LABEL_111;
        }
      }
      v4[*v9] = 1;
LABEL_109:
      if (v4[*v9]) {
        LODWORD(v49) = 0;
      }
LABEL_111:
      v5->_shortcutAvailability = v49;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v68 = [v6 copy];
  phoneNumbers = v5->_phoneNumbers;
  v5->_phoneNumbers = (NSArray *)v68;

  int v70 = v4[*v9];
  if (v70) {
LABEL_124:
  }
    v71 = 0;
  else {
LABEL_125:
  }
    v71 = v5;

  return v71;
}

- (NSString)description
{
  id v19 = [NSString alloc];
  uint64_t v42 = [(BMAppLocationActivity *)self bundleID];
  unsigned int v41 = [(BMAppLocationActivity *)self activityType];
  char v40 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppLocationActivity beginningOfActivity](self, "beginningOfActivity"));
  char v39 = [(BMAppLocationActivity *)self contentDescription];
  unint64_t v38 = [(BMAppLocationActivity *)self expirationDate];
  uint64_t v37 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppLocationActivity isEligibleForPrediction](self, "isEligibleForPrediction"));
  uint64_t v36 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppLocationActivity isPubliclyIndexable](self, "isPubliclyIndexable"));
  uint64_t v35 = [(BMAppLocationActivity *)self itemIdentifier];
  id v32 = [(BMAppLocationActivity *)self itemRelatedContentURL];
  unsigned int v34 = [(BMAppLocationActivity *)self itemRelatedUniqueIdentifier];
  char v33 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAppLocationActivity shortcutAvailability](self, "shortcutAvailability"));
  char v29 = [(BMAppLocationActivity *)self suggestedInvocationPhrase];
  unint64_t v31 = [(BMAppLocationActivity *)self title];
  uint64_t v25 = [(BMAppLocationActivity *)self userActivityRequiredString];
  uint64_t v30 = [(BMAppLocationActivity *)self userActivityUUID];
  unint64_t v28 = [(BMAppLocationActivity *)self sourceID];
  BOOL v18 = [(BMAppLocationActivity *)self sourceBundleID];
  uint64_t v27 = [(BMAppLocationActivity *)self sourceItemID];
  char v17 = [(BMAppLocationActivity *)self sourceGroupID];
  uint64_t v26 = [(BMAppLocationActivity *)self calendarUserActivityDate];
  unsigned int v24 = [(BMAppLocationActivity *)self calendarUserActivityExternalID];
  char v23 = [(BMAppLocationActivity *)self calendarUserActivityEndDate];
  unint64_t v16 = [(BMAppLocationActivity *)self locationName];
  v3 = NSNumber;
  [(BMAppLocationActivity *)self latitude];
  uint64_t v22 = objc_msgSend(v3, "numberWithDouble:");
  id v4 = NSNumber;
  [(BMAppLocationActivity *)self longitude];
  uint64_t v21 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v14 = [(BMAppLocationActivity *)self city];
  uint64_t v15 = [(BMAppLocationActivity *)self stateOrProvince];
  uint64_t v5 = [(BMAppLocationActivity *)self country];
  uint64_t v6 = [(BMAppLocationActivity *)self thoroughfare];
  unint64_t v13 = [(BMAppLocationActivity *)self fullyFormattedAddress];
  uint64_t v7 = [(BMAppLocationActivity *)self subThoroughfare];
  uint64_t v8 = [(BMAppLocationActivity *)self postalCode];
  uint64_t v9 = [(BMAppLocationActivity *)self phoneNumbers];
  long long v10 = [(BMAppLocationActivity *)self displayName];
  char v11 = [(BMAppLocationActivity *)self URL];
  id v20 = (id)objc_msgSend(v19, "initWithFormat:", @"BMAppLocationActivity with bundleID: %@, activityType: %@, beginningOfActivity: %@, contentDescription: %@, expirationDate: %@, isEligibleForPrediction: %@, isPubliclyIndexable: %@, itemIdentifier: %@, itemRelatedContentURL: %@, itemRelatedUniqueIdentifier: %@, shortcutAvailability: %@, suggestedInvocationPhrase: %@, title: %@, userActivityRequiredString: %@, userActivityUUID: %@, sourceID: %@, sourceBundleID: %@, sourceItemID: %@, sourceGroupID: %@, calendarUserActivityDate: %@, calendarUserActivityExternalID: %@, calendarUserActivityEndDate: %@, locationName: %@, latitude: %@, longitude: %@, city: %@, stateOrProvince: %@, country: %@, thoroughfare: %@, fullyFormattedAddress: %@, subThoroughfare: %@, postalCode: %@, phoneNumbers: %@, displayName: %@, URL: %@", v42, v41, v40, v39, v38, v37, v36, v35, v32, v34, v33, v29, v31, v25, v30, v28,
              v18,
              v27,
              v17,
              v26,
              v24,
              v23,
              v16,
              v22,
              v21,
              v14,
              v15,
              v5,
              v6,
              v13,
              v7,
              v8,
              v9,
              v10,
              v11);

  return (NSString *)v20;
}

- (BMAppLocationActivity)initWithBundleID:(id)a3 activityType:(id)a4 beginningOfActivity:(id)a5 contentDescription:(id)a6 expirationDate:(id)a7 isEligibleForPrediction:(id)a8 isPubliclyIndexable:(id)a9 itemIdentifier:(id)a10 itemRelatedContentURL:(id)a11 itemRelatedUniqueIdentifier:(id)a12 shortcutAvailability:(id)a13 suggestedInvocationPhrase:(id)a14 title:(id)a15 userActivityRequiredString:(id)a16 userActivityUUID:(id)a17 sourceID:(id)a18 sourceBundleID:(id)a19 sourceItemID:(id)a20 sourceGroupID:(id)a21 calendarUserActivityDate:(id)a22 calendarUserActivityExternalID:(id)a23 calendarUserActivityEndDate:(id)a24 locationName:(id)a25 latitude:(id)a26 longitude:(id)a27 city:(id)a28 stateOrProvince:(id)a29 country:(id)a30 thoroughfare:(id)a31 fullyFormattedAddress:(id)a32 subThoroughfare:(id)a33 postalCode:(id)a34 phoneNumbers:(id)a35 displayName:(id)a36 URL:(id)a37
{
  id v79 = a3;
  id v61 = a4;
  id v78 = a4;
  id v89 = a5;
  id v77 = a6;
  id v88 = a7;
  id v91 = a8;
  id v85 = a9;
  id v76 = a10;
  id v84 = a11;
  id v75 = a12;
  id v82 = a13;
  id v74 = a14;
  id v73 = a15;
  id v72 = a16;
  id v71 = a17;
  id v70 = a18;
  id v69 = a19;
  id v68 = a20;
  id v67 = a21;
  id v83 = a22;
  id v66 = a23;
  id v81 = a24;
  id v65 = a25;
  id v86 = a26;
  id v80 = a27;
  id v64 = a28;
  id v63 = a29;
  id v40 = a30;
  id v41 = a31;
  id v42 = a32;
  id v43 = a33;
  id v44 = a34;
  id v45 = a35;
  id v46 = a36;
  id v47 = a37;
  v92.receiver = self;
  v92.super_class = (Class)BMAppLocationActivity;
  unsigned int v48 = [(BMEventBase *)&v92 init];
  if (v48)
  {
    v48->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v48->_bundleID, a3);
    objc_storeStrong((id *)&v48->_activityType, v61);
    if (v89)
    {
      v48->_hasBeginningOfActivity = 1;
      v48->_beginningOfActivity = [v89 BOOLValue];
    }
    else
    {
      v48->_hasBeginningOfActivity = 0;
      v48->_beginningOfActivity = 0;
    }
    objc_storeStrong((id *)&v48->_contentDescription, a6);
    if (v88)
    {
      v48->_hasRaw_expirationDate = 1;
      [v88 timeIntervalSince1970];
    }
    else
    {
      v48->_hasRaw_expirationDate = 0;
      double v49 = -1.0;
    }
    v48->_raw_expirationDate = v49;
    if (v91)
    {
      v48->_hasIsEligibleForPrediction = 1;
      v48->_isEligibleForPrediction = [v91 BOOLValue];
    }
    else
    {
      v48->_hasIsEligibleForPrediction = 0;
      v48->_isEligibleForPrediction = 0;
    }
    if (v85)
    {
      v48->_hasIsPubliclyIndexable = 1;
      v48->_isPubliclyIndexable = [v85 BOOLValue];
    }
    else
    {
      v48->_hasIsPubliclyIndexable = 0;
      v48->_isPubliclyIndexable = 0;
    }
    objc_storeStrong((id *)&v48->_itemIdentifier, a10);
    if (v84)
    {
      uint64_t v50 = [v84 absoluteString];
      raw_itemRelatedContentURL = v48->_raw_itemRelatedContentURL;
      v48->_raw_itemRelatedContentURL = (NSString *)v50;
    }
    else
    {
      raw_itemRelatedContentURL = v48->_raw_itemRelatedContentURL;
      v48->_raw_itemRelatedContentURL = 0;
    }

    objc_storeStrong((id *)&v48->_itemRelatedUniqueIdentifier, a12);
    if (v82)
    {
      v48->_hasShortcutAvailability = 1;
      int v52 = [v82 intValue];
    }
    else
    {
      v48->_hasShortcutAvailability = 0;
      int v52 = -1;
    }
    v48->_shortcutAvailability = v52;
    objc_storeStrong((id *)&v48->_suggestedInvocationPhrase, a14);
    objc_storeStrong((id *)&v48->_title, a15);
    objc_storeStrong((id *)&v48->_userActivityRequiredString, a16);
    objc_storeStrong((id *)&v48->_userActivityUUID, a17);
    objc_storeStrong((id *)&v48->_sourceID, a18);
    objc_storeStrong((id *)&v48->_sourceBundleID, a19);
    objc_storeStrong((id *)&v48->_sourceItemID, a20);
    objc_storeStrong((id *)&v48->_sourceGroupID, a21);
    if (v83)
    {
      v48->_hasRaw_calendarUserActivityDate = 1;
      [v83 timeIntervalSinceReferenceDate];
    }
    else
    {
      v48->_hasRaw_calendarUserActivityDate = 0;
      double v53 = -1.0;
    }
    v48->_raw_calendarUserActivityDate = v53;
    objc_storeStrong((id *)&v48->_calendarUserActivityExternalID, a23);
    if (v81)
    {
      v48->_hasRaw_calendarUserActivityEndDate = 1;
      [v81 timeIntervalSinceReferenceDate];
    }
    else
    {
      v48->_hasRaw_calendarUserActivityEndDate = 0;
      double v54 = -1.0;
    }
    v48->_raw_calendarUserActivityEndDate = v54;
    objc_storeStrong((id *)&v48->_locationName, a25);
    if (v86)
    {
      v48->_hasLatitude = 1;
      [v86 doubleValue];
    }
    else
    {
      v48->_hasLatitude = 0;
      double v55 = -1.0;
    }
    v48->_latitude = v55;
    if (v80)
    {
      v48->_hasLongitude = 1;
      [v80 doubleValue];
    }
    else
    {
      v48->_hasLongitude = 0;
      double v56 = -1.0;
    }
    v48->_longitude = v56;
    objc_storeStrong((id *)&v48->_city, a28);
    objc_storeStrong((id *)&v48->_stateOrProvince, a29);
    objc_storeStrong((id *)&v48->_country, a30);
    objc_storeStrong((id *)&v48->_thoroughfare, a31);
    objc_storeStrong((id *)&v48->_fullyFormattedAddress, a32);
    objc_storeStrong((id *)&v48->_subThoroughfare, a33);
    objc_storeStrong((id *)&v48->_postalCode, a34);
    objc_storeStrong((id *)&v48->_phoneNumbers, a35);
    objc_storeStrong((id *)&v48->_displayName, a36);
    if (v47)
    {
      uint64_t v57 = [v47 absoluteString];
      raw_URL = v48->_raw_URL;
      v48->_raw_URL = (NSString *)v57;
    }
    else
    {
      raw_URL = v48->_raw_URL;
      v48->_raw_URL = 0;
    }
  }
  return v48;
}

+ (id)protoFields
{
  v39[35] = *MEMORY[0x1E4F143B8];
  unint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleID" number:1 type:13 subMessageClass:0];
  v39[0] = v38;
  uint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activityType" number:2 type:13 subMessageClass:0];
  v39[1] = v37;
  uint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"beginningOfActivity" number:3 type:12 subMessageClass:0];
  v39[2] = v36;
  uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentDescription" number:4 type:13 subMessageClass:0];
  v39[3] = v35;
  unsigned int v34 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"expirationDate" number:5 type:0 subMessageClass:0];
  v39[4] = v34;
  char v33 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isEligibleForPrediction" number:6 type:12 subMessageClass:0];
  v39[5] = v33;
  id v32 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isPubliclyIndexable" number:7 type:12 subMessageClass:0];
  v39[6] = v32;
  unint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"itemIdentifier" number:8 type:13 subMessageClass:0];
  v39[7] = v31;
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"itemRelatedContentURL" number:9 type:13 subMessageClass:0];
  v39[8] = v30;
  char v29 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"itemRelatedUniqueIdentifier" number:10 type:13 subMessageClass:0];
  v39[9] = v29;
  unint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shortcutAvailability" number:11 type:2 subMessageClass:0];
  v39[10] = v28;
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"suggestedInvocationPhrase" number:12 type:13 subMessageClass:0];
  v39[11] = v27;
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"title" number:13 type:13 subMessageClass:0];
  v39[12] = v26;
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userActivityRequiredString" number:14 type:13 subMessageClass:0];
  v39[13] = v25;
  unsigned int v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userActivityUUID" number:15 type:13 subMessageClass:0];
  v39[14] = v24;
  char v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sourceID" number:16 type:13 subMessageClass:0];
  v39[15] = v23;
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sourceBundleID" number:17 type:13 subMessageClass:0];
  v39[16] = v22;
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sourceItemID" number:18 type:13 subMessageClass:0];
  v39[17] = v21;
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sourceGroupID" number:19 type:13 subMessageClass:0];
  v39[18] = v20;
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"calendarUserActivityDate" number:20 type:0 subMessageClass:0];
  v39[19] = v19;
  BOOL v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"calendarUserActivityExternalID" number:21 type:13 subMessageClass:0];
  v39[20] = v18;
  char v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"calendarUserActivityEndDate" number:22 type:0 subMessageClass:0];
  v39[21] = v17;
  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"locationName" number:23 type:13 subMessageClass:0];
  v39[22] = v16;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"latitude" number:24 type:0 subMessageClass:0];
  v39[23] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"longitude" number:25 type:0 subMessageClass:0];
  v39[24] = v14;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"city" number:26 type:13 subMessageClass:0];
  v39[25] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stateOrProvince" number:27 type:13 subMessageClass:0];
  v39[26] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"country" number:28 type:13 subMessageClass:0];
  v39[27] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"thoroughfare" number:29 type:13 subMessageClass:0];
  v39[28] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fullyFormattedAddress" number:30 type:13 subMessageClass:0];
  v39[29] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"subThoroughfare" number:31 type:13 subMessageClass:0];
  v39[30] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"postalCode" number:32 type:13 subMessageClass:0];
  v39[31] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"phoneNumbers" number:33 type:13 subMessageClass:0];
  v39[32] = v9;
  long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"displayName" number:34 type:13 subMessageClass:0];
  v39[33] = v10;
  char v11 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"URL" number:35 type:13 subMessageClass:0];
  v39[34] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:35];

  return v13;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4E30;
}

+ (id)columns
{
  v39[35] = *MEMORY[0x1E4F143B8];
  unint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  uint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"activityType" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  uint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"beginningOfActivity" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentDescription" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  unsigned int v34 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"expirationDate" dataType:3 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:2];
  char v33 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isEligibleForPrediction" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  id v32 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isPubliclyIndexable" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  unint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"itemIdentifier" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"itemRelatedContentURL" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:4];
  char v29 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"itemRelatedUniqueIdentifier" dataType:2 requestOnly:0 fieldNumber:10 protoDataType:13 convertedType:0];
  unint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shortcutAvailability" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:2 convertedType:0];
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"suggestedInvocationPhrase" dataType:2 requestOnly:0 fieldNumber:12 protoDataType:13 convertedType:0];
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"title" dataType:2 requestOnly:0 fieldNumber:13 protoDataType:13 convertedType:0];
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userActivityRequiredString" dataType:2 requestOnly:0 fieldNumber:14 protoDataType:13 convertedType:0];
  unsigned int v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userActivityUUID" dataType:2 requestOnly:0 fieldNumber:15 protoDataType:13 convertedType:0];
  char v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sourceID" dataType:2 requestOnly:0 fieldNumber:16 protoDataType:13 convertedType:0];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sourceBundleID" dataType:2 requestOnly:0 fieldNumber:17 protoDataType:13 convertedType:0];
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sourceItemID" dataType:2 requestOnly:0 fieldNumber:18 protoDataType:13 convertedType:0];
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sourceGroupID" dataType:2 requestOnly:0 fieldNumber:19 protoDataType:13 convertedType:0];
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"calendarUserActivityDate" dataType:3 requestOnly:0 fieldNumber:20 protoDataType:0 convertedType:1];
  BOOL v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"calendarUserActivityExternalID" dataType:2 requestOnly:0 fieldNumber:21 protoDataType:13 convertedType:0];
  char v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"calendarUserActivityEndDate" dataType:3 requestOnly:0 fieldNumber:22 protoDataType:0 convertedType:1];
  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"locationName" dataType:2 requestOnly:0 fieldNumber:23 protoDataType:13 convertedType:0];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"latitude" dataType:1 requestOnly:0 fieldNumber:24 protoDataType:0 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"longitude" dataType:1 requestOnly:0 fieldNumber:25 protoDataType:0 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"city" dataType:2 requestOnly:0 fieldNumber:26 protoDataType:13 convertedType:0];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"stateOrProvince" dataType:2 requestOnly:0 fieldNumber:27 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"country" dataType:2 requestOnly:0 fieldNumber:28 protoDataType:13 convertedType:0];
  unsigned int v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"thoroughfare" dataType:2 requestOnly:0 fieldNumber:29 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"fullyFormattedAddress" dataType:2 requestOnly:0 fieldNumber:30 protoDataType:13 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"subThoroughfare" dataType:2 requestOnly:0 fieldNumber:31 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"postalCode" dataType:2 requestOnly:0 fieldNumber:32 protoDataType:13 convertedType:0];
  char v11 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"phoneNumbers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_39162];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"displayName" dataType:2 requestOnly:0 fieldNumber:34 protoDataType:13 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"URL" dataType:2 requestOnly:0 fieldNumber:35 protoDataType:13 convertedType:4];
  v39[0] = v38;
  v39[1] = v37;
  v39[2] = v36;
  v39[3] = v35;
  v39[4] = v34;
  v39[5] = v33;
  v39[6] = v32;
  v39[7] = v31;
  v39[8] = v30;
  v39[9] = v29;
  v39[10] = v28;
  v39[11] = v27;
  v39[12] = v26;
  v39[13] = v25;
  v39[14] = v24;
  v39[15] = v23;
  v39[16] = v22;
  v39[17] = v21;
  v39[18] = v20;
  v39[19] = v19;
  v39[20] = v18;
  v39[21] = v17;
  v39[22] = v16;
  v39[23] = v15;
  v39[24] = v14;
  v39[25] = v2;
  v39[26] = v13;
  v39[27] = v3;
  v39[28] = v12;
  v39[29] = v4;
  v39[30] = v5;
  v39[31] = v6;
  v39[32] = v11;
  v39[33] = v7;
  v39[34] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:35];

  return v10;
}

id __32__BMAppLocationActivity_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 _phoneNumbersJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMAppLocationActivity alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[23] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end