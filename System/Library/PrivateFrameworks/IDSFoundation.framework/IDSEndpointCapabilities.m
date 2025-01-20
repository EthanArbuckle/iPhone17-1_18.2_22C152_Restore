@interface IDSEndpointCapabilities
+ (BOOL)supportsSecureCoding;
+ (id)allowedCapabilities;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEndpointCapabilites:(id)a3;
- (IDSEndpointCapabilities)initWithCapabilitiesMap:(id)a3;
- (IDSEndpointCapabilities)initWithCoder:(id)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)valueForCapability:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSEndpointCapabilities

+ (id)allowedCapabilities
{
  v5[92] = *MEMORY[0x1E4F143B8];
  v5[0] = @"supports-key-sharing";
  v5[1] = @"supports-harmony";
  v5[2] = @"supports-fmd-v2";
  v5[3] = @"supports-fm-fence-v1";
  v5[4] = @"supports-location-sharing";
  v5[5] = @"supports-screen-time-v2";
  v5[6] = @"supports-incoming-fmd-v1";
  v5[7] = @"supports-secure-loc-v1";
  v5[8] = @"supports-activity-sharing-v1";
  v5[9] = @"supports-manatee-for-apple-cash";
  v5[10] = @"supports-region-for-apple-cash";
  v5[11] = @"supports-hk-resident";
  v5[12] = @"supports-maps-routing-path-leg";
  v5[13] = @"supports-beacon-sharing-v2";
  v5[14] = @"supports-beneficiary-invites";
  v5[15] = @"supports-st-er";
  v5[16] = @"supports-maps-waypoint-route-sharing";
  v5[17] = @"supports-maps-protocol-v5";
  v5[18] = @"supports-cross-platform-sharing";
  v5[19] = @"supports-zelkova";
  v5[20] = @"supports-people-ranging-v1";
  v5[21] = @"supports-beacon-sharing-v3";
  v5[22] = @"supports-gft-relay";
  v5[23] = @"supports-manatee-activity-sharing";
  v5[24] = @"supports-restricted-guest";
  v5[25] = @"supports-remote-atv-signin";
  v5[26] = @"ec-version";
  v5[27] = @"is-c2k-equipment";
  v5[28] = @"show-peer-errors";
  v5[29] = @"nicknames-version";
  v5[30] = @"optionally-receive-typing-indicators";
  v5[31] = @"supports-inline-attachments";
  v5[32] = @"supports-keep-receipts";
  v5[33] = @"supports-st-v1";
  v5[34] = @"supports-ca-v1";
  v5[35] = @"supports-be-v1";
  v5[36] = @"supports-ack-v1";
  v5[37] = @"supports-fsm-v1";
  v5[38] = @"supports-fsm-v2";
  v5[39] = @"supports-fsm-v3";
  v5[40] = @"supports-ii-v1";
  v5[41] = @"supports-impact-v1";
  v5[42] = @"supports-update-attachments-v1";
  v5[43] = @"supports-autoloopvideo-v1";
  v5[44] = @"supports-media-v2";
  v5[45] = @"supports-photos-extension-v1";
  v5[46] = @"supports-photos-extension-v2";
  v5[47] = @"supports-audio-messaging-v2";
  v5[48] = @"supports-animoji-v2";
  v5[49] = @"supports-certified-delivery-v1";
  v5[50] = @"supports-original-timestamp-v1";
  v5[51] = @"supports-protobuf-payload-data-v2";
  v5[52] = @"supports-heif";
  v5[53] = @"supports-hdr";
  v5[54] = @"prefers-sdr";
  v5[55] = @"supports-sa-v1";
  v5[56] = @"supports-uwb";
  v5[57] = @"supports-dq-nr";
  v5[58] = @"supports-rem";
  v5[59] = @"supports-people-request-messages";
  v5[60] = @"supports-family-invite-message-bubble";
  v5[61] = @"supports-people-request-messages-v2";
  v5[62] = @"supports-askto";
  v5[63] = @"supports-emoji-stickers";
  v5[64] = @"supports-sticker-editing";
  v5[65] = @"supports-hybrid-groups-v1";
  v5[66] = @"supports-findmy-plugin-messages";
  v5[67] = @"supports-sos-alerting";
  v5[68] = @"supports-people-request-messages-v3";
  v5[69] = @"supports-recurring-payment-bubbles";
  v5[70] = @"supports-group-photo-refresh-version";
  v5[71] = @"supports-emoji-tapbacks";
  v5[72] = @"supports-send-later-messages";
  v5[73] = @"supports-emoji-images";
  v5[74] = @"supports-stick-moji-backs";
  v5[75] = @"supports-high-quality-photo-file-sizes";
  v5[76] = @"supports-stewie";
  v5[77] = @"sender-key-message-version";
  v5[78] = @"supports-sender-key-v1";
  v5[79] = @"supports-recovery-contact-upsell";
  v5[80] = @"supports-modern-gft";
  v5[81] = @"supports-co";
  v5[82] = @"is-green-tea";
  v5[83] = @"supports-gft-errors";
  v5[84] = @"supports-gft-calls";
  v5[85] = @"is-web-client";
  v5[86] = @"supports-avless";
  v5[87] = @"supports-self-one-to-one-invites";
  v5[88] = @"supports-hi-res-vid";
  v5[89] = @"supports-ssrc";
  v5[90] = @"gs-supports-friending-via-push";
  v5[91] = @"gs-supports-message-transport-v2";
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v5, v2, 92);
  return v3;
}

- (IDSEndpointCapabilities)initWithCapabilitiesMap:(id)a3
{
  uint64_t v574 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v572.receiver = self;
  v572.super_class = (Class)IDSEndpointCapabilities;
  v5 = [(IDSEndpointCapabilities *)&v572 init];

  if (v5)
  {
    long long v570 = 0u;
    long long v571 = 0u;
    long long v568 = 0u;
    long long v569 = 0u;
    id v565 = v4;
    id v6 = v4;
    uint64_t v567 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v568, v8, v573, 16);
    if (v567)
    {
      uint64_t v566 = *(void *)v569;
      do
      {
        for (uint64_t i = 0; i != v567; ++i)
        {
          if (*(void *)v569 != v566) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v568 + 1) + 8 * i);
          if (objc_msgSend_isEqualToString_(v12, v9, @"supports-key-sharing", v10, v565))
          {
            v15 = objc_msgSend_objectForKey_(v6, v13, @"supports-key-sharing", v14);
            v5->_supportsKeySharing = objc_msgSend_shortValue(v15, v16, v17, v18);
          }
          if (objc_msgSend_isEqualToString_(v12, v13, @"supports-harmony", v14))
          {
            v21 = objc_msgSend_objectForKey_(v6, v19, @"supports-harmony", v20);
            v5->_supportsHarmony = objc_msgSend_shortValue(v21, v22, v23, v24);
          }
          if (objc_msgSend_isEqualToString_(v12, v19, @"supports-fmd-v2", v20))
          {
            v27 = objc_msgSend_objectForKey_(v6, v25, @"supports-fmd-v2", v26);
            v5->_supportsFMDV2 = objc_msgSend_shortValue(v27, v28, v29, v30);
          }
          if (objc_msgSend_isEqualToString_(v12, v25, @"supports-fm-fence-v1", v26))
          {
            v33 = objc_msgSend_objectForKey_(v6, v31, @"supports-fm-fence-v1", v32);
            v5->_supportsFMFenceV1 = objc_msgSend_shortValue(v33, v34, v35, v36);
          }
          if (objc_msgSend_isEqualToString_(v12, v31, @"supports-location-sharing", v32))
          {
            v39 = objc_msgSend_objectForKey_(v6, v37, @"supports-location-sharing", v38);
            v5->_supportsLocationSharing = objc_msgSend_shortValue(v39, v40, v41, v42);
          }
          if (objc_msgSend_isEqualToString_(v12, v37, @"supports-screen-time-v2", v38))
          {
            v45 = objc_msgSend_objectForKey_(v6, v43, @"supports-screen-time-v2", v44);
            v5->_supportsScreenTimeV2 = objc_msgSend_shortValue(v45, v46, v47, v48);
          }
          if (objc_msgSend_isEqualToString_(v12, v43, @"supports-incoming-fmd-v1", v44))
          {
            v51 = objc_msgSend_objectForKey_(v6, v49, @"supports-incoming-fmd-v1", v50);
            v5->_supportsIncomingFindMyV1 = objc_msgSend_shortValue(v51, v52, v53, v54);
          }
          if (objc_msgSend_isEqualToString_(v12, v49, @"supports-secure-loc-v1", v50))
          {
            v57 = objc_msgSend_objectForKey_(v6, v55, @"supports-secure-loc-v1", v56);
            v5->_supportsSecureLocationsV1 = objc_msgSend_shortValue(v57, v58, v59, v60);
          }
          if (objc_msgSend_isEqualToString_(v12, v55, @"supports-activity-sharing-v1", v56))
          {
            v63 = objc_msgSend_objectForKey_(v6, v61, @"supports-activity-sharing-v1", v62);
            v5->_supportsActivitySharing = objc_msgSend_shortValue(v63, v64, v65, v66);
          }
          if (objc_msgSend_isEqualToString_(v12, v61, @"supports-manatee-for-apple-cash", v62))
          {
            v69 = objc_msgSend_objectForKey_(v6, v67, @"supports-manatee-for-apple-cash", v68);
            v5->_supportsManateeForAppleCash = objc_msgSend_shortValue(v69, v70, v71, v72);
          }
          if (objc_msgSend_isEqualToString_(v12, v67, @"supports-region-for-apple-cash", v68))
          {
            v75 = objc_msgSend_objectForKey_(v6, v73, @"supports-region-for-apple-cash", v74);
            v5->_supportsRegionForAppleCash = objc_msgSend_shortValue(v75, v76, v77, v78);
          }
          if (objc_msgSend_isEqualToString_(v12, v73, @"supports-hk-resident", v74))
          {
            v81 = objc_msgSend_objectForKey_(v6, v79, @"supports-hk-resident", v80);
            v5->_supportsHomeKitResident = objc_msgSend_shortValue(v81, v82, v83, v84);
          }
          if (objc_msgSend_isEqualToString_(v12, v79, @"supports-maps-routing-path-leg", v80))
          {
            v87 = objc_msgSend_objectForKey_(v6, v85, @"supports-maps-routing-path-leg", v86);
            v5->_supportsMapsRoutingPathLeg = objc_msgSend_shortValue(v87, v88, v89, v90);
          }
          if (objc_msgSend_isEqualToString_(v12, v85, @"supports-beacon-sharing-v2", v86))
          {
            v93 = objc_msgSend_objectForKey_(v6, v91, @"supports-beacon-sharing-v2", v92);
            v5->_supportsBeaconSharingV2 = objc_msgSend_shortValue(v93, v94, v95, v96);
          }
          if (objc_msgSend_isEqualToString_(v12, v91, @"supports-beneficiary-invites", v92))
          {
            v99 = objc_msgSend_objectForKey_(v6, v97, @"supports-beneficiary-invites", v98);
            v5->_supportsBeneficiaryInvites = objc_msgSend_shortValue(v99, v100, v101, v102);
          }
          if (objc_msgSend_isEqualToString_(v12, v97, @"supports-st-er", v98))
          {
            v105 = objc_msgSend_objectForKey_(v6, v103, @"supports-st-er", v104);
            v5->_supportsScreenTimeErrors = objc_msgSend_shortValue(v105, v106, v107, v108);
          }
          if (objc_msgSend_isEqualToString_(v12, v103, @"supports-maps-waypoint-route-sharing", v104))
          {
            v111 = objc_msgSend_objectForKey_(v6, v109, @"supports-maps-waypoint-route-sharing", v110);
            v5->_supportsMapsWaypointRouteSharing = objc_msgSend_shortValue(v111, v112, v113, v114);
          }
          if (objc_msgSend_isEqualToString_(v12, v109, @"supports-maps-protocol-v5", v110))
          {
            v117 = objc_msgSend_objectForKey_(v6, v115, @"supports-maps-protocol-v5", v116);
            v5->_supportsMapsProtocolV5 = objc_msgSend_shortValue(v117, v118, v119, v120);
          }
          if (objc_msgSend_isEqualToString_(v12, v115, @"supports-cross-platform-sharing", v116))
          {
            v123 = objc_msgSend_objectForKey_(v6, v121, @"supports-cross-platform-sharing", v122);
            v5->_supportsCrossPlatformSharing = objc_msgSend_shortValue(v123, v124, v125, v126);
          }
          if (objc_msgSend_isEqualToString_(v12, v121, @"supports-zelkova", v122))
          {
            v129 = objc_msgSend_objectForKey_(v6, v127, @"supports-zelkova", v128);
            v5->_supportsZelkova = objc_msgSend_shortValue(v129, v130, v131, v132);
          }
          if (objc_msgSend_isEqualToString_(v12, v127, @"supports-people-ranging-v1", v128))
          {
            v135 = objc_msgSend_objectForKey_(v6, v133, @"supports-people-ranging-v1", v134);
            v5->_supportsPeopleRangingV1 = objc_msgSend_shortValue(v135, v136, v137, v138);
          }
          if (objc_msgSend_isEqualToString_(v12, v133, @"supports-beacon-sharing-v3", v134))
          {
            v141 = objc_msgSend_objectForKey_(v6, v139, @"supports-beacon-sharing-v3", v140);
            v5->_supportsBeaconSharingV3 = objc_msgSend_shortValue(v141, v142, v143, v144);
          }
          if (objc_msgSend_isEqualToString_(v12, v139, @"supports-gft-relay", v140))
          {
            v147 = objc_msgSend_objectForKey_(v6, v145, @"supports-gft-relay", v146);
            v5->_supportsGFTRelay = objc_msgSend_shortValue(v147, v148, v149, v150);
          }
          if (objc_msgSend_isEqualToString_(v12, v145, @"supports-manatee-activity-sharing", v146))
          {
            v153 = objc_msgSend_objectForKey_(v6, v151, @"supports-manatee-activity-sharing", v152);
            v5->_supportsManateeActivitySharing = objc_msgSend_shortValue(v153, v154, v155, v156);
          }
          if (objc_msgSend_isEqualToString_(v12, v151, @"supports-restricted-guest", v152))
          {
            v159 = objc_msgSend_objectForKey_(v6, v157, @"supports-restricted-guest", v158);
            v5->_supportsRestrictedGuest = objc_msgSend_shortValue(v159, v160, v161, v162);
          }
          if (objc_msgSend_isEqualToString_(v12, v157, @"supports-remote-atv-signin", v158))
          {
            v165 = objc_msgSend_objectForKey_(v6, v163, @"supports-remote-atv-signin", v164);
            v5->_supportsRemoteATVSignIn = objc_msgSend_shortValue(v165, v166, v167, v168);
          }
          if (objc_msgSend_isEqualToString_(v12, v163, @"ec-version", v164))
          {
            v171 = objc_msgSend_objectForKey_(v6, v169, @"ec-version", v170);
            v5->_ecVersion = objc_msgSend_shortValue(v171, v172, v173, v174);
          }
          if (objc_msgSend_isEqualToString_(v12, v169, @"is-c2k-equipment", v170))
          {
            v177 = objc_msgSend_objectForKey_(v6, v175, @"is-c2k-equipment", v176);
            v5->_isC2KEquipment = objc_msgSend_shortValue(v177, v178, v179, v180);
          }
          if (objc_msgSend_isEqualToString_(v12, v175, @"show-peer-errors", v176))
          {
            v183 = objc_msgSend_objectForKey_(v6, v181, @"show-peer-errors", v182);
            v5->_showPeerErrors = objc_msgSend_shortValue(v183, v184, v185, v186);
          }
          if (objc_msgSend_isEqualToString_(v12, v181, @"nicknames-version", v182))
          {
            v189 = objc_msgSend_objectForKey_(v6, v187, @"nicknames-version", v188);
            v5->_nicknamesVersion = objc_msgSend_shortValue(v189, v190, v191, v192);
          }
          if (objc_msgSend_isEqualToString_(v12, v187, @"optionally-receive-typing-indicators", v188))
          {
            v195 = objc_msgSend_objectForKey_(v6, v193, @"optionally-receive-typing-indicators", v194);
            v5->_optionallyReceiveTypingIndicator = objc_msgSend_shortValue(v195, v196, v197, v198);
          }
          if (objc_msgSend_isEqualToString_(v12, v193, @"supports-inline-attachments", v194))
          {
            v201 = objc_msgSend_objectForKey_(v6, v199, @"supports-inline-attachments", v200);
            v5->_supportsInlineAttachments = objc_msgSend_shortValue(v201, v202, v203, v204);
          }
          if (objc_msgSend_isEqualToString_(v12, v199, @"supports-keep-receipts", v200))
          {
            v207 = objc_msgSend_objectForKey_(v6, v205, @"supports-keep-receipts", v206);
            v5->_supportsKeepReceipts = objc_msgSend_shortValue(v207, v208, v209, v210);
          }
          if (objc_msgSend_isEqualToString_(v12, v205, @"supports-st-v1", v206))
          {
            v213 = objc_msgSend_objectForKey_(v6, v211, @"supports-st-v1", v212);
            v5->_supportsStickersV1 = objc_msgSend_shortValue(v213, v214, v215, v216);
          }
          if (objc_msgSend_isEqualToString_(v12, v211, @"supports-ca-v1", v212))
          {
            v219 = objc_msgSend_objectForKey_(v6, v217, @"supports-ca-v1", v218);
            v5->_supportsChatAppsV1 = objc_msgSend_shortValue(v219, v220, v221, v222);
          }
          if (objc_msgSend_isEqualToString_(v12, v217, @"supports-be-v1", v218))
          {
            v225 = objc_msgSend_objectForKey_(v6, v223, @"supports-be-v1", v224);
            v5->_supportsBubbleEditingV1 = objc_msgSend_shortValue(v225, v226, v227, v228);
          }
          if (objc_msgSend_isEqualToString_(v12, v223, @"supports-ack-v1", v224))
          {
            v231 = objc_msgSend_objectForKey_(v6, v229, @"supports-ack-v1", v230);
            v5->_supportsAcknowledgementsV1 = objc_msgSend_shortValue(v231, v232, v233, v234);
          }
          if (objc_msgSend_isEqualToString_(v12, v229, @"supports-fsm-v1", v230))
          {
            v237 = objc_msgSend_objectForKey_(v6, v235, @"supports-fsm-v1", v236);
            v5->_supportsFullScreenMomentsV1 = objc_msgSend_shortValue(v237, v238, v239, v240);
          }
          if (objc_msgSend_isEqualToString_(v12, v235, @"supports-fsm-v2", v236))
          {
            v243 = objc_msgSend_objectForKey_(v6, v241, @"supports-fsm-v2", v242);
            v5->_supportsFullScreenMomentsV2 = objc_msgSend_shortValue(v243, v244, v245, v246);
          }
          if (objc_msgSend_isEqualToString_(v12, v241, @"supports-fsm-v3", v242))
          {
            v249 = objc_msgSend_objectForKey_(v6, v247, @"supports-fsm-v3", v248);
            v5->_supportsFullScreenMomentsV3 = objc_msgSend_shortValue(v249, v250, v251, v252);
          }
          if (objc_msgSend_isEqualToString_(v12, v247, @"supports-ii-v1", v248))
          {
            v255 = objc_msgSend_objectForKey_(v6, v253, @"supports-ii-v1", v254);
            v5->_supportsInvisibleInkV1 = objc_msgSend_shortValue(v255, v256, v257, v258);
          }
          if (objc_msgSend_isEqualToString_(v12, v253, @"supports-impact-v1", v254))
          {
            v261 = objc_msgSend_objectForKey_(v6, v259, @"supports-impact-v1", v260);
            v5->_supportsImpactEffectsV1 = objc_msgSend_shortValue(v261, v262, v263, v264);
          }
          if (objc_msgSend_isEqualToString_(v12, v259, @"supports-update-attachments-v1", v260))
          {
            v267 = objc_msgSend_objectForKey_(v6, v265, @"supports-update-attachments-v1", v266);
            v5->_supportsUpdateAttachmentsV1 = objc_msgSend_shortValue(v267, v268, v269, v270);
          }
          if (objc_msgSend_isEqualToString_(v12, v265, @"supports-autoloopvideo-v1", v266))
          {
            v273 = objc_msgSend_objectForKey_(v6, v271, @"supports-autoloopvideo-v1", v272);
            v5->_supportsAutoloopVideoV1 = objc_msgSend_shortValue(v273, v274, v275, v276);
          }
          if (objc_msgSend_isEqualToString_(v12, v271, @"supports-media-v2", v272))
          {
            v279 = objc_msgSend_objectForKey_(v6, v277, @"supports-media-v2", v278);
            v5->_supportsMediaV2 = objc_msgSend_shortValue(v279, v280, v281, v282);
          }
          if (objc_msgSend_isEqualToString_(v12, v277, @"supports-photos-extension-v1", v278))
          {
            v285 = objc_msgSend_objectForKey_(v6, v283, @"supports-photos-extension-v1", v284);
            v5->_supportsPhotosExtensionV1 = objc_msgSend_shortValue(v285, v286, v287, v288);
          }
          if (objc_msgSend_isEqualToString_(v12, v283, @"supports-photos-extension-v2", v284))
          {
            v291 = objc_msgSend_objectForKey_(v6, v289, @"supports-photos-extension-v2", v290);
            v5->_supportsPhotosExtensionV2 = objc_msgSend_shortValue(v291, v292, v293, v294);
          }
          if (objc_msgSend_isEqualToString_(v12, v289, @"supports-audio-messaging-v2", v290))
          {
            v297 = objc_msgSend_objectForKey_(v6, v295, @"supports-audio-messaging-v2", v296);
            v5->_supportsAudioMessagingV2 = objc_msgSend_shortValue(v297, v298, v299, v300);
          }
          if (objc_msgSend_isEqualToString_(v12, v295, @"supports-animoji-v2", v296))
          {
            v303 = objc_msgSend_objectForKey_(v6, v301, @"supports-animoji-v2", v302);
            v5->_supportsAnimojiV2 = objc_msgSend_shortValue(v303, v304, v305, v306);
          }
          if (objc_msgSend_isEqualToString_(v12, v301, @"supports-certified-delivery-v1", v302))
          {
            v309 = objc_msgSend_objectForKey_(v6, v307, @"supports-certified-delivery-v1", v308);
            v5->_supportsCertifiedDeliveryV1 = objc_msgSend_shortValue(v309, v310, v311, v312);
          }
          if (objc_msgSend_isEqualToString_(v12, v307, @"supports-original-timestamp-v1", v308))
          {
            v315 = objc_msgSend_objectForKey_(v6, v313, @"supports-original-timestamp-v1", v314);
            v5->_supportsOriginalTimestampOrderingV1 = objc_msgSend_shortValue(v315, v316, v317, v318);
          }
          if (objc_msgSend_isEqualToString_(v12, v313, @"supports-protobuf-payload-data-v2", v314))
          {
            v321 = objc_msgSend_objectForKey_(v6, v319, @"supports-protobuf-payload-data-v2", v320);
            v5->_supportsProtobufPayloadDataV2 = objc_msgSend_shortValue(v321, v322, v323, v324);
          }
          if (objc_msgSend_isEqualToString_(v12, v319, @"supports-heif", v320))
          {
            v327 = objc_msgSend_objectForKey_(v6, v325, @"supports-heif", v326);
            v5->_supportsHEIFEncoding = objc_msgSend_shortValue(v327, v328, v329, v330);
          }
          if (objc_msgSend_isEqualToString_(v12, v325, @"supports-hdr", v326))
          {
            v333 = objc_msgSend_objectForKey_(v6, v331, @"supports-hdr", v332);
            v5->_supportsHDRVideo = objc_msgSend_shortValue(v333, v334, v335, v336);
          }
          if (objc_msgSend_isEqualToString_(v12, v331, @"prefers-sdr", v332))
          {
            v339 = objc_msgSend_objectForKey_(v6, v337, @"prefers-sdr", v338);
            v5->_prefersSDRVideo = objc_msgSend_shortValue(v339, v340, v341, v342);
          }
          if (objc_msgSend_isEqualToString_(v12, v337, @"supports-sa-v1", v338))
          {
            v345 = objc_msgSend_objectForKey_(v6, v343, @"supports-sa-v1", v344);
            v5->_supportsSyndicationActionsV1 = objc_msgSend_shortValue(v345, v346, v347, v348);
          }
          if (objc_msgSend_isEqualToString_(v12, v343, @"supports-uwb", v344))
          {
            v351 = objc_msgSend_objectForKey_(v6, v349, @"supports-uwb", v350);
            v5->_supportsUWB = objc_msgSend_shortValue(v351, v352, v353, v354);
          }
          if (objc_msgSend_isEqualToString_(v12, v349, @"supports-dq-nr", v350))
          {
            v357 = objc_msgSend_objectForKey_(v6, v355, @"supports-dq-nr", v356);
            v5->_supportsDeliveredQuietlyAndNotifyRecipient = objc_msgSend_shortValue(v357, v358, v359, v360);
          }
          if (objc_msgSend_isEqualToString_(v12, v355, @"supports-rem", v356))
          {
            v363 = objc_msgSend_objectForKey_(v6, v361, @"supports-rem", v362);
            v5->_supportsRetractAndEditMessages = objc_msgSend_shortValue(v363, v364, v365, v366);
          }
          if (objc_msgSend_isEqualToString_(v12, v361, @"supports-people-request-messages", v362))
          {
            v369 = objc_msgSend_objectForKey_(v6, v367, @"supports-people-request-messages", v368);
            v5->_supportsPeopleRequestMessages = objc_msgSend_shortValue(v369, v370, v371, v372);
          }
          if (objc_msgSend_isEqualToString_(v12, v367, @"supports-family-invite-message-bubble", v368))
          {
            v375 = objc_msgSend_objectForKey_(v6, v373, @"supports-family-invite-message-bubble", v374);
            v5->_supportsFamilyInviteMessageBubble = objc_msgSend_shortValue(v375, v376, v377, v378);
          }
          if (objc_msgSend_isEqualToString_(v12, v373, @"supports-people-request-messages-v2", v374))
          {
            v381 = objc_msgSend_objectForKey_(v6, v379, @"supports-people-request-messages-v2", v380);
            v5->_supportsPeopleRequestMessagesV2 = objc_msgSend_shortValue(v381, v382, v383, v384);
          }
          if (objc_msgSend_isEqualToString_(v12, v379, @"supports-askto", v380))
          {
            v387 = objc_msgSend_objectForKey_(v6, v385, @"supports-askto", v386);
            v5->_supportsAskTo = objc_msgSend_shortValue(v387, v388, v389, v390);
          }
          if (objc_msgSend_isEqualToString_(v12, v385, @"supports-emoji-stickers", v386))
          {
            v393 = objc_msgSend_objectForKey_(v6, v391, @"supports-emoji-stickers", v392);
            v5->_supportsEmojiStickers = objc_msgSend_shortValue(v393, v394, v395, v396);
          }
          if (objc_msgSend_isEqualToString_(v12, v391, @"supports-sticker-editing", v392))
          {
            v399 = objc_msgSend_objectForKey_(v6, v397, @"supports-sticker-editing", v398);
            v5->_supportsStickerEditing = objc_msgSend_shortValue(v399, v400, v401, v402);
          }
          if (objc_msgSend_isEqualToString_(v12, v397, @"supports-hybrid-groups-v1", v398))
          {
            v405 = objc_msgSend_objectForKey_(v6, v403, @"supports-hybrid-groups-v1", v404);
            v5->_supportsHybridGroupsV1 = objc_msgSend_shortValue(v405, v406, v407, v408);
          }
          if (objc_msgSend_isEqualToString_(v12, v403, @"supports-findmy-plugin-messages", v404))
          {
            v411 = objc_msgSend_objectForKey_(v6, v409, @"supports-findmy-plugin-messages", v410);
            v5->_supportsFindMyPluginMessages = objc_msgSend_shortValue(v411, v412, v413, v414);
          }
          if (objc_msgSend_isEqualToString_(v12, v409, @"supports-sos-alerting", v410))
          {
            v417 = objc_msgSend_objectForKey_(v6, v415, @"supports-sos-alerting", v416);
            v5->_supportsSOSAlerting = objc_msgSend_shortValue(v417, v418, v419, v420);
          }
          if (objc_msgSend_isEqualToString_(v12, v415, @"supports-people-request-messages-v3", v416))
          {
            v423 = objc_msgSend_objectForKey_(v6, v421, @"supports-people-request-messages-v3", v422);
            v5->_supportsPeopleRequestMessagesV3 = objc_msgSend_shortValue(v423, v424, v425, v426);
          }
          if (objc_msgSend_isEqualToString_(v12, v421, @"supports-recurring-payment-bubbles", v422))
          {
            v429 = objc_msgSend_objectForKey_(v6, v427, @"supports-recurring-payment-bubbles", v428);
            v5->_supportsRecurringPaymentBubbles = objc_msgSend_shortValue(v429, v430, v431, v432);
          }
          if (objc_msgSend_isEqualToString_(v12, v427, @"supports-group-photo-refresh-version", v428))
          {
            v435 = objc_msgSend_objectForKey_(v6, v433, @"supports-group-photo-refresh-version", v434);
            v5->_supportsGroupPhotoRefreshVersion = objc_msgSend_shortValue(v435, v436, v437, v438);
          }
          if (objc_msgSend_isEqualToString_(v12, v433, @"supports-emoji-tapbacks", v434))
          {
            v441 = objc_msgSend_objectForKey_(v6, v439, @"supports-emoji-tapbacks", v440);
            v5->_supportsEmojiTapbacks = objc_msgSend_shortValue(v441, v442, v443, v444);
          }
          if (objc_msgSend_isEqualToString_(v12, v439, @"supports-send-later-messages", v440))
          {
            v447 = objc_msgSend_objectForKey_(v6, v445, @"supports-send-later-messages", v446);
            v5->_supportsSendLaterMessages = objc_msgSend_shortValue(v447, v448, v449, v450);
          }
          if (objc_msgSend_isEqualToString_(v12, v445, @"supports-emoji-images", v446))
          {
            v453 = objc_msgSend_objectForKey_(v6, v451, @"supports-emoji-images", v452);
            v5->_supportsEmojiImages = objc_msgSend_shortValue(v453, v454, v455, v456);
          }
          if (objc_msgSend_isEqualToString_(v12, v451, @"supports-stick-moji-backs", v452))
          {
            v459 = objc_msgSend_objectForKey_(v6, v457, @"supports-stick-moji-backs", v458);
            v5->_supportsStickMojiBacks = objc_msgSend_shortValue(v459, v460, v461, v462);
          }
          if (objc_msgSend_isEqualToString_(v12, v457, @"supports-high-quality-photo-file-sizes", v458))
          {
            v465 = objc_msgSend_objectForKey_(v6, v463, @"supports-high-quality-photo-file-sizes", v464);
            v5->_supportsHighQualityPhotoFileSizes = objc_msgSend_shortValue(v465, v466, v467, v468);
          }
          if (objc_msgSend_isEqualToString_(v12, v463, @"supports-stewie", v464))
          {
            v471 = objc_msgSend_objectForKey_(v6, v469, @"supports-stewie", v470);
            v5->_supportsStewie = objc_msgSend_shortValue(v471, v472, v473, v474);
          }
          if (objc_msgSend_isEqualToString_(v12, v469, @"sender-key-message-version", v470))
          {
            v477 = objc_msgSend_objectForKey_(v6, v475, @"sender-key-message-version", v476);
            v5->_senderKeyMessageVersion = objc_msgSend_shortValue(v477, v478, v479, v480);
          }
          if (objc_msgSend_isEqualToString_(v12, v475, @"supports-sender-key-v1", v476))
          {
            v483 = objc_msgSend_objectForKey_(v6, v481, @"supports-sender-key-v1", v482);
            v5->_supportsSenderKey = objc_msgSend_shortValue(v483, v484, v485, v486);
          }
          if (objc_msgSend_isEqualToString_(v12, v481, @"supports-recovery-contact-upsell", v482))
          {
            v489 = objc_msgSend_objectForKey_(v6, v487, @"supports-recovery-contact-upsell", v488);
            v5->_supportsRecoveryContactUpsell = objc_msgSend_shortValue(v489, v490, v491, v492);
          }
          if (objc_msgSend_isEqualToString_(v12, v487, @"supports-modern-gft", v488))
          {
            v495 = objc_msgSend_objectForKey_(v6, v493, @"supports-modern-gft", v494);
            v5->_supportsModernGFT = objc_msgSend_shortValue(v495, v496, v497, v498);
          }
          if (objc_msgSend_isEqualToString_(v12, v493, @"supports-co", v494))
          {
            v501 = objc_msgSend_objectForKey_(v6, v499, @"supports-co", v500);
            v5->_supportsCo = objc_msgSend_shortValue(v501, v502, v503, v504);
          }
          if (objc_msgSend_isEqualToString_(v12, v499, @"is-green-tea", v500))
          {
            v507 = objc_msgSend_objectForKey_(v6, v505, @"is-green-tea", v506);
            v5->_isGreenTea = objc_msgSend_shortValue(v507, v508, v509, v510);
          }
          if (objc_msgSend_isEqualToString_(v12, v505, @"supports-gft-errors", v506))
          {
            v513 = objc_msgSend_objectForKey_(v6, v511, @"supports-gft-errors", v512);
            v5->_supportsGondola = objc_msgSend_shortValue(v513, v514, v515, v516);
          }
          if (objc_msgSend_isEqualToString_(v12, v511, @"supports-gft-calls", v512))
          {
            v519 = objc_msgSend_objectForKey_(v6, v517, @"supports-gft-calls", v518);
            v5->_doesNotSupportGFTCalls = objc_msgSend_shortValue(v519, v520, v521, v522);
          }
          if (objc_msgSend_isEqualToString_(v12, v517, @"is-web-client", v518))
          {
            v525 = objc_msgSend_objectForKey_(v6, v523, @"is-web-client", v524);
            v5->_isWebClient = objc_msgSend_shortValue(v525, v526, v527, v528);
          }
          if (objc_msgSend_isEqualToString_(v12, v523, @"supports-avless", v524))
          {
            v531 = objc_msgSend_objectForKey_(v6, v529, @"supports-avless", v530);
            v5->_supportsAVLess = objc_msgSend_shortValue(v531, v532, v533, v534);
          }
          if (objc_msgSend_isEqualToString_(v12, v529, @"supports-self-one-to-one-invites", v530))
          {
            v537 = objc_msgSend_objectForKey_(v6, v535, @"supports-self-one-to-one-invites", v536);
            v5->_supportsSelfOneToOneInvites = objc_msgSend_shortValue(v537, v538, v539, v540);
          }
          if (objc_msgSend_isEqualToString_(v12, v535, @"supports-hi-res-vid", v536))
          {
            v543 = objc_msgSend_objectForKey_(v6, v541, @"supports-hi-res-vid", v542);
            v5->_supportsHighResVideoMessaging = objc_msgSend_shortValue(v543, v544, v545, v546);
          }
          if (objc_msgSend_isEqualToString_(v12, v541, @"supports-ssrc", v542))
          {
            v549 = objc_msgSend_objectForKey_(v6, v547, @"supports-ssrc", v548);
            v5->_supportsSSRC = objc_msgSend_shortValue(v549, v550, v551, v552);
          }
          if (objc_msgSend_isEqualToString_(v12, v547, @"gs-supports-friending-via-push", v548))
          {
            v555 = objc_msgSend_objectForKey_(v6, v553, @"gs-supports-friending-via-push", v554);
            v5->_supportsFriendingViaPush = objc_msgSend_shortValue(v555, v556, v557, v558);
          }
          if (objc_msgSend_isEqualToString_(v12, v553, @"gs-supports-message-transport-v2", v554))
          {
            v559 = objc_msgSend_objectForKey_(v6, v9, @"gs-supports-message-transport-v2", v10);
            v5->_supportsMessageTransportV2 = objc_msgSend_shortValue(v559, v560, v561, v562);
          }
        }
        uint64_t v567 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v568, v10, v573, 16);
      }
      while (v567);
    }

    id v4 = v565;
  }
  v563 = v5;

  return v563;
}

- (int64_t)valueForCapability:(id)a3
{
  id v4 = a3;
  v7 = v4;
  if (!v4) {
    goto LABEL_187;
  }
  if ((objc_msgSend_isEqualToString_(v4, v5, @"supports-key-sharing", v6) & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v7, v8, @"supports-harmony", v9))
    {
      uint64_t v10 = 9;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v11, @"supports-fmd-v2", v12))
    {
      uint64_t v10 = 10;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v13, @"supports-fm-fence-v1", v14))
    {
      uint64_t v10 = 11;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v15, @"supports-location-sharing", v16))
    {
      uint64_t v10 = 12;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v17, @"supports-screen-time-v2", v18))
    {
      uint64_t v10 = 13;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v19, @"supports-incoming-fmd-v1", v20))
    {
      uint64_t v10 = 14;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v21, @"supports-secure-loc-v1", v22))
    {
      uint64_t v10 = 15;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v23, @"supports-activity-sharing-v1", v24))
    {
      uint64_t v10 = 16;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v25, @"supports-manatee-for-apple-cash", v26))
    {
      uint64_t v10 = 17;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v27, @"supports-region-for-apple-cash", v28))
    {
      uint64_t v10 = 18;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v29, @"supports-hk-resident", v30))
    {
      uint64_t v10 = 19;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v31, @"supports-maps-routing-path-leg", v32))
    {
      uint64_t v10 = 20;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v33, @"supports-beacon-sharing-v2", v34))
    {
      uint64_t v10 = 21;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v35, @"supports-beneficiary-invites", v36))
    {
      uint64_t v10 = 22;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v37, @"supports-st-er", v38))
    {
      uint64_t v10 = 23;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v39, @"supports-maps-waypoint-route-sharing", v40))
    {
      uint64_t v10 = 24;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v41, @"supports-maps-protocol-v5", v42))
    {
      uint64_t v10 = 25;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v43, @"supports-cross-platform-sharing", v44))
    {
      uint64_t v10 = 26;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v45, @"supports-zelkova", v46))
    {
      uint64_t v10 = 27;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v47, @"supports-people-ranging-v1", v48))
    {
      uint64_t v10 = 28;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v49, @"supports-beacon-sharing-v3", v50))
    {
      uint64_t v10 = 29;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v51, @"supports-gft-relay", v52))
    {
      uint64_t v10 = 30;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v53, @"supports-manatee-activity-sharing", v54))
    {
      uint64_t v10 = 31;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v55, @"supports-restricted-guest", v56))
    {
      uint64_t v10 = 32;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v57, @"supports-remote-atv-signin", v58))
    {
      uint64_t v10 = 33;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v59, @"ec-version", v60))
    {
      uint64_t v10 = 34;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v61, @"is-c2k-equipment", v62))
    {
      uint64_t v10 = 35;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v63, @"show-peer-errors", v64))
    {
      uint64_t v10 = 36;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v65, @"nicknames-version", v66))
    {
      uint64_t v10 = 37;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v67, @"optionally-receive-typing-indicators", v68))
    {
      uint64_t v10 = 38;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v69, @"supports-inline-attachments", v70))
    {
      uint64_t v10 = 39;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v71, @"supports-keep-receipts", v72))
    {
      uint64_t v10 = 40;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v73, @"supports-st-v1", v74))
    {
      uint64_t v10 = 41;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v75, @"supports-ca-v1", v76))
    {
      uint64_t v10 = 42;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v77, @"supports-be-v1", v78))
    {
      uint64_t v10 = 43;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v79, @"supports-ack-v1", v80))
    {
      uint64_t v10 = 44;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v81, @"supports-fsm-v1", v82))
    {
      uint64_t v10 = 45;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v83, @"supports-fsm-v2", v84))
    {
      uint64_t v10 = 46;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v85, @"supports-fsm-v3", v86))
    {
      uint64_t v10 = 47;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v87, @"supports-ii-v1", v88))
    {
      uint64_t v10 = 48;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v89, @"supports-impact-v1", v90))
    {
      uint64_t v10 = 49;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v91, @"supports-update-attachments-v1", v92))
    {
      uint64_t v10 = 50;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v93, @"supports-autoloopvideo-v1", v94))
    {
      uint64_t v10 = 51;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v95, @"supports-media-v2", v96))
    {
      uint64_t v10 = 52;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v97, @"supports-photos-extension-v1", v98))
    {
      uint64_t v10 = 53;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v99, @"supports-photos-extension-v2", v100))
    {
      uint64_t v10 = 54;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v101, @"supports-audio-messaging-v2", v102))
    {
      uint64_t v10 = 55;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v103, @"supports-animoji-v2", v104))
    {
      uint64_t v10 = 56;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v105, @"supports-certified-delivery-v1", v106))
    {
      uint64_t v10 = 57;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v107, @"supports-original-timestamp-v1", v108))
    {
      uint64_t v10 = 58;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v109, @"supports-protobuf-payload-data-v2", v110))
    {
      uint64_t v10 = 59;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v111, @"supports-heif", v112))
    {
      uint64_t v10 = 60;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v113, @"supports-hdr", v114))
    {
      uint64_t v10 = 61;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v115, @"prefers-sdr", v116))
    {
      uint64_t v10 = 62;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v117, @"supports-sa-v1", v118))
    {
      uint64_t v10 = 63;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v119, @"supports-uwb", v120))
    {
      uint64_t v10 = 64;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v121, @"supports-dq-nr", v122))
    {
      uint64_t v10 = 65;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v123, @"supports-rem", v124))
    {
      uint64_t v10 = 66;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v125, @"supports-people-request-messages", v126))
    {
      uint64_t v10 = 67;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v127, @"supports-family-invite-message-bubble", v128))
    {
      uint64_t v10 = 68;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v129, @"supports-people-request-messages-v2", v130))
    {
      uint64_t v10 = 69;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v131, @"supports-askto", v132))
    {
      uint64_t v10 = 70;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v133, @"supports-emoji-stickers", v134))
    {
      uint64_t v10 = 71;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v135, @"supports-sticker-editing", v136))
    {
      uint64_t v10 = 72;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v137, @"supports-hybrid-groups-v1", v138))
    {
      uint64_t v10 = 73;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v139, @"supports-findmy-plugin-messages", v140))
    {
      uint64_t v10 = 74;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v141, @"supports-sos-alerting", v142))
    {
      uint64_t v10 = 75;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v143, @"supports-people-request-messages-v3", v144))
    {
      uint64_t v10 = 76;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v145, @"supports-recurring-payment-bubbles", v146))
    {
      uint64_t v10 = 77;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v147, @"supports-group-photo-refresh-version", v148))
    {
      uint64_t v10 = 78;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v149, @"supports-emoji-tapbacks", v150))
    {
      uint64_t v10 = 79;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v151, @"supports-send-later-messages", v152))
    {
      uint64_t v10 = 80;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v153, @"supports-emoji-images", v154))
    {
      uint64_t v10 = 81;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v155, @"supports-stick-moji-backs", v156))
    {
      uint64_t v10 = 82;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v157, @"supports-high-quality-photo-file-sizes", v158))
    {
      uint64_t v10 = 83;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v159, @"supports-stewie", v160))
    {
      uint64_t v10 = 84;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v161, @"sender-key-message-version", v162))
    {
      uint64_t v10 = 85;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v163, @"supports-sender-key-v1", v164))
    {
      uint64_t v10 = 86;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v165, @"supports-recovery-contact-upsell", v166))
    {
      uint64_t v10 = 87;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v167, @"supports-modern-gft", v168))
    {
      uint64_t v10 = 88;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v169, @"supports-co", v170))
    {
      uint64_t v10 = 89;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v171, @"is-green-tea", v172))
    {
      uint64_t v10 = 90;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v173, @"supports-gft-errors", v174))
    {
      uint64_t v10 = 91;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v175, @"supports-gft-calls", v176))
    {
      uint64_t v10 = 92;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v177, @"is-web-client", v178))
    {
      uint64_t v10 = 93;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v179, @"supports-avless", v180))
    {
      uint64_t v10 = 94;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v181, @"supports-self-one-to-one-invites", v182))
    {
      uint64_t v10 = 95;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v183, @"supports-hi-res-vid", v184))
    {
      uint64_t v10 = 96;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v185, @"supports-ssrc", v186))
    {
      uint64_t v10 = 97;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v187, @"gs-supports-friending-via-push", v188))
    {
      uint64_t v10 = 98;
      goto LABEL_186;
    }
    if (objc_msgSend_isEqualToString_(v7, v189, @"gs-supports-message-transport-v2", v190))
    {
      uint64_t v10 = 99;
      goto LABEL_186;
    }
LABEL_187:
    int64_t v191 = 0;
    goto LABEL_188;
  }
  uint64_t v10 = 8;
LABEL_186:
  int64_t v191 = *((char *)&self->super.isa + v10);
LABEL_188:

  return v191;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, @"<%@: %p>", v6, v4, self);
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v4 = objc_opt_class();
  v7 = objc_msgSend_initWithFormat_(v3, v5, @"<%@: %p", v6, v4, self);
  objc_msgSend_appendFormat_(v7, v8, @",\n\t%@ = %d", v9, @"supports-key-sharing", self->_supportsKeySharing);
  objc_msgSend_appendFormat_(v7, v10, @",\n\t%@ = %d", v11, @"supports-harmony", self->_supportsHarmony);
  objc_msgSend_appendFormat_(v7, v12, @",\n\t%@ = %d", v13, @"supports-fmd-v2", self->_supportsFMDV2);
  objc_msgSend_appendFormat_(v7, v14, @",\n\t%@ = %d", v15, @"supports-fm-fence-v1", self->_supportsFMFenceV1);
  objc_msgSend_appendFormat_(v7, v16, @",\n\t%@ = %d", v17, @"supports-location-sharing", self->_supportsLocationSharing);
  objc_msgSend_appendFormat_(v7, v18, @",\n\t%@ = %d", v19, @"supports-screen-time-v2", self->_supportsScreenTimeV2);
  objc_msgSend_appendFormat_(v7, v20, @",\n\t%@ = %d", v21, @"supports-incoming-fmd-v1", self->_supportsIncomingFindMyV1);
  objc_msgSend_appendFormat_(v7, v22, @",\n\t%@ = %d", v23, @"supports-secure-loc-v1", self->_supportsSecureLocationsV1);
  objc_msgSend_appendFormat_(v7, v24, @",\n\t%@ = %d", v25, @"supports-activity-sharing-v1", self->_supportsActivitySharing);
  objc_msgSend_appendFormat_(v7, v26, @",\n\t%@ = %d", v27, @"supports-manatee-for-apple-cash", self->_supportsManateeForAppleCash);
  objc_msgSend_appendFormat_(v7, v28, @",\n\t%@ = %d", v29, @"supports-region-for-apple-cash", self->_supportsRegionForAppleCash);
  objc_msgSend_appendFormat_(v7, v30, @",\n\t%@ = %d", v31, @"supports-hk-resident", self->_supportsHomeKitResident);
  objc_msgSend_appendFormat_(v7, v32, @",\n\t%@ = %d", v33, @"supports-maps-routing-path-leg", self->_supportsMapsRoutingPathLeg);
  objc_msgSend_appendFormat_(v7, v34, @",\n\t%@ = %d", v35, @"supports-beacon-sharing-v2", self->_supportsBeaconSharingV2);
  objc_msgSend_appendFormat_(v7, v36, @",\n\t%@ = %d", v37, @"supports-beneficiary-invites", self->_supportsBeneficiaryInvites);
  objc_msgSend_appendFormat_(v7, v38, @",\n\t%@ = %d", v39, @"supports-st-er", self->_supportsScreenTimeErrors);
  objc_msgSend_appendFormat_(v7, v40, @",\n\t%@ = %d", v41, @"supports-maps-waypoint-route-sharing", self->_supportsMapsWaypointRouteSharing);
  objc_msgSend_appendFormat_(v7, v42, @",\n\t%@ = %d", v43, @"supports-maps-protocol-v5", self->_supportsMapsProtocolV5);
  objc_msgSend_appendFormat_(v7, v44, @",\n\t%@ = %d", v45, @"supports-cross-platform-sharing", self->_supportsCrossPlatformSharing);
  objc_msgSend_appendFormat_(v7, v46, @",\n\t%@ = %d", v47, @"supports-zelkova", self->_supportsZelkova);
  objc_msgSend_appendFormat_(v7, v48, @",\n\t%@ = %d", v49, @"supports-people-ranging-v1", self->_supportsPeopleRangingV1);
  objc_msgSend_appendFormat_(v7, v50, @",\n\t%@ = %d", v51, @"supports-beacon-sharing-v3", self->_supportsBeaconSharingV3);
  objc_msgSend_appendFormat_(v7, v52, @",\n\t%@ = %d", v53, @"supports-gft-relay", self->_supportsGFTRelay);
  objc_msgSend_appendFormat_(v7, v54, @",\n\t%@ = %d", v55, @"supports-manatee-activity-sharing", self->_supportsManateeActivitySharing);
  objc_msgSend_appendFormat_(v7, v56, @",\n\t%@ = %d", v57, @"supports-restricted-guest", self->_supportsRestrictedGuest);
  objc_msgSend_appendFormat_(v7, v58, @",\n\t%@ = %d", v59, @"supports-remote-atv-signin", self->_supportsRemoteATVSignIn);
  objc_msgSend_appendFormat_(v7, v60, @",\n\t%@ = %d", v61, @"ec-version", self->_ecVersion);
  objc_msgSend_appendFormat_(v7, v62, @",\n\t%@ = %d", v63, @"is-c2k-equipment", self->_isC2KEquipment);
  objc_msgSend_appendFormat_(v7, v64, @",\n\t%@ = %d", v65, @"show-peer-errors", self->_showPeerErrors);
  objc_msgSend_appendFormat_(v7, v66, @",\n\t%@ = %d", v67, @"nicknames-version", self->_nicknamesVersion);
  objc_msgSend_appendFormat_(v7, v68, @",\n\t%@ = %d", v69, @"optionally-receive-typing-indicators", self->_optionallyReceiveTypingIndicator);
  objc_msgSend_appendFormat_(v7, v70, @",\n\t%@ = %d", v71, @"supports-inline-attachments", self->_supportsInlineAttachments);
  objc_msgSend_appendFormat_(v7, v72, @",\n\t%@ = %d", v73, @"supports-keep-receipts", self->_supportsKeepReceipts);
  objc_msgSend_appendFormat_(v7, v74, @",\n\t%@ = %d", v75, @"supports-st-v1", self->_supportsStickersV1);
  objc_msgSend_appendFormat_(v7, v76, @",\n\t%@ = %d", v77, @"supports-ca-v1", self->_supportsChatAppsV1);
  objc_msgSend_appendFormat_(v7, v78, @",\n\t%@ = %d", v79, @"supports-be-v1", self->_supportsBubbleEditingV1);
  objc_msgSend_appendFormat_(v7, v80, @",\n\t%@ = %d", v81, @"supports-ack-v1", self->_supportsAcknowledgementsV1);
  objc_msgSend_appendFormat_(v7, v82, @",\n\t%@ = %d", v83, @"supports-fsm-v1", self->_supportsFullScreenMomentsV1);
  objc_msgSend_appendFormat_(v7, v84, @",\n\t%@ = %d", v85, @"supports-fsm-v2", self->_supportsFullScreenMomentsV2);
  objc_msgSend_appendFormat_(v7, v86, @",\n\t%@ = %d", v87, @"supports-fsm-v3", self->_supportsFullScreenMomentsV3);
  objc_msgSend_appendFormat_(v7, v88, @",\n\t%@ = %d", v89, @"supports-ii-v1", self->_supportsInvisibleInkV1);
  objc_msgSend_appendFormat_(v7, v90, @",\n\t%@ = %d", v91, @"supports-impact-v1", self->_supportsImpactEffectsV1);
  objc_msgSend_appendFormat_(v7, v92, @",\n\t%@ = %d", v93, @"supports-update-attachments-v1", self->_supportsUpdateAttachmentsV1);
  objc_msgSend_appendFormat_(v7, v94, @",\n\t%@ = %d", v95, @"supports-autoloopvideo-v1", self->_supportsAutoloopVideoV1);
  objc_msgSend_appendFormat_(v7, v96, @",\n\t%@ = %d", v97, @"supports-media-v2", self->_supportsMediaV2);
  objc_msgSend_appendFormat_(v7, v98, @",\n\t%@ = %d", v99, @"supports-photos-extension-v1", self->_supportsPhotosExtensionV1);
  objc_msgSend_appendFormat_(v7, v100, @",\n\t%@ = %d", v101, @"supports-photos-extension-v2", self->_supportsPhotosExtensionV2);
  objc_msgSend_appendFormat_(v7, v102, @",\n\t%@ = %d", v103, @"supports-audio-messaging-v2", self->_supportsAudioMessagingV2);
  objc_msgSend_appendFormat_(v7, v104, @",\n\t%@ = %d", v105, @"supports-animoji-v2", self->_supportsAnimojiV2);
  objc_msgSend_appendFormat_(v7, v106, @",\n\t%@ = %d", v107, @"supports-certified-delivery-v1", self->_supportsCertifiedDeliveryV1);
  objc_msgSend_appendFormat_(v7, v108, @",\n\t%@ = %d", v109, @"supports-original-timestamp-v1", self->_supportsOriginalTimestampOrderingV1);
  objc_msgSend_appendFormat_(v7, v110, @",\n\t%@ = %d", v111, @"supports-protobuf-payload-data-v2", self->_supportsProtobufPayloadDataV2);
  objc_msgSend_appendFormat_(v7, v112, @",\n\t%@ = %d", v113, @"supports-heif", self->_supportsHEIFEncoding);
  objc_msgSend_appendFormat_(v7, v114, @",\n\t%@ = %d", v115, @"supports-hdr", self->_supportsHDRVideo);
  objc_msgSend_appendFormat_(v7, v116, @",\n\t%@ = %d", v117, @"prefers-sdr", self->_prefersSDRVideo);
  objc_msgSend_appendFormat_(v7, v118, @",\n\t%@ = %d", v119, @"supports-sa-v1", self->_supportsSyndicationActionsV1);
  objc_msgSend_appendFormat_(v7, v120, @",\n\t%@ = %d", v121, @"supports-uwb", self->_supportsUWB);
  objc_msgSend_appendFormat_(v7, v122, @",\n\t%@ = %d", v123, @"supports-dq-nr", self->_supportsDeliveredQuietlyAndNotifyRecipient);
  objc_msgSend_appendFormat_(v7, v124, @",\n\t%@ = %d", v125, @"supports-rem", self->_supportsRetractAndEditMessages);
  objc_msgSend_appendFormat_(v7, v126, @",\n\t%@ = %d", v127, @"supports-people-request-messages", self->_supportsPeopleRequestMessages);
  objc_msgSend_appendFormat_(v7, v128, @",\n\t%@ = %d", v129, @"supports-family-invite-message-bubble", self->_supportsFamilyInviteMessageBubble);
  objc_msgSend_appendFormat_(v7, v130, @",\n\t%@ = %d", v131, @"supports-people-request-messages-v2", self->_supportsPeopleRequestMessagesV2);
  objc_msgSend_appendFormat_(v7, v132, @",\n\t%@ = %d", v133, @"supports-askto", self->_supportsAskTo);
  objc_msgSend_appendFormat_(v7, v134, @",\n\t%@ = %d", v135, @"supports-emoji-stickers", self->_supportsEmojiStickers);
  objc_msgSend_appendFormat_(v7, v136, @",\n\t%@ = %d", v137, @"supports-sticker-editing", self->_supportsStickerEditing);
  objc_msgSend_appendFormat_(v7, v138, @",\n\t%@ = %d", v139, @"supports-hybrid-groups-v1", self->_supportsHybridGroupsV1);
  objc_msgSend_appendFormat_(v7, v140, @",\n\t%@ = %d", v141, @"supports-findmy-plugin-messages", self->_supportsFindMyPluginMessages);
  objc_msgSend_appendFormat_(v7, v142, @",\n\t%@ = %d", v143, @"supports-sos-alerting", self->_supportsSOSAlerting);
  objc_msgSend_appendFormat_(v7, v144, @",\n\t%@ = %d", v145, @"supports-people-request-messages-v3", self->_supportsPeopleRequestMessagesV3);
  objc_msgSend_appendFormat_(v7, v146, @",\n\t%@ = %d", v147, @"supports-recurring-payment-bubbles", self->_supportsRecurringPaymentBubbles);
  objc_msgSend_appendFormat_(v7, v148, @",\n\t%@ = %d", v149, @"supports-group-photo-refresh-version", self->_supportsGroupPhotoRefreshVersion);
  objc_msgSend_appendFormat_(v7, v150, @",\n\t%@ = %d", v151, @"supports-emoji-tapbacks", self->_supportsEmojiTapbacks);
  objc_msgSend_appendFormat_(v7, v152, @",\n\t%@ = %d", v153, @"supports-send-later-messages", self->_supportsSendLaterMessages);
  objc_msgSend_appendFormat_(v7, v154, @",\n\t%@ = %d", v155, @"supports-emoji-images", self->_supportsEmojiImages);
  objc_msgSend_appendFormat_(v7, v156, @",\n\t%@ = %d", v157, @"supports-stick-moji-backs", self->_supportsStickMojiBacks);
  objc_msgSend_appendFormat_(v7, v158, @",\n\t%@ = %d", v159, @"supports-high-quality-photo-file-sizes", self->_supportsHighQualityPhotoFileSizes);
  objc_msgSend_appendFormat_(v7, v160, @",\n\t%@ = %d", v161, @"supports-stewie", self->_supportsStewie);
  objc_msgSend_appendFormat_(v7, v162, @",\n\t%@ = %d", v163, @"sender-key-message-version", self->_senderKeyMessageVersion);
  objc_msgSend_appendFormat_(v7, v164, @",\n\t%@ = %d", v165, @"supports-sender-key-v1", self->_supportsSenderKey);
  objc_msgSend_appendFormat_(v7, v166, @",\n\t%@ = %d", v167, @"supports-recovery-contact-upsell", self->_supportsRecoveryContactUpsell);
  objc_msgSend_appendFormat_(v7, v168, @",\n\t%@ = %d", v169, @"supports-modern-gft", self->_supportsModernGFT);
  objc_msgSend_appendFormat_(v7, v170, @",\n\t%@ = %d", v171, @"supports-co", self->_supportsCo);
  objc_msgSend_appendFormat_(v7, v172, @",\n\t%@ = %d", v173, @"is-green-tea", self->_isGreenTea);
  objc_msgSend_appendFormat_(v7, v174, @",\n\t%@ = %d", v175, @"supports-gft-errors", self->_supportsGondola);
  objc_msgSend_appendFormat_(v7, v176, @",\n\t%@ = %d", v177, @"supports-gft-calls", self->_doesNotSupportGFTCalls);
  objc_msgSend_appendFormat_(v7, v178, @",\n\t%@ = %d", v179, @"is-web-client", self->_isWebClient);
  objc_msgSend_appendFormat_(v7, v180, @",\n\t%@ = %d", v181, @"supports-avless", self->_supportsAVLess);
  objc_msgSend_appendFormat_(v7, v182, @",\n\t%@ = %d", v183, @"supports-self-one-to-one-invites", self->_supportsSelfOneToOneInvites);
  objc_msgSend_appendFormat_(v7, v184, @",\n\t%@ = %d", v185, @"supports-hi-res-vid", self->_supportsHighResVideoMessaging);
  objc_msgSend_appendFormat_(v7, v186, @",\n\t%@ = %d", v187, @"supports-ssrc", self->_supportsSSRC);
  objc_msgSend_appendFormat_(v7, v188, @",\n\t%@ = %d", v189, @"gs-supports-friending-via-push", self->_supportsFriendingViaPush);
  objc_msgSend_appendFormat_(v7, v190, @",\n\t%@ = %d", v191, @"gs-supports-message-transport-v2", self->_supportsMessageTransportV2);
  objc_msgSend_appendString_(v7, v192, @">", v193);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char isEqualToEndpointCapabilites = objc_msgSend_isEqualToEndpointCapabilites_(self, v5, (uint64_t)v4, v6);
  }
  else {
    char isEqualToEndpointCapabilites = 0;
  }

  return isEqualToEndpointCapabilites;
}

- (BOOL)isEqualToEndpointCapabilites:(id)a3
{
  id v4 = (IDSEndpointCapabilities *)a3;
  BOOL v5 = self == v4
    || self->_supportsKeySharing == v4->_supportsKeySharing
    && self->_supportsHarmony == v4->_supportsHarmony
    && self->_supportsFMDV2 == v4->_supportsFMDV2
    && self->_supportsFMFenceV1 == v4->_supportsFMFenceV1
    && self->_supportsLocationSharing == v4->_supportsLocationSharing
    && self->_supportsScreenTimeV2 == v4->_supportsScreenTimeV2
    && self->_supportsIncomingFindMyV1 == v4->_supportsIncomingFindMyV1
    && self->_supportsSecureLocationsV1 == v4->_supportsSecureLocationsV1
    && self->_supportsActivitySharing == v4->_supportsActivitySharing
    && self->_supportsManateeForAppleCash == v4->_supportsManateeForAppleCash
    && self->_supportsRegionForAppleCash == v4->_supportsRegionForAppleCash
    && self->_supportsHomeKitResident == v4->_supportsHomeKitResident
    && self->_supportsMapsRoutingPathLeg == v4->_supportsMapsRoutingPathLeg
    && self->_supportsBeaconSharingV2 == v4->_supportsBeaconSharingV2
    && self->_supportsBeneficiaryInvites == v4->_supportsBeneficiaryInvites
    && self->_supportsScreenTimeErrors == v4->_supportsScreenTimeErrors
    && self->_supportsMapsWaypointRouteSharing == v4->_supportsMapsWaypointRouteSharing
    && self->_supportsMapsProtocolV5 == v4->_supportsMapsProtocolV5
    && self->_supportsCrossPlatformSharing == v4->_supportsCrossPlatformSharing
    && self->_supportsZelkova == v4->_supportsZelkova
    && self->_supportsPeopleRangingV1 == v4->_supportsPeopleRangingV1
    && self->_supportsBeaconSharingV3 == v4->_supportsBeaconSharingV3
    && self->_supportsGFTRelay == v4->_supportsGFTRelay
    && self->_supportsManateeActivitySharing == v4->_supportsManateeActivitySharing
    && self->_supportsRestrictedGuest == v4->_supportsRestrictedGuest
    && self->_supportsRemoteATVSignIn == v4->_supportsRemoteATVSignIn
    && self->_ecVersion == v4->_ecVersion
    && self->_isC2KEquipment == v4->_isC2KEquipment
    && self->_showPeerErrors == v4->_showPeerErrors
    && self->_nicknamesVersion == v4->_nicknamesVersion
    && self->_optionallyReceiveTypingIndicator == v4->_optionallyReceiveTypingIndicator
    && self->_supportsInlineAttachments == v4->_supportsInlineAttachments
    && self->_supportsKeepReceipts == v4->_supportsKeepReceipts
    && self->_supportsStickersV1 == v4->_supportsStickersV1
    && self->_supportsChatAppsV1 == v4->_supportsChatAppsV1
    && self->_supportsBubbleEditingV1 == v4->_supportsBubbleEditingV1
    && self->_supportsAcknowledgementsV1 == v4->_supportsAcknowledgementsV1
    && self->_supportsFullScreenMomentsV1 == v4->_supportsFullScreenMomentsV1
    && self->_supportsFullScreenMomentsV2 == v4->_supportsFullScreenMomentsV2
    && self->_supportsFullScreenMomentsV3 == v4->_supportsFullScreenMomentsV3
    && self->_supportsInvisibleInkV1 == v4->_supportsInvisibleInkV1
    && self->_supportsImpactEffectsV1 == v4->_supportsImpactEffectsV1
    && self->_supportsUpdateAttachmentsV1 == v4->_supportsUpdateAttachmentsV1
    && self->_supportsAutoloopVideoV1 == v4->_supportsAutoloopVideoV1
    && self->_supportsMediaV2 == v4->_supportsMediaV2
    && self->_supportsPhotosExtensionV1 == v4->_supportsPhotosExtensionV1
    && self->_supportsPhotosExtensionV2 == v4->_supportsPhotosExtensionV2
    && self->_supportsAudioMessagingV2 == v4->_supportsAudioMessagingV2
    && self->_supportsAnimojiV2 == v4->_supportsAnimojiV2
    && self->_supportsCertifiedDeliveryV1 == v4->_supportsCertifiedDeliveryV1
    && self->_supportsOriginalTimestampOrderingV1 == v4->_supportsOriginalTimestampOrderingV1
    && self->_supportsProtobufPayloadDataV2 == v4->_supportsProtobufPayloadDataV2
    && self->_supportsHEIFEncoding == v4->_supportsHEIFEncoding
    && self->_supportsHDRVideo == v4->_supportsHDRVideo
    && self->_prefersSDRVideo == v4->_prefersSDRVideo
    && self->_supportsSyndicationActionsV1 == v4->_supportsSyndicationActionsV1
    && self->_supportsUWB == v4->_supportsUWB
    && self->_supportsDeliveredQuietlyAndNotifyRecipient == v4->_supportsDeliveredQuietlyAndNotifyRecipient
    && self->_supportsRetractAndEditMessages == v4->_supportsRetractAndEditMessages
    && self->_supportsPeopleRequestMessages == v4->_supportsPeopleRequestMessages
    && self->_supportsFamilyInviteMessageBubble == v4->_supportsFamilyInviteMessageBubble
    && self->_supportsPeopleRequestMessagesV2 == v4->_supportsPeopleRequestMessagesV2
    && self->_supportsAskTo == v4->_supportsAskTo
    && self->_supportsEmojiStickers == v4->_supportsEmojiStickers
    && self->_supportsStickerEditing == v4->_supportsStickerEditing
    && self->_supportsHybridGroupsV1 == v4->_supportsHybridGroupsV1
    && self->_supportsFindMyPluginMessages == v4->_supportsFindMyPluginMessages
    && self->_supportsSOSAlerting == v4->_supportsSOSAlerting
    && self->_supportsPeopleRequestMessagesV3 == v4->_supportsPeopleRequestMessagesV3
    && self->_supportsRecurringPaymentBubbles == v4->_supportsRecurringPaymentBubbles
    && self->_supportsGroupPhotoRefreshVersion == v4->_supportsGroupPhotoRefreshVersion
    && self->_supportsEmojiTapbacks == v4->_supportsEmojiTapbacks
    && self->_supportsSendLaterMessages == v4->_supportsSendLaterMessages
    && self->_supportsEmojiImages == v4->_supportsEmojiImages
    && self->_supportsStickMojiBacks == v4->_supportsStickMojiBacks
    && self->_supportsHighQualityPhotoFileSizes == v4->_supportsHighQualityPhotoFileSizes
    && self->_supportsStewie == v4->_supportsStewie
    && self->_senderKeyMessageVersion == v4->_senderKeyMessageVersion
    && self->_supportsSenderKey == v4->_supportsSenderKey
    && self->_supportsRecoveryContactUpsell == v4->_supportsRecoveryContactUpsell
    && self->_supportsModernGFT == v4->_supportsModernGFT
    && self->_supportsCo == v4->_supportsCo
    && self->_isGreenTea == v4->_isGreenTea
    && self->_supportsGondola == v4->_supportsGondola
    && self->_doesNotSupportGFTCalls == v4->_doesNotSupportGFTCalls
    && self->_isWebClient == v4->_isWebClient
    && self->_supportsAVLess == v4->_supportsAVLess
    && self->_supportsSelfOneToOneInvites == v4->_supportsSelfOneToOneInvites
    && self->_supportsHighResVideoMessaging == v4->_supportsHighResVideoMessaging
    && self->_supportsSSRC == v4->_supportsSSRC
    && self->_supportsFriendingViaPush == v4->_supportsFriendingViaPush
    && self->_supportsMessageTransportV2 == v4->_supportsMessageTransportV2;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSEndpointCapabilities)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"kCapabilitiesMapKey");
  if (v9)
  {
    double v11 = (unsigned char *)objc_msgSend_initWithCapabilitiesMap_(self, v8, (uint64_t)v9, v10);
  }
  else
  {
    double v11 = (unsigned char *)objc_msgSend_initWithCapabilitiesMap_(self, v8, MEMORY[0x1E4F1CC08], v10);
    if (v11)
    {
      v11[8] = objc_msgSend_decodeIntForKey_(v4, v12, @"_supportsKeySharing", v13);
      v11[9] = objc_msgSend_decodeIntForKey_(v4, v14, @"_supportsHarmony", v15);
      v11[10] = objc_msgSend_decodeIntForKey_(v4, v16, @"_supportsFMDV2", v17);
      v11[11] = objc_msgSend_decodeIntForKey_(v4, v18, @"_supportsFMFenceV1", v19);
      v11[12] = objc_msgSend_decodeIntForKey_(v4, v20, @"_supportsLocationSharing", v21);
      v11[13] = objc_msgSend_decodeIntForKey_(v4, v22, @"_supportsScreenTimeV2", v23);
      v11[14] = objc_msgSend_decodeIntForKey_(v4, v24, @"_supportsIncomingFindMyV1", v25);
      v11[15] = objc_msgSend_decodeIntForKey_(v4, v26, @"_supportsSecureLocationsV1", v27);
      v11[16] = objc_msgSend_decodeIntForKey_(v4, v28, @"_supportsActivitySharing", v29);
      v11[17] = objc_msgSend_decodeIntForKey_(v4, v30, @"_supportsManateeForAppleCash", v31);
      v11[18] = objc_msgSend_decodeIntForKey_(v4, v32, @"_supportsRegionForAppleCash", v33);
      v11[19] = objc_msgSend_decodeIntForKey_(v4, v34, @"_supportsHomeKitResident", v35);
      v11[20] = objc_msgSend_decodeIntForKey_(v4, v36, @"_supportsMapsRoutingPathLeg", v37);
      v11[21] = objc_msgSend_decodeIntForKey_(v4, v38, @"_supportsBeaconSharingV2", v39);
      v11[22] = objc_msgSend_decodeIntForKey_(v4, v40, @"_supportsBeneficiaryInvites", v41);
      v11[23] = objc_msgSend_decodeIntForKey_(v4, v42, @"_supportsScreenTimeErrors", v43);
      v11[24] = objc_msgSend_decodeIntForKey_(v4, v44, @"_supportsMapsWaypointRouteSharing", v45);
      v11[25] = objc_msgSend_decodeIntForKey_(v4, v46, @"_supportsMapsProtocolV5", v47);
      v11[26] = objc_msgSend_decodeIntForKey_(v4, v48, @"_supportsCrossPlatformSharing", v49);
      v11[27] = objc_msgSend_decodeIntForKey_(v4, v50, @"_supportsZelkova", v51);
      v11[28] = objc_msgSend_decodeIntForKey_(v4, v52, @"_supportsPeopleRangingV1", v53);
      v11[29] = objc_msgSend_decodeIntForKey_(v4, v54, @"_supportsBeaconSharingV3", v55);
      v11[30] = objc_msgSend_decodeIntForKey_(v4, v56, @"_supportsGFTRelay", v57);
      v11[31] = objc_msgSend_decodeIntForKey_(v4, v58, @"_supportsManateeActivitySharing", v59);
      v11[32] = objc_msgSend_decodeIntForKey_(v4, v60, @"_supportsRestrictedGuest", v61);
      v11[33] = objc_msgSend_decodeIntForKey_(v4, v62, @"_supportsRemoteATVSignIn", v63);
      v11[34] = objc_msgSend_decodeIntForKey_(v4, v64, @"_ecVersion", v65);
      v11[35] = objc_msgSend_decodeIntForKey_(v4, v66, @"_isC2KEquipment", v67);
      v11[36] = objc_msgSend_decodeIntForKey_(v4, v68, @"_showPeerErrors", v69);
      v11[37] = objc_msgSend_decodeIntForKey_(v4, v70, @"_nicknamesVersion", v71);
      v11[38] = objc_msgSend_decodeIntForKey_(v4, v72, @"_optionallyReceiveTypingIndicator", v73);
      v11[39] = objc_msgSend_decodeIntForKey_(v4, v74, @"_supportsInlineAttachments", v75);
      v11[40] = objc_msgSend_decodeIntForKey_(v4, v76, @"_supportsKeepReceipts", v77);
      v11[41] = objc_msgSend_decodeIntForKey_(v4, v78, @"_supportsStickersV1", v79);
      v11[42] = objc_msgSend_decodeIntForKey_(v4, v80, @"_supportsChatAppsV1", v81);
      v11[43] = objc_msgSend_decodeIntForKey_(v4, v82, @"_supportsBubbleEditingV1", v83);
      v11[44] = objc_msgSend_decodeIntForKey_(v4, v84, @"_supportsAcknowledgementsV1", v85);
      v11[45] = objc_msgSend_decodeIntForKey_(v4, v86, @"_supportsFullScreenMomentsV1", v87);
      v11[46] = objc_msgSend_decodeIntForKey_(v4, v88, @"_supportsFullScreenMomentsV2", v89);
      v11[47] = objc_msgSend_decodeIntForKey_(v4, v90, @"_supportsFullScreenMomentsV3", v91);
      v11[48] = objc_msgSend_decodeIntForKey_(v4, v92, @"_supportsInvisibleInkV1", v93);
      v11[49] = objc_msgSend_decodeIntForKey_(v4, v94, @"_supportsImpactEffectsV1", v95);
      v11[50] = objc_msgSend_decodeIntForKey_(v4, v96, @"_supportsUpdateAttachmentsV1", v97);
      v11[51] = objc_msgSend_decodeIntForKey_(v4, v98, @"_supportsAutoloopVideoV1", v99);
      v11[52] = objc_msgSend_decodeIntForKey_(v4, v100, @"_supportsMediaV2", v101);
      v11[53] = objc_msgSend_decodeIntForKey_(v4, v102, @"_supportsPhotosExtensionV1", v103);
      v11[54] = objc_msgSend_decodeIntForKey_(v4, v104, @"_supportsPhotosExtensionV2", v105);
      v11[55] = objc_msgSend_decodeIntForKey_(v4, v106, @"_supportsAudioMessagingV2", v107);
      v11[56] = objc_msgSend_decodeIntForKey_(v4, v108, @"_supportsAnimojiV2", v109);
      v11[57] = objc_msgSend_decodeIntForKey_(v4, v110, @"_supportsCertifiedDeliveryV1", v111);
      v11[58] = objc_msgSend_decodeIntForKey_(v4, v112, @"_supportsOriginalTimestampOrderingV1", v113);
      v11[59] = objc_msgSend_decodeIntForKey_(v4, v114, @"_supportsProtobufPayloadDataV2", v115);
      v11[60] = objc_msgSend_decodeIntForKey_(v4, v116, @"_supportsHEIFEncoding", v117);
      v11[61] = objc_msgSend_decodeIntForKey_(v4, v118, @"_supportsHDRVideo", v119);
      v11[62] = objc_msgSend_decodeIntForKey_(v4, v120, @"_prefersSDRVideo", v121);
      v11[63] = objc_msgSend_decodeIntForKey_(v4, v122, @"_supportsSyndicationActionsV1", v123);
      v11[64] = objc_msgSend_decodeIntForKey_(v4, v124, @"_supportsUWB", v125);
      v11[65] = objc_msgSend_decodeIntForKey_(v4, v126, @"_supportsDeliveredQuietlyAndNotifyRecipient", v127);
      v11[66] = objc_msgSend_decodeIntForKey_(v4, v128, @"_supportsRetractAndEditMessages", v129);
      v11[67] = objc_msgSend_decodeIntForKey_(v4, v130, @"_supportsPeopleRequestMessages", v131);
      v11[68] = objc_msgSend_decodeIntForKey_(v4, v132, @"_supportsFamilyInviteMessageBubble", v133);
      v11[69] = objc_msgSend_decodeIntForKey_(v4, v134, @"_supportsPeopleRequestMessagesV2", v135);
      v11[70] = objc_msgSend_decodeIntForKey_(v4, v136, @"_supportsAskTo", v137);
      v11[71] = objc_msgSend_decodeIntForKey_(v4, v138, @"_supportsEmojiStickers", v139);
      v11[72] = objc_msgSend_decodeIntForKey_(v4, v140, @"_supportsStickerEditing", v141);
      v11[73] = objc_msgSend_decodeIntForKey_(v4, v142, @"_supportsHybridGroupsV1", v143);
      v11[74] = objc_msgSend_decodeIntForKey_(v4, v144, @"_supportsFindMyPluginMessages", v145);
      v11[75] = objc_msgSend_decodeIntForKey_(v4, v146, @"_supportsSOSAlerting", v147);
      v11[76] = objc_msgSend_decodeIntForKey_(v4, v148, @"_supportsPeopleRequestMessagesV3", v149);
      v11[77] = objc_msgSend_decodeIntForKey_(v4, v150, @"_supportsRecurringPaymentBubbles", v151);
      v11[78] = objc_msgSend_decodeIntForKey_(v4, v152, @"_supportsGroupPhotoRefreshVersion", v153);
      v11[79] = objc_msgSend_decodeIntForKey_(v4, v154, @"_supportsEmojiTapbacks", v155);
      v11[80] = objc_msgSend_decodeIntForKey_(v4, v156, @"_supportsSendLaterMessages", v157);
      v11[81] = objc_msgSend_decodeIntForKey_(v4, v158, @"_supportsEmojiImages", v159);
      v11[82] = objc_msgSend_decodeIntForKey_(v4, v160, @"_supportsStickMojiBacks", v161);
      v11[83] = objc_msgSend_decodeIntForKey_(v4, v162, @"_supportsHighQualityPhotoFileSizes", v163);
      v11[84] = objc_msgSend_decodeIntForKey_(v4, v164, @"_supportsStewie", v165);
      v11[85] = objc_msgSend_decodeIntForKey_(v4, v166, @"_senderKeyMessageVersion", v167);
      v11[86] = objc_msgSend_decodeIntForKey_(v4, v168, @"_supportsSenderKey", v169);
      v11[87] = objc_msgSend_decodeIntForKey_(v4, v170, @"_supportsRecoveryContactUpsell", v171);
      v11[88] = objc_msgSend_decodeIntForKey_(v4, v172, @"_supportsModernGFT", v173);
      v11[89] = objc_msgSend_decodeIntForKey_(v4, v174, @"_supportsCo", v175);
      v11[90] = objc_msgSend_decodeIntForKey_(v4, v176, @"_isGreenTea", v177);
      v11[91] = objc_msgSend_decodeIntForKey_(v4, v178, @"_supportsGondola", v179);
      v11[92] = objc_msgSend_decodeIntForKey_(v4, v180, @"_doesNotSupportGFTCalls", v181);
      v11[93] = objc_msgSend_decodeIntForKey_(v4, v182, @"_isWebClient", v183);
      v11[94] = objc_msgSend_decodeIntForKey_(v4, v184, @"_supportsAVLess", v185);
      v11[95] = objc_msgSend_decodeIntForKey_(v4, v186, @"_supportsSelfOneToOneInvites", v187);
      v11[96] = objc_msgSend_decodeIntForKey_(v4, v188, @"_supportsHighResVideoMessaging", v189);
      v11[97] = objc_msgSend_decodeIntForKey_(v4, v190, @"_supportsSSRC", v191);
      v11[98] = objc_msgSend_decodeIntForKey_(v4, v192, @"_supportsFriendingViaPush", v193);
      v11[99] = objc_msgSend_decodeIntForKey_(v4, v194, @"_supportsMessageTransportV2", v195);
    }
  }
  v196 = v11;

  return v196;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t supportsKeySharing = self->_supportsKeySharing;
  id v189 = a3;
  objc_msgSend_encodeInt_forKey_(v189, v5, supportsKeySharing, v6, @"_supportsKeySharing");
  objc_msgSend_encodeInt_forKey_(v189, v7, self->_supportsHarmony, v8, @"_supportsHarmony");
  objc_msgSend_encodeInt_forKey_(v189, v9, self->_supportsFMDV2, v10, @"_supportsFMDV2");
  objc_msgSend_encodeInt_forKey_(v189, v11, self->_supportsFMFenceV1, v12, @"_supportsFMFenceV1");
  objc_msgSend_encodeInt_forKey_(v189, v13, self->_supportsLocationSharing, v14, @"_supportsLocationSharing");
  objc_msgSend_encodeInt_forKey_(v189, v15, self->_supportsScreenTimeV2, v16, @"_supportsScreenTimeV2");
  objc_msgSend_encodeInt_forKey_(v189, v17, self->_supportsIncomingFindMyV1, v18, @"_supportsIncomingFindMyV1");
  objc_msgSend_encodeInt_forKey_(v189, v19, self->_supportsSecureLocationsV1, v20, @"_supportsSecureLocationsV1");
  objc_msgSend_encodeInt_forKey_(v189, v21, self->_supportsActivitySharing, v22, @"_supportsActivitySharing");
  objc_msgSend_encodeInt_forKey_(v189, v23, self->_supportsManateeForAppleCash, v24, @"_supportsManateeForAppleCash");
  objc_msgSend_encodeInt_forKey_(v189, v25, self->_supportsRegionForAppleCash, v26, @"_supportsRegionForAppleCash");
  objc_msgSend_encodeInt_forKey_(v189, v27, self->_supportsHomeKitResident, v28, @"_supportsHomeKitResident");
  objc_msgSend_encodeInt_forKey_(v189, v29, self->_supportsMapsRoutingPathLeg, v30, @"_supportsMapsRoutingPathLeg");
  objc_msgSend_encodeInt_forKey_(v189, v31, self->_supportsBeaconSharingV2, v32, @"_supportsBeaconSharingV2");
  objc_msgSend_encodeInt_forKey_(v189, v33, self->_supportsBeneficiaryInvites, v34, @"_supportsBeneficiaryInvites");
  objc_msgSend_encodeInt_forKey_(v189, v35, self->_supportsScreenTimeErrors, v36, @"_supportsScreenTimeErrors");
  objc_msgSend_encodeInt_forKey_(v189, v37, self->_supportsMapsWaypointRouteSharing, v38, @"_supportsMapsWaypointRouteSharing");
  objc_msgSend_encodeInt_forKey_(v189, v39, self->_supportsMapsProtocolV5, v40, @"_supportsMapsProtocolV5");
  objc_msgSend_encodeInt_forKey_(v189, v41, self->_supportsCrossPlatformSharing, v42, @"_supportsCrossPlatformSharing");
  objc_msgSend_encodeInt_forKey_(v189, v43, self->_supportsZelkova, v44, @"_supportsZelkova");
  objc_msgSend_encodeInt_forKey_(v189, v45, self->_supportsPeopleRangingV1, v46, @"_supportsPeopleRangingV1");
  objc_msgSend_encodeInt_forKey_(v189, v47, self->_supportsBeaconSharingV3, v48, @"_supportsBeaconSharingV3");
  objc_msgSend_encodeInt_forKey_(v189, v49, self->_supportsGFTRelay, v50, @"_supportsGFTRelay");
  objc_msgSend_encodeInt_forKey_(v189, v51, self->_supportsManateeActivitySharing, v52, @"_supportsManateeActivitySharing");
  objc_msgSend_encodeInt_forKey_(v189, v53, self->_supportsRestrictedGuest, v54, @"_supportsRestrictedGuest");
  objc_msgSend_encodeInt_forKey_(v189, v55, self->_supportsRemoteATVSignIn, v56, @"_supportsRemoteATVSignIn");
  objc_msgSend_encodeInt_forKey_(v189, v57, self->_ecVersion, v58, @"_ecVersion");
  objc_msgSend_encodeInt_forKey_(v189, v59, self->_isC2KEquipment, v60, @"_isC2KEquipment");
  objc_msgSend_encodeInt_forKey_(v189, v61, self->_showPeerErrors, v62, @"_showPeerErrors");
  objc_msgSend_encodeInt_forKey_(v189, v63, self->_nicknamesVersion, v64, @"_nicknamesVersion");
  objc_msgSend_encodeInt_forKey_(v189, v65, self->_optionallyReceiveTypingIndicator, v66, @"_optionallyReceiveTypingIndicator");
  objc_msgSend_encodeInt_forKey_(v189, v67, self->_supportsInlineAttachments, v68, @"_supportsInlineAttachments");
  objc_msgSend_encodeInt_forKey_(v189, v69, self->_supportsKeepReceipts, v70, @"_supportsKeepReceipts");
  objc_msgSend_encodeInt_forKey_(v189, v71, self->_supportsStickersV1, v72, @"_supportsStickersV1");
  objc_msgSend_encodeInt_forKey_(v189, v73, self->_supportsChatAppsV1, v74, @"_supportsChatAppsV1");
  objc_msgSend_encodeInt_forKey_(v189, v75, self->_supportsBubbleEditingV1, v76, @"_supportsBubbleEditingV1");
  objc_msgSend_encodeInt_forKey_(v189, v77, self->_supportsAcknowledgementsV1, v78, @"_supportsAcknowledgementsV1");
  objc_msgSend_encodeInt_forKey_(v189, v79, self->_supportsFullScreenMomentsV1, v80, @"_supportsFullScreenMomentsV1");
  objc_msgSend_encodeInt_forKey_(v189, v81, self->_supportsFullScreenMomentsV2, v82, @"_supportsFullScreenMomentsV2");
  objc_msgSend_encodeInt_forKey_(v189, v83, self->_supportsFullScreenMomentsV3, v84, @"_supportsFullScreenMomentsV3");
  objc_msgSend_encodeInt_forKey_(v189, v85, self->_supportsInvisibleInkV1, v86, @"_supportsInvisibleInkV1");
  objc_msgSend_encodeInt_forKey_(v189, v87, self->_supportsImpactEffectsV1, v88, @"_supportsImpactEffectsV1");
  objc_msgSend_encodeInt_forKey_(v189, v89, self->_supportsUpdateAttachmentsV1, v90, @"_supportsUpdateAttachmentsV1");
  objc_msgSend_encodeInt_forKey_(v189, v91, self->_supportsAutoloopVideoV1, v92, @"_supportsAutoloopVideoV1");
  objc_msgSend_encodeInt_forKey_(v189, v93, self->_supportsMediaV2, v94, @"_supportsMediaV2");
  objc_msgSend_encodeInt_forKey_(v189, v95, self->_supportsPhotosExtensionV1, v96, @"_supportsPhotosExtensionV1");
  objc_msgSend_encodeInt_forKey_(v189, v97, self->_supportsPhotosExtensionV2, v98, @"_supportsPhotosExtensionV2");
  objc_msgSend_encodeInt_forKey_(v189, v99, self->_supportsAudioMessagingV2, v100, @"_supportsAudioMessagingV2");
  objc_msgSend_encodeInt_forKey_(v189, v101, self->_supportsAnimojiV2, v102, @"_supportsAnimojiV2");
  objc_msgSend_encodeInt_forKey_(v189, v103, self->_supportsCertifiedDeliveryV1, v104, @"_supportsCertifiedDeliveryV1");
  objc_msgSend_encodeInt_forKey_(v189, v105, self->_supportsOriginalTimestampOrderingV1, v106, @"_supportsOriginalTimestampOrderingV1");
  objc_msgSend_encodeInt_forKey_(v189, v107, self->_supportsProtobufPayloadDataV2, v108, @"_supportsProtobufPayloadDataV2");
  objc_msgSend_encodeInt_forKey_(v189, v109, self->_supportsHEIFEncoding, v110, @"_supportsHEIFEncoding");
  objc_msgSend_encodeInt_forKey_(v189, v111, self->_supportsHDRVideo, v112, @"_supportsHDRVideo");
  objc_msgSend_encodeInt_forKey_(v189, v113, self->_prefersSDRVideo, v114, @"_prefersSDRVideo");
  objc_msgSend_encodeInt_forKey_(v189, v115, self->_supportsSyndicationActionsV1, v116, @"_supportsSyndicationActionsV1");
  objc_msgSend_encodeInt_forKey_(v189, v117, self->_supportsUWB, v118, @"_supportsUWB");
  objc_msgSend_encodeInt_forKey_(v189, v119, self->_supportsDeliveredQuietlyAndNotifyRecipient, v120, @"_supportsDeliveredQuietlyAndNotifyRecipient");
  objc_msgSend_encodeInt_forKey_(v189, v121, self->_supportsRetractAndEditMessages, v122, @"_supportsRetractAndEditMessages");
  objc_msgSend_encodeInt_forKey_(v189, v123, self->_supportsPeopleRequestMessages, v124, @"_supportsPeopleRequestMessages");
  objc_msgSend_encodeInt_forKey_(v189, v125, self->_supportsFamilyInviteMessageBubble, v126, @"_supportsFamilyInviteMessageBubble");
  objc_msgSend_encodeInt_forKey_(v189, v127, self->_supportsPeopleRequestMessagesV2, v128, @"_supportsPeopleRequestMessagesV2");
  objc_msgSend_encodeInt_forKey_(v189, v129, self->_supportsAskTo, v130, @"_supportsAskTo");
  objc_msgSend_encodeInt_forKey_(v189, v131, self->_supportsEmojiStickers, v132, @"_supportsEmojiStickers");
  objc_msgSend_encodeInt_forKey_(v189, v133, self->_supportsStickerEditing, v134, @"_supportsStickerEditing");
  objc_msgSend_encodeInt_forKey_(v189, v135, self->_supportsHybridGroupsV1, v136, @"_supportsHybridGroupsV1");
  objc_msgSend_encodeInt_forKey_(v189, v137, self->_supportsFindMyPluginMessages, v138, @"_supportsFindMyPluginMessages");
  objc_msgSend_encodeInt_forKey_(v189, v139, self->_supportsSOSAlerting, v140, @"_supportsSOSAlerting");
  objc_msgSend_encodeInt_forKey_(v189, v141, self->_supportsPeopleRequestMessagesV3, v142, @"_supportsPeopleRequestMessagesV3");
  objc_msgSend_encodeInt_forKey_(v189, v143, self->_supportsRecurringPaymentBubbles, v144, @"_supportsRecurringPaymentBubbles");
  objc_msgSend_encodeInt_forKey_(v189, v145, self->_supportsGroupPhotoRefreshVersion, v146, @"_supportsGroupPhotoRefreshVersion");
  objc_msgSend_encodeInt_forKey_(v189, v147, self->_supportsEmojiTapbacks, v148, @"_supportsEmojiTapbacks");
  objc_msgSend_encodeInt_forKey_(v189, v149, self->_supportsSendLaterMessages, v150, @"_supportsSendLaterMessages");
  objc_msgSend_encodeInt_forKey_(v189, v151, self->_supportsEmojiImages, v152, @"_supportsEmojiImages");
  objc_msgSend_encodeInt_forKey_(v189, v153, self->_supportsStickMojiBacks, v154, @"_supportsStickMojiBacks");
  objc_msgSend_encodeInt_forKey_(v189, v155, self->_supportsHighQualityPhotoFileSizes, v156, @"_supportsHighQualityPhotoFileSizes");
  objc_msgSend_encodeInt_forKey_(v189, v157, self->_supportsStewie, v158, @"_supportsStewie");
  objc_msgSend_encodeInt_forKey_(v189, v159, self->_senderKeyMessageVersion, v160, @"_senderKeyMessageVersion");
  objc_msgSend_encodeInt_forKey_(v189, v161, self->_supportsSenderKey, v162, @"_supportsSenderKey");
  objc_msgSend_encodeInt_forKey_(v189, v163, self->_supportsRecoveryContactUpsell, v164, @"_supportsRecoveryContactUpsell");
  objc_msgSend_encodeInt_forKey_(v189, v165, self->_supportsModernGFT, v166, @"_supportsModernGFT");
  objc_msgSend_encodeInt_forKey_(v189, v167, self->_supportsCo, v168, @"_supportsCo");
  objc_msgSend_encodeInt_forKey_(v189, v169, self->_isGreenTea, v170, @"_isGreenTea");
  objc_msgSend_encodeInt_forKey_(v189, v171, self->_supportsGondola, v172, @"_supportsGondola");
  objc_msgSend_encodeInt_forKey_(v189, v173, self->_doesNotSupportGFTCalls, v174, @"_doesNotSupportGFTCalls");
  objc_msgSend_encodeInt_forKey_(v189, v175, self->_isWebClient, v176, @"_isWebClient");
  objc_msgSend_encodeInt_forKey_(v189, v177, self->_supportsAVLess, v178, @"_supportsAVLess");
  objc_msgSend_encodeInt_forKey_(v189, v179, self->_supportsSelfOneToOneInvites, v180, @"_supportsSelfOneToOneInvites");
  objc_msgSend_encodeInt_forKey_(v189, v181, self->_supportsHighResVideoMessaging, v182, @"_supportsHighResVideoMessaging");
  objc_msgSend_encodeInt_forKey_(v189, v183, self->_supportsSSRC, v184, @"_supportsSSRC");
  objc_msgSend_encodeInt_forKey_(v189, v185, self->_supportsFriendingViaPush, v186, @"_supportsFriendingViaPush");
  objc_msgSend_encodeInt_forKey_(v189, v187, self->_supportsMessageTransportV2, v188, @"_supportsMessageTransportV2");
}

@end