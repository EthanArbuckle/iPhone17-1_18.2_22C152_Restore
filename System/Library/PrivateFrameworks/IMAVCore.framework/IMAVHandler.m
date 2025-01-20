@interface IMAVHandler
+ (void)ensureHandlerSetup;
+ (void)initialize;
- (void)_enqueueIMAVChatForNetworkActivation:(id)a3;
- (void)_handleIncomingAVChatForNotification:(id)a3;
- (void)_handleIncomingWithAccount:(id)a3 fromHandle:(id)a4 conference:(id)a5 properites:(id)a6;
- (void)_notifyOfIncomingInvitationFor:(id)a3 notifyInvitationListeners:(BOOL)a4;
- (void)account:(id)a3 avAction:(unsigned int)a4 withArguments:(id)a5 toAVChat:(id)a6 isVideo:(BOOL)a7;
- (void)account:(id)a3 conference:(id)a4 changedToNewConferenceID:(id)a5;
- (void)account:(id)a3 conference:(id)a4 invitationSentSuccessfully:(BOOL)a5;
- (void)account:(id)a3 conference:(id)a4 peerID:(id)a5 propertiesUpdated:(id)a6;
- (void)account:(id)a3 conference:(id)a4 peerIDChangedFromID:(id)a5 toID:(id)a6;
- (void)account:(id)a3 conference:(id)a4 receivedAVMessage:(unsigned int)a5 from:(id)a6 sessionID:(unsigned int)a7 userInfo:(id)a8;
- (void)account:(id)a3 conference:(id)a4 receivedCancelInvitationFrom:(id)a5 properties:(id)a6;
- (void)account:(id)a3 conference:(id)a4 receivedInvitationFrom:(id)a5 properties:(id)a6;
- (void)account:(id)a3 conference:(id)a4 receivedResponseToInvitationFrom:(id)a5 properties:(id)a6;
- (void)account:(id)a3 postedError:(id)a4;
- (void)account:(id)a3 relay:(id)a4 handleCancel:(id)a5 fromPerson:(id)a6;
- (void)account:(id)a3 relay:(id)a4 handleInitate:(id)a5 fromPerson:(id)a6;
- (void)account:(id)a3 relay:(id)a4 handleUpdate:(id)a5 fromPerson:(id)a6;
- (void)pendingACRequestComplete;
- (void)pendingVCRequestComplete;
- (void)persistentProperty:(id)a3 changedTo:(id)a4 from:(id)a5;
- (void)property:(id)a3 changedTo:(id)a4 from:(id)a5;
- (void)setupComplete;
- (void)vcCapabilitiesChanged:(unint64_t)a3;
@end

@implementation IMAVHandler

- (void)vcCapabilitiesChanged:(unint64_t)a3
{
  objc_msgSend_sharedInstance(IMAVController, a2, a3, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vcCapabilitiesChanged_(v9, v6, a3, v7, v8);
}

+ (void)initialize
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v4, v5, v6, v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v9, v8, (uint64_t)a1, (uint64_t)sel_ensureHandlerSetup, *MEMORY[0x263F3BB08], 0);
  }
}

+ (void)ensureHandlerSetup
{
  uint64_t v5 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], a2, v2, v3, v4);
  char v10 = objc_msgSend_faceTimeSupported(v5, v6, v7, v8, v9);

  if (v10)
  {
    if (qword_26AB79670 != -1)
    {
      dispatch_once(&qword_26AB79670, &unk_26D85A510);
    }
  }
  else
  {
    v11 = sub_224FB12A0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_224F93000, v11, OS_LOG_TYPE_DEFAULT, "VC is not supported on this device, not setting up the AV Handler", v12, 2u);
    }
  }
}

- (void)_handleIncomingWithAccount:(id)a3 fromHandle:(id)a4 conference:(id)a5 properites:(id)a6
{
  uint64_t v522 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v497 = v10;
  uint64_t v18 = objc_msgSend__avChatWaitingForReplyFromIMHandle_orConferenceID_(IMAVChat, v13, (uint64_t)v10, (uint64_t)v11, v14);
  if (v11)
  {
    v19 = v11;
    v493 = objc_msgSend__avChatWithConferenceID_(IMAVChat, v15, (uint64_t)v11, v16, v17);
  }
  else
  {
    v19 = 0;
    v493 = 0;
  }
  v494 = objc_msgSend__avChatConnectingFromIMHandle_(IMAVChat, v15, (uint64_t)v497, v16, v17);
  v24 = objc_msgSend_sharedInstance(IMAVController, v20, v21, v22, v23);
  int v29 = objc_msgSend_blockMultipleIncomingInvitations(v24, v25, v26, v27, v28);

  v34 = objc_msgSend_sharedInstance(IMAVController, v30, v31, v32, v33);
  int v39 = objc_msgSend_blockIncomingInvitationsDuringCall(v34, v35, v36, v37, v38);

  v43 = objc_msgSend_objectForKey_(v12, v40, *MEMORY[0x263F4A6A0], v41, v42);
  int v496 = objc_msgSend_BOOLValue(v43, v44, v45, v46, v47);

  v48 = sub_224FB12A0();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    if (v29) {
      v49 = @"NO";
    }
    else {
      v49 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v519 = v49;
    _os_log_impl(&dword_224F93000, v48, OS_LOG_TYPE_DEFAULT, "Allowing multiple invitations: %@", buf, 0xCu);
  }
  v495 = (void *)v18;

  v50 = sub_224FB12A0();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    if (v39) {
      v51 = @"NO";
    }
    else {
      v51 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v519 = v51;
    _os_log_impl(&dword_224F93000, v50, OS_LOG_TYPE_DEFAULT, "Allowing incoming invitations during call: %@", buf, 0xCu);
  }

  v52 = sub_224FB12A0();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    v57 = objc_msgSend_sharedInstance(IMAVController, v53, v54, v55, v56);
    if (objc_msgSend_hasRunningConference(v57, v58, v59, v60, v61)) {
      v62 = @"YES";
    }
    else {
      v62 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v519 = v62;
    _os_log_impl(&dword_224F93000, v52, OS_LOG_TYPE_DEFAULT, "Has running conference %@", buf, 0xCu);
  }
  v492 = objc_msgSend_objectForKey_(v12, v63, *MEMORY[0x263F4A6B0], v64, v65);
  if (objc_msgSend_BOOLValue(v492, v66, v67, v68, v69))
  {
    uint64_t v490 = (uint64_t)v12;
    isVideo_callerProperties = sub_224FB12A0();
    BOOL v75 = os_log_type_enabled(isVideo_callerProperties, OS_LOG_TYPE_DEFAULT);
    v76 = v495;
    v77 = v493;
    if (!v493)
    {
      if (v75)
      {
        *(_DWORD *)buf = 138412290;
        v519 = v19;
        _os_log_impl(&dword_224F93000, isVideo_callerProperties, OS_LOG_TYPE_DEFAULT, "This is is a re-initiate and we do not have a chat running for CID (%@)", buf, 0xCu);
      }
      goto LABEL_157;
    }
    if (v75)
    {
      *(_DWORD *)buf = 138412546;
      v519 = v493;
      __int16 v520 = 2112;
      uint64_t v521 = (uint64_t)v19;
      _os_log_impl(&dword_224F93000, isVideo_callerProperties, OS_LOG_TYPE_DEFAULT, "We already have a chat running for %@  (%@)", buf, 0x16u);
    }

    isVideo_callerProperties = objc_msgSend_participantMatchingIMHandle_(v493, v78, (uint64_t)v497, v79, v80);
    v81 = sub_224FB12A0();
    BOOL v82 = os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT);
    if (isVideo_callerProperties)
    {
      if (v82)
      {
        *(_DWORD *)buf = 138412290;
        v519 = isVideo_callerProperties;
        _os_log_impl(&dword_224F93000, v81, OS_LOG_TYPE_DEFAULT, "Re-initiate for: %@", buf, 0xCu);
      }

      if (objc_msgSend_hasConnectingSessions(isVideo_callerProperties, v83, v84, v85, v86)
        && (objc_msgSend_localParticipant(v493, v87, v88, v89, v90),
            v91 = objc_claimAutoreleasedReturnValue(),
            int isInitiator = objc_msgSend_isInitiator(v91, v92, v93, v94, v95),
            v91,
            isInitiator))
      {
        v81 = sub_224FB12A0();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v97 = "We already started a re-invite and we are the initiator dropping invite on the floor";
LABEL_59:
          _os_log_impl(&dword_224F93000, v81, OS_LOG_TYPE_DEFAULT, v97, buf, 2u);
        }
      }
      else
      {
        v81 = objc_msgSend__processIncomingCallProperties_(isVideo_callerProperties, v87, v490, v89, v90);
        objc_msgSend_setIsReinitiate_(v81, v188, 1, v189, v190);
        objc_msgSend__sendResponse_callInfo_(isVideo_callerProperties, v191, 0, (uint64_t)v81, v192);
      }
    }
    else if (v82)
    {
      *(_WORD *)buf = 0;
      v97 = "[WARN] No participant found to re-initiate";
      goto LABEL_59;
    }

LABEL_157:
    id v12 = (id)v490;
    goto LABEL_158;
  }
  v76 = v495;
  if (!v495)
  {
    if (v494) {
      int v126 = v39;
    }
    else {
      int v126 = 1;
    }
    if (v126)
    {
      if (!v39) {
        goto LABEL_107;
      }
      v127 = objc_msgSend_sharedInstance(IMAVCallManager, v70, v71, v72, v73);
      int v132 = objc_msgSend_callState(v127, v128, v129, v130, v131);

      if (v132 == 3)
      {
        uint64_t v490 = (uint64_t)v12;
        v137 = sub_224FB12A0();
        if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v19;
          _os_log_impl(&dword_224F93000, v137, OS_LOG_TYPE_DEFAULT, "We have a call we're making, declining conference ID: %@", buf, 0xCu);
        }

        isVideo_callerProperties = objc_msgSend_sharedInstance(IMAVController, v138, v139, v140, v141);
        objc_msgSend_declineVCRequestWithBuddy_response_vcProps_forAccount_conferenceID_(isVideo_callerProperties, v142, (uint64_t)v497, 2, v490, 0, v19);
        goto LABEL_134;
      }
      v222 = objc_msgSend_sharedInstance(IMAVCallManager, v133, v134, v135, v136);
      int v227 = objc_msgSend_callState(v222, v223, v224, v225, v226);

      if (v227 == 1)
      {
        uint64_t v490 = (uint64_t)v12;
        v232 = sub_224FB12A0();
        v77 = v493;
        if (os_log_type_enabled(v232, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v19;
          _os_log_impl(&dword_224F93000, v232, OS_LOG_TYPE_DEFAULT, "We have a call we're invited to, declining conference ID: %@", buf, 0xCu);
        }
LABEL_106:

        isVideo_callerProperties = objc_msgSend_sharedInstance(IMAVController, v278, v279, v280, v281);
        objc_msgSend_declineVCRequestWithBuddy_response_vcProps_forAccount_conferenceID_(isVideo_callerProperties, v282, (uint64_t)v497, 2, v490, 0, v19);
        goto LABEL_159;
      }
      v233 = objc_msgSend_sharedInstance(IMAVController, v228, v229, v230, v231);
      int hasRunningConference = objc_msgSend_hasRunningConference(v233, v234, v235, v236, v237);

      if (hasRunningConference)
      {
        v239 = sub_224FB12A0();
        if (os_log_type_enabled(v239, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v19;
          _os_log_impl(&dword_224F93000, v239, OS_LOG_TYPE_DEFAULT, "In active conference, declining conference ID: %@", buf, 0xCu);
        }

        v240 = sub_224FB12A0();
        if (os_log_type_enabled(v240, OS_LOG_TYPE_DEFAULT))
        {
          v245 = objc_msgSend__activeChat(IMAVChat, v241, v242, v243, v244);
          *(_DWORD *)buf = 138412290;
          v519 = v245;
          _os_log_impl(&dword_224F93000, v240, OS_LOG_TYPE_DEFAULT, "Active chat: %@", buf, 0xCu);
        }
        v246 = sub_224FB12A0();
        if (os_log_type_enabled(v246, OS_LOG_TYPE_DEFAULT))
        {
          v251 = objc_msgSend__nonFinalChat(IMAVChat, v247, v248, v249, v250);
          *(_DWORD *)buf = 138412290;
          v519 = v251;
          _os_log_impl(&dword_224F93000, v246, OS_LOG_TYPE_DEFAULT, "Non final chat: %@", buf, 0xCu);
        }
        v252 = sub_224FB12A0();
        v77 = v493;
        if (os_log_type_enabled(v252, OS_LOG_TYPE_DEFAULT))
        {
          v257 = objc_msgSend__connectedChat(IMAVChat, v253, v254, v255, v256);
          *(_DWORD *)buf = 138412290;
          v519 = v257;
          _os_log_impl(&dword_224F93000, v252, OS_LOG_TYPE_DEFAULT, "Connected chat: %@", buf, 0xCu);
        }
        v258 = sub_224FB12A0();
        if (os_log_type_enabled(v258, OS_LOG_TYPE_DEFAULT))
        {
          v263 = objc_msgSend__avChatArray(IMAVChat, v259, v260, v261, v262);
          *(_DWORD *)buf = 138412290;
          v519 = v263;
          _os_log_impl(&dword_224F93000, v258, OS_LOG_TYPE_DEFAULT, "All chats: %@", buf, 0xCu);
        }
        v268 = objc_msgSend__activeChat(IMAVChat, v264, v265, v266, v267);

        if (v268)
        {
          uint64_t v490 = (uint64_t)v12;
          v232 = sub_224FB12A0();
          if (os_log_type_enabled(v232, OS_LOG_TYPE_DEFAULT))
          {
            v277 = objc_msgSend__activeChat(IMAVChat, v273, v274, v275, v276);
            *(_DWORD *)buf = 138412290;
            v519 = v277;
            _os_log_impl(&dword_224F93000, v232, OS_LOG_TYPE_DEFAULT, "Simple ActiveChat: %@", buf, 0xCu);
          }
          goto LABEL_106;
        }
        long long v512 = 0u;
        long long v513 = 0u;
        long long v510 = 0u;
        long long v511 = 0u;
        v470 = objc_msgSend__avChatArray(IMAVChat, v269, v270, v271, v272);
        uint64_t v472 = objc_msgSend_countByEnumeratingWithState_objects_count_(v470, v471, (uint64_t)&v510, (uint64_t)v517, 16);
        if (v472)
        {
          uint64_t v477 = v472;
          uint64_t v478 = *(void *)v511;
          while (2)
          {
            id v479 = v9;
            for (uint64_t i = 0; i != v477; ++i)
            {
              if (*(void *)v511 != v478) {
                objc_enumerationMutation(v470);
              }
              v481 = *(void **)(*((void *)&v510 + 1) + 8 * i);
              if (objc_msgSend_isActive(v481, v473, v474, v475, v476))
              {
                v482 = sub_224FB12A0();
                if (os_log_type_enabled(v482, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v519 = v481;
                  _os_log_impl(&dword_224F93000, v482, OS_LOG_TYPE_DEFAULT, "chat that was active: %@", buf, 0xCu);
                }

                id v9 = v479;
                goto LABEL_210;
              }
            }
            uint64_t v477 = objc_msgSend_countByEnumeratingWithState_objects_count_(v470, v473, (uint64_t)&v510, (uint64_t)v517, 16);
            id v9 = v479;
            if (v477) {
              continue;
            }
            break;
          }
        }
LABEL_210:

        v483 = sub_224FB12A0();
        if (os_log_type_enabled(v483, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_224F93000, v483, OS_LOG_TYPE_DEFAULT, "[IMAVController hasRunningConference] claimed to have an active chat, but we really don't... *******FILE THIS PLEASE*****", buf, 2u);
        }

        v193 = sub_224FB12A0();
        v77 = v493;
        if (os_log_type_enabled(v193, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_224F93000, v193, OS_LOG_TYPE_DEFAULT, "[WARN] [IMAVController hasRunningConference] claimed to have an active chat, but we really don't...", buf, 2u);
        }
      }
      else
      {
LABEL_107:
        if (!v29)
        {
          LODWORD(v204) = 0;
          v77 = v493;
          goto LABEL_111;
        }
        v283 = objc_msgSend__incomingInvitations(IMAVChat, v70, v71, v72, v73);
        v77 = v493;
        if (objc_msgSend_count(v283, v284, v285, v286, v287))
        {
        }
        else
        {
          v397 = objc_msgSend__outgoingInvitations(IMAVChat, v288, v289, v290, v291);
          uint64_t v204 = objc_msgSend_count(v397, v398, v399, v400, v401);

          if (!v204) {
            goto LABEL_111;
          }
        }
        v402 = sub_224FB12A0();
        if (os_log_type_enabled(v402, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v19;
          _os_log_impl(&dword_224F93000, v402, OS_LOG_TYPE_DEFAULT, "We have active invite, declining conference ID: %@", buf, 0xCu);
        }

        v403 = sub_224FB12A0();
        if (os_log_type_enabled(v403, OS_LOG_TYPE_DEFAULT))
        {
          v408 = objc_msgSend__activeChat(IMAVChat, v404, v405, v406, v407);
          *(_DWORD *)buf = 138412290;
          v519 = v408;
          _os_log_impl(&dword_224F93000, v403, OS_LOG_TYPE_DEFAULT, "Active chat: %@", buf, 0xCu);
        }
        v409 = sub_224FB12A0();
        if (os_log_type_enabled(v409, OS_LOG_TYPE_DEFAULT))
        {
          v414 = objc_msgSend__nonFinalChat(IMAVChat, v410, v411, v412, v413);
          *(_DWORD *)buf = 138412290;
          v519 = v414;
          _os_log_impl(&dword_224F93000, v409, OS_LOG_TYPE_DEFAULT, "Non final chat: %@", buf, 0xCu);
        }
        v415 = sub_224FB12A0();
        if (os_log_type_enabled(v415, OS_LOG_TYPE_DEFAULT))
        {
          v420 = objc_msgSend__connectedChat(IMAVChat, v416, v417, v418, v419);
          *(_DWORD *)buf = 138412290;
          v519 = v420;
          _os_log_impl(&dword_224F93000, v415, OS_LOG_TYPE_DEFAULT, "Connected chat: %@", buf, 0xCu);
        }
        v421 = sub_224FB12A0();
        if (os_log_type_enabled(v421, OS_LOG_TYPE_DEFAULT))
        {
          v426 = objc_msgSend__avChatArray(IMAVChat, v422, v423, v424, v425);
          *(_DWORD *)buf = 138412290;
          v519 = v426;
          _os_log_impl(&dword_224F93000, v421, OS_LOG_TYPE_DEFAULT, "All chats: %@", buf, 0xCu);
        }
        v431 = objc_msgSend__nonFinalChat(IMAVChat, v427, v428, v429, v430);

        if (v431)
        {
          uint64_t v490 = (uint64_t)v12;
          v436 = sub_224FB12A0();
          if (os_log_type_enabled(v436, OS_LOG_TYPE_DEFAULT))
          {
            v441 = objc_msgSend__nonFinalChat(IMAVChat, v437, v438, v439, v440);
            *(_DWORD *)buf = 138412290;
            v519 = v441;
            _os_log_impl(&dword_224F93000, v436, OS_LOG_TYPE_DEFAULT, "Simple nonFinalChat: %@", buf, 0xCu);
          }
          v76 = 0;
LABEL_197:

          isVideo_callerProperties = objc_msgSend_sharedInstance(IMAVController, v465, v466, v467, v468);
          objc_msgSend_declineVCRequestWithBuddy_response_vcProps_forAccount_conferenceID_(isVideo_callerProperties, v469, (uint64_t)v497, 2, v490, 0, v19);
          goto LABEL_157;
        }
        id v452 = v9;
        long long v508 = 0u;
        long long v509 = 0u;
        long long v506 = 0u;
        long long v507 = 0u;
        v436 = objc_msgSend__avChatArray(IMAVChat, v432, v433, v434, v435);
        uint64_t v454 = objc_msgSend_countByEnumeratingWithState_objects_count_(v436, v453, (uint64_t)&v506, (uint64_t)v516, 16);
        if (v454)
        {
          uint64_t v459 = v454;
          uint64_t v460 = *(void *)v507;
          while (2)
          {
            for (uint64_t j = 0; j != v459; ++j)
            {
              if (*(void *)v507 != v460) {
                objc_enumerationMutation(v436);
              }
              v462 = *(void **)(*((void *)&v506 + 1) + 8 * j);
              if (objc_msgSend_isActive(v462, v455, v456, v457, v458))
              {
                uint64_t v490 = (uint64_t)v12;
                v464 = sub_224FB12A0();
                if (os_log_type_enabled(v464, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v519 = v462;
                  _os_log_impl(&dword_224F93000, v464, OS_LOG_TYPE_DEFAULT, "chat that was active: %@", buf, 0xCu);
                }

                id v9 = v452;
                v76 = 0;
                v77 = v493;
                goto LABEL_197;
              }
            }
            uint64_t v459 = objc_msgSend_countByEnumeratingWithState_objects_count_(v436, v455, (uint64_t)&v506, (uint64_t)v516, 16);
            if (v459) {
              continue;
            }
            break;
          }
        }

        v463 = sub_224FB12A0();
        if (os_log_type_enabled(v463, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_224F93000, v463, OS_LOG_TYPE_DEFAULT, "[IMAVController hasRunningConference] claimed to have an active chat, but we really don't... *******FILE THIS PLEASE*****", buf, 2u);
        }

        v193 = sub_224FB12A0();
        id v9 = v452;
        if (os_log_type_enabled(v193, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_224F93000, v193, OS_LOG_TYPE_DEFAULT, "[WARN] [IMAVController hasRunningConference] claimed to have an active chat, but we really don't...", buf, 2u);
        }
        v77 = v493;
      }
    }
    else
    {
      v193 = sub_224FB12A0();
      v77 = v493;
      if (os_log_type_enabled(v193, OS_LOG_TYPE_DEFAULT))
      {
        v198 = objc_msgSend_otherIMHandle(v494, v194, v195, v196, v197);
        v203 = objc_msgSend_ID(v198, v199, v200, v201, v202);
        *(_DWORD *)buf = 138412546;
        v519 = v203;
        __int16 v520 = 2112;
        uint64_t v521 = (uint64_t)v494;
        _os_log_impl(&dword_224F93000, v193, OS_LOG_TYPE_DEFAULT, "We already have a chat connecting from %@  (%@), accepting incoming invite and declining existing chat", buf, 0x16u);
      }
    }
    LODWORD(v204) = v126 ^ 1;

    goto LABEL_111;
  }
  v98 = sub_224FB12A0();
  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
  {
    v103 = objc_msgSend_otherIMHandle(v495, v99, v100, v101, v102);
    v108 = objc_msgSend_ID(v103, v104, v105, v106, v107);
    *(_DWORD *)buf = 138412546;
    v519 = v108;
    __int16 v520 = 2112;
    uint64_t v521 = (uint64_t)v495;
    _os_log_impl(&dword_224F93000, v98, OS_LOG_TYPE_DEFAULT, "We already have a chat awaiting reply from %@  (%@)", buf, 0x16u);
  }
  v113 = objc_msgSend_remoteParticipants(v495, v109, v110, v111, v112);
  unint64_t v118 = objc_msgSend_count(v113, v114, v115, v116, v117);

  if (v118 >= 2)
  {
    v123 = objc_msgSend_sharedInstance(IMAVController, v119, v120, v121, v122);
    uint64_t v124 = (uint64_t)v12;
    isVideo_callerProperties = v123;
    uint64_t v490 = v124;
    objc_msgSend_declineVCRequestWithBuddy_response_vcProps_forAccount_conferenceID_(v123, v125, (uint64_t)v497, 2, v124, v9, v19);
LABEL_156:
    v77 = v493;
    goto LABEL_157;
  }
  id v487 = v9;
  uint64_t v143 = objc_msgSend_participantMatchingIMHandle_(v495, v119, (uint64_t)v497, v121, v122);
  uint64_t v144 = (uint64_t)v12;
  v484 = objc_msgSend_objectForKey_(v12, v145, *MEMORY[0x263F4A6B8], v146, v147);
  v151 = objc_msgSend_dictionaryWithPlistData_(NSDictionary, v148, (uint64_t)v484, v149, v150);
  v155 = objc_msgSend_objectForKey_(v151, v152, *MEMORY[0x263F4A740], v153, v154);
  unsigned int v160 = objc_msgSend_sessionID(v495, v156, v157, v158, v159);
  unsigned int v165 = objc_msgSend_unsignedIntValue(v155, v161, v162, v163, v164);
  v166 = sub_224FB12A0();
  BOOL v167 = os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT);
  v491 = (void *)v143;
  if (v143)
  {
    if (v167)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v166, OS_LOG_TYPE_DEFAULT, "We have cross invites", buf, 2u);
    }

    if (v160 == v165)
    {
      id v12 = (id)v144;
      if (!v19
        || (objc_msgSend_conferenceID(v495, v168, v169, v170, v171),
            v172 = objc_claimAutoreleasedReturnValue(),
            v172,
            !v172))
      {
LABEL_81:
        v215 = sub_224FB12A0();
        if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_224F93000, v215, OS_LOG_TYPE_DEFAULT, "Cross invites: We are the host, declining incoming invite", buf, 2u);
        }

        v210 = objc_msgSend_sharedInstance(IMAVController, v216, v217, v218, v219);
        objc_msgSend_declineVCRequestWithBuddy_response_vcProps_forAccount_conferenceID_(v210, v220, (uint64_t)v497, 2, (uint64_t)v12, v487, v19);
LABEL_84:
        LODWORD(v204) = 0;
LABEL_85:
        v77 = v493;

        char v221 = v204;
        v76 = v495;
        goto LABEL_86;
      }
      v173 = sub_224FB12A0();
      if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224F93000, v173, OS_LOG_TYPE_DEFAULT, "Using conference IDs to pick the host", buf, 2u);
      }

      v178 = objc_msgSend_conferenceID(v495, v174, v175, v176, v177);
      char isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v19, v179, (uint64_t)v178, v180, v181);

      if (isEqualToIgnoringCase)
      {
        BOOL v187 = 0;
      }
      else
      {
        v442 = objc_msgSend_conferenceID(v495, v183, v184, v185, v186);
        BOOL v187 = objc_msgSend_compare_(v19, v443, (uint64_t)v442, v444, v445) == 1;
      }
      v446 = sub_224FB12A0();
      if (os_log_type_enabled(v446, OS_LOG_TYPE_DEFAULT))
      {
        v451 = objc_msgSend_conferenceID(v495, v447, v448, v449, v450);
        *(_DWORD *)buf = 138412290;
        v519 = v451;
        _os_log_impl(&dword_224F93000, v446, OS_LOG_TYPE_DEFAULT, "Cross invites: our   conference ID %@", buf, 0xCu);
      }
      v214 = sub_224FB12A0();
      if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v519 = v19;
        _os_log_impl(&dword_224F93000, v214, OS_LOG_TYPE_DEFAULT, "Cross invites: their conference ID %@", buf, 0xCu);
      }
    }
    else
    {
      v212 = sub_224FB12A0();
      if (os_log_type_enabled(v212, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224F93000, v212, OS_LOG_TYPE_DEFAULT, "Using session IDs to pick the host", buf, 2u);
      }

      BOOL v187 = v160 < v165;
      v213 = sub_224FB12A0();
      if (os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v519) = v160;
        _os_log_impl(&dword_224F93000, v213, OS_LOG_TYPE_DEFAULT, "Cross invites: our   session ID %u", buf, 8u);
      }

      v214 = sub_224FB12A0();
      if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v519) = v165;
        _os_log_impl(&dword_224F93000, v214, OS_LOG_TYPE_DEFAULT, "Cross invites: their session ID %u", buf, 8u);
      }
      id v12 = (id)v144;
    }

    if (v187)
    {
      v210 = sub_224FB12A0();
      if (os_log_type_enabled(v210, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224F93000, v210, OS_LOG_TYPE_DEFAULT, "They are the host, cancelling our outgoing invite", buf, 2u);
      }
      LODWORD(v204) = 1;
      goto LABEL_85;
    }
    goto LABEL_81;
  }
  if (v167)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224F93000, v166, OS_LOG_TYPE_DEFAULT, "Buddy not found, this is not a cross invite", buf, 2u);
  }

  id v12 = (id)v144;
  if (v39)
  {
    v205 = sub_224FB12A0();
    if (os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v205, OS_LOG_TYPE_DEFAULT, "Not allowing incoming invitation during call, declining...", buf, 2u);
    }

    v210 = objc_msgSend_sharedInstance(IMAVController, v206, v207, v208, v209);
    objc_msgSend_declineVCRequestWithBuddy_response_vcProps_forAccount_conferenceID_(v210, v211, (uint64_t)v497, 2, v144, v487, v19);
    goto LABEL_84;
  }
  LODWORD(v204) = 0;
  char v221 = 1;
  v76 = v495;
  v77 = v493;
LABEL_86:

  id v9 = v487;
  if ((v221 & 1) == 0) {
    goto LABEL_158;
  }
LABEL_111:
  v292 = objc_msgSend_allBuddyListIMHandles(MEMORY[0x263F4A518], v70, v71, v72, v73);
  uint64_t v296 = objc_msgSend_indexOfObjectIdenticalTo_(v292, v293, (uint64_t)v497, v294, v295);

  if ((objc_msgSend_hasConferencing(v497, v297, v298, v299, v300) & 1) == 0 && v296 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend_setCapabilities_(v497, v301, 0x1000000E0000, v303, v304);
    objc_msgSend_setPersonStatus_(v497, v305, 4, v306, v307);
  }
  v308 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v301, v302, v303, v304);
  int isFastUserSwitched = objc_msgSend_isFastUserSwitched(v308, v309, v310, v311, v312);

  if (isFastUserSwitched)
  {
    v318 = sub_224FB12A0();
    if (os_log_type_enabled(v318, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v318, OS_LOG_TYPE_DEFAULT, "We're fast user switched out, declining invite", buf, 2u);
    }

    v323 = objc_msgSend_sharedInstance(IMAVController, v319, v320, v321, v322);
    uint64_t v490 = (uint64_t)v12;
    objc_msgSend_declineVCRequestWithBuddy_response_vcProps_forAccount_conferenceID_(v323, v324, (uint64_t)v497, 1, (uint64_t)v12, v9, v19);

    v325 = sub_224FB12A0();
    if (os_log_type_enabled(v325, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v519 = v497;
      __int16 v520 = 2048;
      uint64_t v521 = 3;
      _os_log_impl(&dword_224F93000, v325, OS_LOG_TYPE_DEFAULT, "Notifying delegates about inviteFailedFromIMHandle %@ reason %ld", buf, 0x16u);
    }

    long long v500 = 0u;
    long long v501 = 0u;
    long long v498 = 0u;
    long long v499 = 0u;
    v330 = objc_msgSend_sharedInstance(IMAVController, v326, v327, v328, v329);
    isVideo_callerProperties = objc_msgSend_delegates(v330, v331, v332, v333, v334);

    uint64_t v336 = objc_msgSend_countByEnumeratingWithState_objects_count_(isVideo_callerProperties, v335, (uint64_t)&v498, (uint64_t)v514, 16);
    if (v336)
    {
      uint64_t v337 = v336;
      v485 = v19;
      uint64_t v338 = *(void *)v499;
      do
      {
        for (uint64_t k = 0; k != v337; ++k)
        {
          if (*(void *)v499 != v338) {
            objc_enumerationMutation(isVideo_callerProperties);
          }
          v340 = *(void **)(*((void *)&v498 + 1) + 8 * k);
          char v341 = objc_opt_respondsToSelector();
          v342 = sub_224FB12A0();
          BOOL v343 = os_log_type_enabled(v342, OS_LOG_TYPE_DEFAULT);
          if (v341)
          {
            if (v343)
            {
              *(_DWORD *)buf = 138412290;
              v519 = v340;
              _os_log_impl(&dword_224F93000, v342, OS_LOG_TYPE_DEFAULT, " => Dispatching to delegate: %@", buf, 0xCu);
            }

            objc_msgSend_inviteFailedFromIMHandle_reason_(v340, v344, (uint64_t)v497, 3, v345);
          }
          else
          {
            if (v343)
            {
              *(_DWORD *)buf = 138412290;
              v519 = v340;
              _os_log_impl(&dword_224F93000, v342, OS_LOG_TYPE_DEFAULT, " => **NOT** Dispatching to delegate: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v337 = objc_msgSend_countByEnumeratingWithState_objects_count_(isVideo_callerProperties, v346, (uint64_t)&v498, (uint64_t)v514, 16);
      }
      while (v337);
      v19 = v485;
LABEL_134:
      v76 = v495;
      goto LABEL_156;
    }
LABEL_159:
    v76 = v495;
    goto LABEL_157;
  }
  v76 = v495;
  if ((v496 & 1) == 0)
  {
    v347 = objc_msgSend_sharedInstance(IMAVController, v314, v315, v316, v317);
    objc_msgSend_cameraCapable(v347, v348, v349, v350, v351);
  }
  if (v497)
  {
    v352 = [IMAVChat alloc];
    uint64_t v490 = (uint64_t)v12;
    isVideo_callerProperties = objc_msgSend_initIncomingFrom_isVideo_callerProperties_(v352, v353, (uint64_t)v497, v496 ^ 1u, (uint64_t)v12);
    objc_msgSend__setConferenceID_(isVideo_callerProperties, v354, (uint64_t)v19, v355, v356);
    if (!v204)
    {
      objc_msgSend__handleIncomingAVChatForNotification_(self, v357, (uint64_t)isVideo_callerProperties, v359, v360);
      goto LABEL_157;
    }
    v486 = v19;
    id v488 = v9;
    objc_msgSend_beginChat(isVideo_callerProperties, v357, v358, v359, v360);
    v361 = sub_224FB12A0();
    if (os_log_type_enabled(v361, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v519 = isVideo_callerProperties;
      _os_log_impl(&dword_224F93000, v361, OS_LOG_TYPE_DEFAULT, "Notifying delegates about invitedToIMAVChat %@", buf, 0xCu);
    }

    long long v504 = 0u;
    long long v505 = 0u;
    long long v502 = 0u;
    long long v503 = 0u;
    v366 = objc_msgSend_sharedInstance(IMAVController, v362, v363, v364, v365);
    v371 = objc_msgSend_delegates(v366, v367, v368, v369, v370);

    uint64_t v373 = objc_msgSend_countByEnumeratingWithState_objects_count_(v371, v372, (uint64_t)&v502, (uint64_t)v515, 16);
    if (v373)
    {
      uint64_t v374 = v373;
      uint64_t v375 = *(void *)v503;
      do
      {
        for (uint64_t m = 0; m != v374; ++m)
        {
          if (*(void *)v503 != v375) {
            objc_enumerationMutation(v371);
          }
          v377 = *(void **)(*((void *)&v502 + 1) + 8 * m);
          char v378 = objc_opt_respondsToSelector();
          v379 = sub_224FB12A0();
          BOOL v380 = os_log_type_enabled(v379, OS_LOG_TYPE_DEFAULT);
          if (v378)
          {
            if (v380)
            {
              *(_DWORD *)buf = 138412290;
              v519 = v377;
              _os_log_impl(&dword_224F93000, v379, OS_LOG_TYPE_DEFAULT, " => Dispatching to delegate: %@", buf, 0xCu);
            }

            objc_msgSend_invitedToIMAVChat_(v377, v381, (uint64_t)isVideo_callerProperties, v382, v383);
          }
          else
          {
            if (v380)
            {
              *(_DWORD *)buf = 138412290;
              v519 = v377;
              _os_log_impl(&dword_224F93000, v379, OS_LOG_TYPE_DEFAULT, " => **NOT** Dispatching to delegate: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v374 = objc_msgSend_countByEnumeratingWithState_objects_count_(v371, v384, (uint64_t)&v502, (uint64_t)v515, 16);
      }
      while (v374);
    }

    objc_msgSend_acceptInvitation(isVideo_callerProperties, v385, v386, v387, v388);
    v76 = v495;
    objc_msgSend_cancelInvitation(v495, v389, v390, v391, v392);
    objc_msgSend_endChat(v494, v393, v394, v395, v396);
    v19 = v486;
    id v9 = v488;
    goto LABEL_156;
  }
LABEL_158:
}

- (void)account:(id)a3 conference:(id)a4 receivedInvitationFrom:(id)a5 properties:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  uint64_t v14 = sub_224FB12A0();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138412546;
    id v30 = v11;
    __int16 v31 = 2112;
    id v32 = v10;
    _os_log_impl(&dword_224F93000, v14, OS_LOG_TYPE_DEFAULT, "Incoming VC Invitation from: %@   conference ID: %@", (uint8_t *)&v29, 0x16u);
  }

  v19 = objc_msgSend_sharedInstance(MEMORY[0x263F4A520], v15, v16, v17, v18);
  uint64_t v23 = objc_msgSend_accountForUniqueID_(v19, v20, (uint64_t)v13, v21, v22);

  uint64_t v27 = objc_msgSend_imHandleWithInfo_(v23, v24, (uint64_t)v11, v25, v26);
  objc_msgSend__handleIncomingWithAccount_fromHandle_conference_properites_(self, v28, (uint64_t)v23, (uint64_t)v27, (uint64_t)v10, v12);
}

- (void)account:(id)a3 conference:(id)a4 receivedResponseToInvitationFrom:(id)a5 properties:(id)a6
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a6;
  id v11 = (void *)MEMORY[0x263F4A520];
  id v12 = a5;
  id v13 = a3;
  uint64_t v18 = objc_msgSend_sharedInstance(v11, v14, v15, v16, v17);
  uint64_t v22 = objc_msgSend_accountForUniqueID_(v18, v19, (uint64_t)v13, v20, v21);

  BOOL v75 = v22;
  uint64_t v26 = objc_msgSend_imHandleWithInfo_(v22, v23, (uint64_t)v12, v24, v25);

  uint64_t v27 = sub_224FB12A0();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    id v32 = objc_msgSend_ID(v26, v28, v29, v30, v31);
    *(_DWORD *)buf = 138412290;
    v77 = v32;
    _os_log_impl(&dword_224F93000, v27, OS_LOG_TYPE_DEFAULT, "Incoming VC Response from: %@", buf, 0xCu);
  }
  uint64_t v36 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x263EFF9A0], v33, (uint64_t)v10, v34, v35);
  v40 = v36;
  if (v26) {
    objc_msgSend_setObject_forKey_(v36, v37, (uint64_t)v26, *MEMORY[0x263F4A720], v39);
  }
  uint64_t v41 = objc_msgSend_objectForKey_(v10, v37, *MEMORY[0x263F4A730], v38, v39);
  uint64_t v45 = objc_msgSend_dictionaryWithPlistData_(NSDictionary, v42, (uint64_t)v41, v43, v44);
  v49 = objc_msgSend_objectForKey_(v45, v46, *MEMORY[0x263F4A740], v47, v48);
  uint64_t v57 = objc_msgSend_unsignedIntValue(v49, v50, v51, v52, v53);
  if (!v9)
  {
    v62 = 0;
LABEL_15:
    uint64_t v67 = objc_msgSend__bestGuessAVChatWithIMHandle_conferenceID_sessionID_properties_(IMAVChat, v54, (uint64_t)v26, (uint64_t)v9, v57, 0);
    objc_msgSend__responseToVCInvite_(v67, v72, (uint64_t)v40, v73, v74);
    goto LABEL_16;
  }
  v58 = objc_msgSend__avChatWithConferenceID_(IMAVChat, v54, (uint64_t)v9, v55, v56);
  v62 = v58;
  if (!v58 || objc_msgSend_state(v58, v54, v59, v60, v61) != 4) {
    goto LABEL_15;
  }
  v63 = sub_224FB12A0();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v77 = v62;
    __int16 v78 = 2112;
    id v79 = v9;
    _os_log_impl(&dword_224F93000, v63, OS_LOG_TYPE_DEFAULT, "We already have a chat running for %@  (%@)", buf, 0x16u);
  }

  uint64_t v67 = objc_msgSend_participantMatchingIMHandle_(v62, v64, (uint64_t)v26, v65, v66);
  uint64_t v68 = sub_224FB12A0();
  BOOL v69 = os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT);
  if (v67)
  {
    if (v69)
    {
      *(_DWORD *)buf = 138412290;
      v77 = v67;
      _os_log_impl(&dword_224F93000, v68, OS_LOG_TYPE_DEFAULT, "Accept re-initiate for: %@", buf, 0xCu);
    }

    objc_msgSend__processResponseDictionary_allowSecondConnection_(v67, v70, (uint64_t)v10, 1, v71);
  }
  else
  {
    if (v69)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v68, OS_LOG_TYPE_DEFAULT, "[WARN] No participant found to accept re-initiate", buf, 2u);
    }
  }
LABEL_16:
}

- (void)account:(id)a3 conference:(id)a4 receivedCancelInvitationFrom:(id)a5 properties:(id)a6
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = (void *)MEMORY[0x263F4A520];
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  uint64_t v18 = objc_msgSend_sharedInstance(v10, v14, v15, v16, v17);
  uint64_t v22 = objc_msgSend_accountForUniqueID_(v18, v19, (uint64_t)v13, v20, v21);

  uint64_t v26 = objc_msgSend_imHandleWithInfo_(v22, v23, (uint64_t)v12, v24, v25);

  uint64_t v27 = sub_224FB12A0();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    id v32 = objc_msgSend_ID(v26, v28, v29, v30, v31);
    int v71 = 138412290;
    id v72 = v32;
    _os_log_impl(&dword_224F93000, v27, OS_LOG_TYPE_DEFAULT, "Incoming VC Cancel from: %@", (uint8_t *)&v71, 0xCu);
  }
  uint64_t v36 = objc_msgSend_objectForKey_(v11, v33, *MEMORY[0x263F4A730], v34, v35);

  v40 = objc_msgSend_dictionaryWithPlistData_(NSDictionary, v37, (uint64_t)v36, v38, v39);
  uint64_t v44 = objc_msgSend_objectForKey_(v40, v41, *MEMORY[0x263F4A740], v42, v43);
  uint64_t v48 = objc_msgSend_objectForKey_(v40, v45, *MEMORY[0x263F4A728], v46, v47);
  uint64_t v53 = objc_msgSend_unsignedIntValue(v44, v49, v50, v51, v52);
  uint64_t v55 = objc_msgSend__bestGuessAVChatWithIMHandle_conferenceID_sessionID_properties_(IMAVChat, v54, (uint64_t)v26, (uint64_t)v9, v53, 0);
  uint64_t v56 = sub_224FB12A0();
  BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
  if (v55)
  {
    if (v57)
    {
      int v71 = 138412290;
      id v72 = v55;
      _os_log_impl(&dword_224F93000, v56, OS_LOG_TYPE_DEFAULT, "Found chat to cancel: %@", (uint8_t *)&v71, 0xCu);
    }

    int v66 = objc_msgSend_intValue(v48, v62, v63, v64, v65);
    if (v66 == 10) {
      unsigned int v69 = 29;
    }
    else {
      unsigned int v69 = 1;
    }
    if (v66 == 8) {
      objc_msgSend__cancelInvitationWithReason_error_(v55, v67, 27, 0, v68);
    }
    else {
      objc_msgSend__cancelInvitationWithReason_error_(v55, v67, v69, 0, v68);
    }
  }
  else
  {
    if (v57)
    {
      v70 = objc_msgSend_ID(v26, v58, v59, v60, v61);
      int v71 = 138412546;
      id v72 = v9;
      __int16 v73 = 2112;
      uint64_t v74 = v70;
      _os_log_impl(&dword_224F93000, v56, OS_LOG_TYPE_DEFAULT, "[WARN] Found no VC chat to cancel for conference: %@ with buddy: %@", (uint8_t *)&v71, 0x16u);
    }
  }
}

- (void)account:(id)a3 conference:(id)a4 receivedAVMessage:(unsigned int)a5 from:(id)a6 sessionID:(unsigned int)a7 userInfo:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v11 = *(void *)&a5;
  id v35 = a3;
  id v13 = a6;
  id v14 = a8;
  uint64_t v20 = objc_msgSend__bestGuessAVChatWithIMHandle_conferenceID_sessionID_properties_(IMAVChat, v15, 0, (uint64_t)a4, v9, 0);
  if (v20)
  {
    uint64_t v21 = objc_msgSend_sharedInstance(MEMORY[0x263F4A520], v16, v17, v18, v19);
    uint64_t v25 = objc_msgSend_accountForUniqueID_(v21, v22, (uint64_t)v35, v23, v24);

    uint64_t v29 = objc_msgSend_imHandleWithInfo_(v25, v26, (uint64_t)v13, v27, v28);
    uint64_t v33 = objc_msgSend_participantMatchingIMHandle_(v20, v30, (uint64_t)v29, v31, v32);

    objc_msgSend_handleGenericAVMessageFromParticipant_type_userInfo_(v20, v34, (uint64_t)v33, v11, (uint64_t)v14);
  }
}

- (void)account:(id)a3 conference:(id)a4 peerIDChangedFromID:(id)a5 toID:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = sub_224FB12A0();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412802;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2112;
    id v27 = v12;
    _os_log_impl(&dword_224F93000, v13, OS_LOG_TYPE_DEFAULT, "Account: %@    Requested changing of Peer ID from: %@  to %@", (uint8_t *)&v22, 0x20u);
  }

  uint64_t v17 = objc_msgSend__avChatWithConferenceID_(IMAVChat, v14, (uint64_t)v10, v15, v16);
  uint64_t v20 = v17;
  if (v17)
  {
    objc_msgSend__peerID_changedTo_(v17, v18, (uint64_t)v11, (uint64_t)v12, v19);
  }
  else
  {
    uint64_t v21 = sub_224FB12A0();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138413058;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v10;
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_impl(&dword_224F93000, v21, OS_LOG_TYPE_DEFAULT, "%@ requested a change of conference (%@) peer ID: %@  to: %@  but it doesn't exist!", (uint8_t *)&v22, 0x2Au);
    }
  }
}

- (void)account:(id)a3 conference:(id)a4 changedToNewConferenceID:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_224FB12A0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412802;
    id v22 = v7;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "Account: %@    Requested changing of conference ID: %@  to %@", (uint8_t *)&v21, 0x20u);
  }

  id v14 = objc_msgSend__avChatWithConferenceID_(IMAVChat, v11, (uint64_t)v8, v12, v13);
  uint64_t v15 = sub_224FB12A0();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      int v21 = 138412290;
      id v22 = v9;
      _os_log_impl(&dword_224F93000, v15, OS_LOG_TYPE_DEFAULT, "VC Conference ID Set to: %@", (uint8_t *)&v21, 0xCu);
    }

    objc_msgSend__setConferenceID_(v14, v17, (uint64_t)v9, v18, v19);
  }
  else
  {
    if (v16)
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_224F93000, v15, OS_LOG_TYPE_DEFAULT, "** VC Conference ID could not be set!", (uint8_t *)&v21, 2u);
    }

    uint64_t v20 = sub_224FB12A0();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412802;
      id v22 = v7;
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v9;
      _os_log_impl(&dword_224F93000, v20, OS_LOG_TYPE_DEFAULT, "%@ requested a change of conference ID: %@  to: %@  but it doesn't exist!", (uint8_t *)&v21, 0x20u);
    }
  }
}

- (void)_notifyOfIncomingInvitationFor:(id)a3 notifyInvitationListeners:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = sub_224FB12A0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (v4) {
      id v7 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    id v61 = v5;
    __int16 v62 = 2112;
    uint64_t v63 = v7;
    _os_log_impl(&dword_224F93000, v6, OS_LOG_TYPE_DEFAULT, "chat %@ notifyInvitationListeners %@", buf, 0x16u);
  }

  if (v4)
  {
    if (!objc_msgSend_state(v5, v8, v9, v10, v11))
    {
      uint64_t v54 = (uint64_t)v5;
      objc_msgSend_beginChat(v5, v12, v13, v14, v15);
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      uint64_t v20 = objc_msgSend_sharedInstance(IMAVController, v16, v17, v18, v19);
      __int16 v25 = objc_msgSend_delegates(v20, v21, v22, v23, v24);

      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v55, (uint64_t)v59, 16);
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v56 != v29) {
              objc_enumerationMutation(v25);
            }
            uint64_t v31 = *(void **)(*((void *)&v55 + 1) + 8 * i);
            uint64_t v32 = sub_224FB12A0();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v61 = v31;
              _os_log_impl(&dword_224F93000, v32, OS_LOG_TYPE_DEFAULT, "Checking delegate: %@", buf, 0xCu);
            }

            char v33 = objc_opt_respondsToSelector();
            uint64_t v34 = sub_224FB12A0();
            BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
            if (v33)
            {
              if (v35)
              {
                *(_DWORD *)buf = 138412290;
                id v61 = v31;
                _os_log_impl(&dword_224F93000, v34, OS_LOG_TYPE_DEFAULT, " => Dispatching to delegate: %@", buf, 0xCu);
              }

              objc_msgSend_invitedToIMAVChat_(v31, v36, v54, v37, v38);
            }
            else
            {
              if (v35)
              {
                *(_DWORD *)buf = 138412290;
                id v61 = v31;
                _os_log_impl(&dword_224F93000, v34, OS_LOG_TYPE_DEFAULT, " => **NOT** Dispatching to delegate: %@", buf, 0xCu);
              }
            }
          }
          uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v39, (uint64_t)&v55, (uint64_t)v59, 16);
        }
        while (v28);
      }

      id v5 = (id)v54;
    }
    v40 = objc_msgSend_initiatorIMHandle(v5, v12, v13, v14, v15);
    uint64_t v45 = objc_msgSend_ID(v40, v41, v42, v43, v44);
    uint64_t isVideo = objc_msgSend_isVideo(v5, v46, v47, v48, v49);
    objc_msgSend__submitCallStartedLoggingWithRecipientID_isCaller_isVideo_(v5, v51, (uint64_t)v45, 0, isVideo);

    if (ShouldAutoAcceptInvitations()) {
      objc_msgSend_performSelector_withObject_afterDelay_(v5, v52, (uint64_t)sel_acceptInvitation, 0, v53, 0.0);
    }
  }
}

- (void)_enqueueIMAVChatForNetworkActivation:(id)a3
{
  uint64_t v149 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((objc_msgSend_containsObjectIdenticalTo_(self->_pendingChats, v5, (uint64_t)v4, v6, v7) & 1) == 0)
  {
    if (!self->_pendingLookups)
    {
      uint64_t v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      pendingLookups = self->_pendingLookups;
      self->_pendingLookups = v12;
    }
    if (!self->_pendingChats)
    {
      uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      pendingChats = self->_pendingChats;
      self->_pendingChats = v14;
    }
    uint64_t v134 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB40], v8, v9, v10, v11);
    if (objc_msgSend_allowAnyNetwork(v134, v16, v17, v18, v19))
    {
      uint64_t v24 = sub_224FB12A0();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224F93000, v24, OS_LOG_TYPE_DEFAULT, "We're allowed to use any network, bypassing check", buf, 2u);
      }

      if (objc_msgSend_state(v4, v25, v26, v27, v28) > 4) {
        goto LABEL_47;
      }
      uint64_t v29 = sub_224FB12A0();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v146 = (uint64_t)v4;
        _os_log_impl(&dword_224F93000, v29, OS_LOG_TYPE_DEFAULT, "Notifying for chat: %@", buf, 0xCu);
      }

      objc_msgSend__notifyOfIncomingInvitationFor_notifyInvitationListeners_(self, v30, (uint64_t)v4, 1, v31);
      long long v137 = 0u;
      long long v138 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      uint64_t v32 = self->_pendingChats;
      uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v135, (uint64_t)v144, 16);
      if (v35)
      {
        uint64_t v36 = *(void *)v136;
        do
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v136 != v36) {
              objc_enumerationMutation(v32);
            }
            id v38 = *(id *)(*((void *)&v135 + 1) + 8 * i);
            if (v38 != v4)
            {
              uint64_t v39 = sub_224FB12A0();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v146 = (uint64_t)v38;
                _os_log_impl(&dword_224F93000, v39, OS_LOG_TYPE_DEFAULT, "Declining other chat: %@", buf, 0xCu);
              }

              objc_msgSend_declineInvitationWithResponse_(v38, v40, 2, v41, v42);
            }
          }
          uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v34, (uint64_t)&v135, (uint64_t)v144, 16);
        }
        while (v35);
      }
    }
    else
    {
      uint64_t v43 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], v20, v21, v22, v23);
      unsigned int v47 = objc_msgSend_wifiAllowedForBundleId_(v43, v44, @"com.apple.facetime", v45, v46);

      uint64_t v52 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], v48, v49, v50, v51);
      unint64_t v53 = v47;
      int v58 = objc_msgSend_nonWifiFaceTimeAvailable(v52, v54, v55, v56, v57);

      if (v58) {
        double v63 = 2.0;
      }
      else {
        double v63 = 15.0;
      }
      if (v58) {
        uint64_t v64 = (void *)(v53 | 2);
      }
      else {
        uint64_t v64 = (void *)v53;
      }
      uint64_t v65 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v59, v60, v61, v62);
      int isScreenLit = objc_msgSend_isScreenLit(v65, v66, v67, v68, v69);

      if (isScreenLit)
      {
        id v71 = objc_alloc_init(MEMORY[0x263EFF910]);
        v76 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v72, v73, v74, v75);
        v81 = objc_msgSend_dateScreenLightLastChanged(v76, v77, v78, v79, v80);

        objc_msgSend_timeIntervalSinceDate_(v71, v82, (uint64_t)v81, v83, v84);
        double v86 = v85;
        v87 = sub_224FB12A0();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v146 = *(void *)&v86;
          _os_log_impl(&dword_224F93000, v87, OS_LOG_TYPE_DEFAULT, "Time since lights on: %f", buf, 0xCu);
        }

        if (v86 <= 0.0)
        {
          double v88 = v63;
        }
        else
        {
          double v88 = 0.0;
          if (v86 < v63) {
            double v88 = v63 - v86;
          }
        }
      }
      else
      {
        double v88 = v63;
      }
      IMTimeOfDay();
      uint64_t v90 = v89;
      uint64_t v95 = objc_msgSend__timings(v4, v91, v92, v93, v94);
      objc_msgSend_startTimingForKey_(v95, v96, @"incoming-network-check", v97, v98);

      v99 = sub_224FB12A0();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v146 = 0x403E000000000000;
        __int16 v147 = 2048;
        double v148 = v88;
        _os_log_impl(&dword_224F93000, v99, OS_LOG_TYPE_DEFAULT, "Starting availability check with network timeout: %fs   wifi timeout: %fs", buf, 0x16u);
      }

      id v100 = objc_alloc(MEMORY[0x263F4A5C8]);
      objc_initWeak(&location, v100);
      id v101 = v100;
      v139[0] = MEMORY[0x263EF8330];
      v139[1] = 3221225472;
      v139[2] = sub_224F975E0;
      v139[3] = &unk_2647108C0;
      id v102 = v4;
      id v140 = v102;
      v142[1] = v90;
      objc_copyWeak(v142, &location);
      uint64_t v141 = self;
      v142[2] = v64;
      uint64_t v32 = (NSMutableArray *)objc_msgSend_initWithFlags_options_timeout_wifiTimeout_completionBlock_(v101, v103, (uint64_t)v64, 0, (uint64_t)v139, 30.0, v88);

      v104 = sub_224FB12A0();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
        v109 = objc_msgSend_initiatorIMHandle(v102, v105, v106, v107, v108);
        objc_msgSend_ID(v109, v110, v111, v112, v113);
        id v114 = (id)objc_claimAutoreleasedReturnValue();
        v119 = objc_msgSend_conferenceID(v102, v115, v116, v117, v118);
        *(_DWORD *)buf = 138412546;
        uint64_t v146 = (uint64_t)v114;
        __int16 v147 = 2112;
        double v148 = *(double *)&v119;
        _os_log_impl(&dword_224F93000, v104, OS_LOG_TYPE_DEFAULT, "Enqueing VC Invitation from: %@   conference ID: %@", buf, 0x16u);
      }
      objc_msgSend_setContext_(v32, v120, (uint64_t)v102, v121, v122);
      objc_msgSend_addObject_(self->_pendingLookups, v123, (uint64_t)v32, v124, v125);
      objc_msgSend_addObject_(self->_pendingChats, v126, (uint64_t)v102, v127, v128);
      uint64_t v129 = sub_224FB12A0();
      if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v146 = (uint64_t)v102;
        _os_log_impl(&dword_224F93000, v129, OS_LOG_TYPE_DEFAULT, "Adding pendingChat %@", buf, 0xCu);
      }

      objc_msgSend_start(v32, v130, v131, v132, v133);
      objc_destroyWeak(v142);

      objc_destroyWeak(&location);
    }

LABEL_47:
  }
}

- (void)_handleIncomingAVChatForNotification:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_msgSend_initiatorIMHandle(v4, v6, v7, v8, v9);
    uint64_t v15 = objc_msgSend_ID(v10, v11, v12, v13, v14);
    uint64_t v20 = objc_msgSend_conferenceID(v4, v16, v17, v18, v19);
    int v27 = 138412546;
    uint64_t v28 = v15;
    __int16 v29 = 2112;
    uint64_t v30 = v20;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Handling VC Invitation from: %@   conference ID: %@", (uint8_t *)&v27, 0x16u);
  }
  uint64_t v21 = sub_224FB12A0();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v27) = 0;
    _os_log_impl(&dword_224F93000, v21, OS_LOG_TYPE_DEFAULT, "Will try to bring up network if needed", (uint8_t *)&v27, 2u);
  }

  objc_msgSend__enqueueIMAVChatForNetworkActivation_(self, v22, (uint64_t)v4, v23, v24);
  objc_msgSend__notifyOfIncomingInvitationFor_notifyInvitationListeners_(self, v25, (uint64_t)v4, 0, v26);
}

- (void)account:(id)a3 avAction:(unsigned int)a4 withArguments:(id)a5 toAVChat:(id)a6 isVideo:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v267 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = sub_224FB12A0();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)&v264[8] = 1024;
    uint64_t v15 = @"NO";
    *(_DWORD *)buf = 138413314;
    *(void *)v264 = v11;
    if (v7) {
      uint64_t v15 = @"YES";
    }
    *(_DWORD *)&v264[10] = a4;
    *(_WORD *)&v264[14] = 2112;
    *(void *)&v264[16] = v12;
    *(_WORD *)&v264[24] = 2112;
    *(void *)&v264[26] = v13;
    __int16 v265 = 2112;
    uint64_t v266 = v15;
    _os_log_impl(&dword_224F93000, v14, OS_LOG_TYPE_DEFAULT, "account %@   avAction %d   withArguments %@   toAVChat %@   isVideo %@", buf, 0x30u);
  }

  if (!a4)
  {
    uint64_t v28 = sub_224FB12A0();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v28, OS_LOG_TYPE_DEFAULT, "Told to create an outgoing chat", buf, 2u);
    }

    uint64_t v22 = objc_msgSend_objectForKey_(v12, v29, @"Initiator", v30, v31);
    uint64_t v35 = objc_msgSend__imHandleFromProxyRepresentation_(IMAVChat, v32, (uint64_t)v22, v33, v34);
    uint64_t v254 = objc_msgSend_objectForKey_(v12, v36, @"Other", v37, v38);
    uint64_t v255 = objc_msgSend__imHandleFromProxyRepresentation_(IMAVChat, v39, v254, v40, v41);
    uint64_t v45 = objc_msgSend_objectForKey_(v12, v42, @"IsRelayed", v43, v44);
    uint64_t v50 = objc_msgSend_BOOLValue(v45, v46, v47, v48, v49);

    uint64_t v54 = objc_msgSend_objectForKey_(v12, v51, @"GUID", v52, v53);
    uint64_t v55 = (void *)v54;
    if (!v35 || !v255 || !v54)
    {
      isRelayed_GUID = sub_224FB12A0();
      if (os_log_type_enabled(isRelayed_GUID, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)v264 = v35;
        *(_WORD *)&v264[8] = 2112;
        *(void *)&v264[10] = v255;
        *(_WORD *)&v264[18] = 2112;
        *(void *)&v264[20] = v55;
        _os_log_impl(&dword_224F93000, isRelayed_GUID, OS_LOG_TYPE_DEFAULT, "Missing arguments to create outgoing chat, initiatorIMHandle %@ otherIMHandle %@ guid %@", buf, 0x20u);
      }
      BOOL v82 = (void *)v254;
      goto LABEL_43;
    }
    uint64_t v250 = v35;
    v251 = v22;
    id v252 = v11;
    uint64_t v56 = v54;
    uint64_t v57 = [IMAVChat alloc];
    uint64_t v61 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF8C0], v58, (uint64_t)v255, v59, v60);
    uint64_t v249 = (void *)v56;
    isRelayed_GUID = objc_msgSend__initOutgoingTo_isVideo_isRelayed_GUID_(v57, v62, (uint64_t)v61, v7, v50, v56);

    uint64_t v68 = objc_msgSend_sharedInstance(IMAVController, v64, v65, v66, v67);
    if (objc_msgSend__shouldRunConferences(v68, v69, v70, v71, v72))
    {
    }
    else
    {
      uint64_t v83 = objc_msgSend_sharedInstance(IMAVController, v73, v74, v75, v76);
      int shouldRunACConferences = objc_msgSend__shouldRunACConferences(v83, v84, v85, v86, v87);

      if (!shouldRunACConferences)
      {
LABEL_42:
        BOOL v82 = (void *)v254;
        uint64_t v35 = v250;
        uint64_t v22 = v251;
        uint64_t v55 = v249;
LABEL_43:

        goto LABEL_44;
      }
    }
    long long v260 = 0u;
    long long v261 = 0u;
    long long v258 = 0u;
    long long v259 = 0u;
    uint64_t v89 = objc_msgSend_sharedInstance(IMAVController, v77, v78, v79, v80, v12);
    uint64_t v94 = objc_msgSend_delegates(v89, v90, v91, v92, v93);

    uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v95, (uint64_t)&v258, (uint64_t)v262, 16);
    if (v96)
    {
      uint64_t v97 = v96;
      uint64_t v98 = *(void *)v259;
      do
      {
        for (uint64_t i = 0; i != v97; ++i)
        {
          if (*(void *)v259 != v98) {
            objc_enumerationMutation(v94);
          }
          id v100 = *(void **)(*((void *)&v258 + 1) + 8 * i);
          id v101 = sub_224FB12A0();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v264 = v100;
            _os_log_impl(&dword_224F93000, v101, OS_LOG_TYPE_DEFAULT, "Checking delegate: %@", buf, 0xCu);
          }

          char v102 = objc_opt_respondsToSelector();
          v103 = sub_224FB12A0();
          BOOL v104 = os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT);
          if (v102)
          {
            if (v104)
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v264 = v100;
              _os_log_impl(&dword_224F93000, v103, OS_LOG_TYPE_DEFAULT, " => Dispatching to delegate: %@", buf, 0xCu);
            }

            objc_msgSend_createdOutgoingIMAVChat_(v100, v105, (uint64_t)isRelayed_GUID, v106, v107);
          }
          else
          {
            if (v104)
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v264 = v100;
              _os_log_impl(&dword_224F93000, v103, OS_LOG_TYPE_DEFAULT, " => **NOT** Dispatching to delegate: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v108, (uint64_t)&v258, (uint64_t)v262, 16);
      }
      while (v97);
    }

    id v11 = v252;
    id v12 = v248;
    goto LABEL_42;
  }
  uint64_t v22 = objc_msgSend__avChatWithGUID_(IMAVChat, v16, (uint64_t)v13, v17, v18);
  if (v22)
  {
    switch(a4)
    {
      case 1u:
        uint64_t v23 = sub_224FB12A0();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v264 = v22;
          _os_log_impl(&dword_224F93000, v23, OS_LOG_TYPE_DEFAULT, "Told to accept chat %@", buf, 0xCu);
        }

        objc_msgSend_acceptInvitation(v22, v24, v25, v26, v27);
        break;
      case 2u:
        v109 = sub_224FB12A0();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v264 = v22;
          _os_log_impl(&dword_224F93000, v109, OS_LOG_TYPE_DEFAULT, "Told to decline chat %@", buf, 0xCu);
        }

        objc_msgSend_declineInvitation(v22, v110, v111, v112, v113);
        break;
      case 3u:
        id v114 = sub_224FB12A0();
        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v264 = v22;
          _os_log_impl(&dword_224F93000, v114, OS_LOG_TYPE_DEFAULT, "Told to cancel chat %@", buf, 0xCu);
        }

        objc_msgSend_cancelInvitation(v22, v115, v116, v117, v118);
        break;
      case 4u:
        v81 = objc_msgSend_objectForKey_(v12, v19, @"EndedReason", v20, v21);
        uint64_t v123 = objc_msgSend_intValue(v81, v119, v120, v121, v122);
        uint64_t v124 = sub_224FB12A0();
        BOOL v125 = os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT);
        if (v123)
        {
          if (v125)
          {
            _NSStringDescriptionForIMAVChatEndedReason(v123, v126, v127, v128, v129);
            v131 = uint64_t v130 = v22;
            *(_DWORD *)buf = 138412546;
            *(void *)v264 = v130;
            *(_WORD *)&v264[8] = 2112;
            *(void *)&v264[10] = v131;
            _os_log_impl(&dword_224F93000, v124, OS_LOG_TYPE_DEFAULT, "Told to end chat %@ with reason %@", buf, 0x16u);

            uint64_t v22 = v130;
          }

          objc_msgSend_endChatWithReason_(v22, v132, v123, v133, v134);
        }
        else
        {
          if (v125)
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v264 = v22;
            _os_log_impl(&dword_224F93000, v124, OS_LOG_TYPE_DEFAULT, "Told to end chat %@", buf, 0xCu);
          }

          objc_msgSend_endChat(v22, v244, v245, v246, v247);
        }
        goto LABEL_20;
      case 5u:
        long long v135 = sub_224FB12A0();
        if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v264 = v22;
          _os_log_impl(&dword_224F93000, v135, OS_LOG_TYPE_DEFAULT, "Told to inviteAll on chat %@", buf, 0xCu);
        }

        objc_msgSend_inviteAll(v22, v136, v137, v138, v139);
        break;
      case 6u:
        id v140 = sub_224FB12A0();
        if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v264 = v22;
          _os_log_impl(&dword_224F93000, v140, OS_LOG_TYPE_DEFAULT, "Told to inviteAdditionalPeers on chat %@", buf, 0xCu);
        }

        v81 = objc_msgSend_objectForKey_(v12, v141, @"Buddy", v142, v143);
        __int16 v147 = objc_msgSend__imHandleFromProxyRepresentation_(IMAVChat, v144, (uint64_t)v81, v145, v146);
        v151 = objc_msgSend_objectForKey_(v12, v148, @"AdditionalPeers", v149, v150);
        objc_msgSend_objectForKey_(v12, v152, @"ExcludingPushTokens", v153, v154);
        v156 = v155 = v22;
        objc_msgSend_invite_additionalPeers_excludingPushTokens_(v155, v157, (uint64_t)v147, (uint64_t)v151, (uint64_t)v156);

        uint64_t v22 = v155;
        goto LABEL_20;
      case 7u:
        v81 = objc_msgSend_objectForKey_(v12, v19, @"InvitationTimeoutTime", v20, v21);
        objc_msgSend_doubleValue(v81, v158, v159, v160, v161);
        double v163 = v162;
        uint64_t v164 = sub_224FB12A0();
        if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(double *)v264 = v163;
          *(_WORD *)&v264[8] = 2112;
          *(void *)&v264[10] = v22;
          _os_log_impl(&dword_224F93000, v164, OS_LOG_TYPE_DEFAULT, "Told to setInvitationTimeoutTime to %f on chat %@", buf, 0x16u);
        }

        objc_msgSend_setInvitationTimeoutTime_(v22, v165, v166, v167, v168, v163);
        goto LABEL_20;
      case 8u:
        v81 = objc_msgSend_objectForKey_(v12, v19, @"ConnectionTimeoutTime", v20, v21);
        objc_msgSend_doubleValue(v81, v169, v170, v171, v172);
        double v174 = v173;
        uint64_t v175 = sub_224FB12A0();
        if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(double *)v264 = v174;
          *(_WORD *)&v264[8] = 2112;
          *(void *)&v264[10] = v22;
          _os_log_impl(&dword_224F93000, v175, OS_LOG_TYPE_DEFAULT, "Told to setConnectionTimeoutTime to %f on chat %@", buf, 0x16u);
        }

        objc_msgSend_setConnectionTimeoutTime_(v22, v176, v177, v178, v179, v174);
        goto LABEL_20;
      case 9u:
        v81 = objc_msgSend_objectForKey_(v12, v19, @"IsMute", v20, v21);
        uint64_t v184 = objc_msgSend_BOOLValue(v81, v180, v181, v182, v183);
        uint64_t v185 = sub_224FB12A0();
        if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v264 = v184;
          *(_WORD *)&v264[4] = 2112;
          *(void *)&v264[6] = v22;
          _os_log_impl(&dword_224F93000, v185, OS_LOG_TYPE_DEFAULT, "Told to setMute to %d on chat %@", buf, 0x12u);
        }

        objc_msgSend_setMute_(v22, v186, v184, v187, v188);
        goto LABEL_20;
      case 0xAu:
        v81 = objc_msgSend_objectForKey_(v12, v19, @"IsRelayed", v20, v21);
        uint64_t v193 = objc_msgSend_BOOLValue(v81, v189, v190, v191, v192);
        v194 = sub_224FB12A0();
        if (os_log_type_enabled(v194, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v264 = v193;
          *(_WORD *)&v264[4] = 2112;
          *(void *)&v264[6] = v22;
          _os_log_impl(&dword_224F93000, v194, OS_LOG_TYPE_DEFAULT, "Told to setRelayed to %d on chat %@", buf, 0x12u);
        }

        objc_msgSend_setRelayed_(v22, v195, v193, v196, v197);
        goto LABEL_20;
      case 0xBu:
        v81 = objc_msgSend_objectForKey_(v12, v19, @"IsSendingAudio", v20, v21);
        uint64_t v202 = objc_msgSend_BOOLValue(v81, v198, v199, v200, v201);
        v203 = sub_224FB12A0();
        if (os_log_type_enabled(v203, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v264 = v202;
          *(_WORD *)&v264[4] = 2112;
          *(void *)&v264[6] = v22;
          _os_log_impl(&dword_224F93000, v203, OS_LOG_TYPE_DEFAULT, "Told to setIsSendingAudio to %d on chat %@", buf, 0x12u);
        }

        objc_msgSend_setIsSendingAudio_(v22, v204, v202, v205, v206);
        goto LABEL_20;
      case 0xCu:
        id v253 = v13;
        uint64_t v207 = objc_msgSend_objectForKey_(v12, v19, @"AspectRatio", v20, v21);
        double v256 = 0.0;
        double v257 = 0.0;
        objc_msgSend_getValue_(v207, v208, (uint64_t)&v256, v209, v210);
        double v211 = v256;
        double v212 = v257;
        v216 = objc_msgSend_objectForKey_(v12, v213, @"Orientation", v214, v215);
        uint64_t v221 = objc_msgSend_unsignedIntValue(v216, v217, v218, v219, v220);
        uint64_t v225 = objc_msgSend_objectForKey_(v12, v222, @"CameraType", v223, v224);
        uint64_t v230 = objc_msgSend_unsignedIntValue(v225, v226, v227, v228, v229);
        uint64_t v231 = sub_224FB12A0();
        if (os_log_type_enabled(v231, OS_LOG_TYPE_DEFAULT))
        {
          v268.width = v211;
          v268.height = v212;
          v232 = NSStringFromSize(v268);
          *(_DWORD *)buf = 138413058;
          *(void *)v264 = v232;
          *(_WORD *)&v264[8] = 1024;
          *(_DWORD *)&v264[10] = v221;
          *(_WORD *)&v264[14] = 1024;
          *(_DWORD *)&v264[16] = v230;
          *(_WORD *)&v264[20] = 2112;
          *(void *)&v264[22] = v22;
          _os_log_impl(&dword_224F93000, v231, OS_LOG_TYPE_DEFAULT, "Told to setLocalAspectRatio %@ for orientation %d cameraType %d on chat %@", buf, 0x22u);
        }
        objc_msgSend_setLocalAspectRatio_cameraOrientation_cameraType_(v22, v233, v221, v230, v234, v211, v212);

        id v13 = v253;
        break;
      case 0xDu:
        v81 = objc_msgSend_objectForKey_(v12, v19, @"IsSendingVideo", v20, v21);
        uint64_t v239 = objc_msgSend_BOOLValue(v81, v235, v236, v237, v238);
        v240 = sub_224FB12A0();
        if (os_log_type_enabled(v240, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v264 = v239;
          *(_WORD *)&v264[4] = 2112;
          *(void *)&v264[6] = v22;
          _os_log_impl(&dword_224F93000, v240, OS_LOG_TYPE_DEFAULT, "Told to setIsSendingVideo to %d on chat %@", buf, 0x12u);
        }

        objc_msgSend_setIsSendingVideo_(v22, v241, v239, v242, v243);
        goto LABEL_20;
      default:
        break;
    }
  }
  else
  {
    v81 = sub_224FB12A0();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v81, OS_LOG_TYPE_DEFAULT, "We don't have this chat, ignoring...", buf, 2u);
    }
LABEL_20:
  }
LABEL_44:
}

- (void)pendingVCRequestComplete
{
  objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2, v3, v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_(v7, v5, @"__kIMAVControllerPendingAVInvitationRequestComplete", 0, v6);
}

- (void)pendingACRequestComplete
{
  objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2, v3, v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_(v7, v5, @"__kIMAVControllerPendingACInvitationRequestComplete", 0, v6);
}

- (void)setupComplete
{
  id v5 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_listener(v5, v6, v7, v8, v9);
  objc_msgSend_properties(v10, v11, v12, v13, v14);
  id v102 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v19 = objc_msgSend_sharedInstance(IMAVController, v15, v16, v17, v18);
  if ((objc_msgSend__shouldRunACConferences(v19, v20, v21, v22, v23) & 1) == 0)
  {
    uint64_t v28 = objc_msgSend_sharedInstance(IMAVController, v24, v25, v26, v27);
    int shouldObserveConferences = objc_msgSend__shouldObserveConferences(v28, v29, v30, v31, v32);

    if (!shouldObserveConferences) {
      goto LABEL_5;
    }
    uint64_t v19 = objc_msgSend_objectForKey_(v102, v34, @"ACChatProxy", v36, v37);
    uint64_t v42 = objc_msgSend_sharedInstance(IMAVCallManager, v38, v39, v40, v41);
    objc_msgSend__updateACChatProxyWithInfo_(v42, v43, (uint64_t)v19, v44, v45);
  }
LABEL_5:
  uint64_t v46 = objc_msgSend_sharedInstance(IMAVController, v34, v35, v36, v37);
  if ((objc_msgSend__shouldRunConferences(v46, v47, v48, v49, v50) & 1) == 0)
  {
    uint64_t v55 = objc_msgSend_sharedInstance(IMAVController, v51, v52, v53, v54);
    int v60 = objc_msgSend__shouldObserveConferences(v55, v56, v57, v58, v59);

    if (!v60) {
      goto LABEL_9;
    }
    uint64_t v46 = objc_msgSend_objectForKey_(v102, v61, @"AVChatProxy", v63, v64);
    uint64_t v69 = objc_msgSend_sharedInstance(IMAVCallManager, v65, v66, v67, v68);
    objc_msgSend__updateAVChatProxyWithInfo_(v69, v70, (uint64_t)v46, v71, v72);
  }
LABEL_9:
  uint64_t v73 = objc_msgSend_sharedInstance(IMAVController, v61, v62, v63, v64);
  if (objc_msgSend__shouldRunConferences(v73, v74, v75, v76, v77))
  {
  }
  else
  {
    uint64_t v86 = objc_msgSend_sharedInstance(IMAVController, v78, v79, v80, v81);
    int shouldRunACConferences = objc_msgSend__shouldRunACConferences(v86, v87, v88, v89, v90);

    if (!shouldRunACConferences) {
      goto LABEL_13;
    }
  }
  uint64_t v92 = objc_msgSend_sharedInstance(IMAVController, v82, v83, v84, v85);
  objc_msgSend_pushCachedVCCapsToDaemon(v92, v93, v94, v95, v96);

LABEL_13:
  uint64_t v97 = objc_msgSend_sharedInstance(IMAVCallManager, v82, v83, v84, v85);
  objc_msgSend__updateOverallChatState(v97, v98, v99, v100, v101);
}

- (void)account:(id)a3 conference:(id)a4 peerID:(id)a5 propertiesUpdated:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a6;
  uint64_t v10 = objc_msgSend__avChatWaitingForReplyFromIMHandle_orConferenceID_(IMAVChat, v8, 0, (uint64_t)a4, v9);
  id v11 = sub_224FB12A0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412546;
    uint64_t v26 = v10;
    __int16 v27 = 2112;
    id v28 = v7;
    _os_log_impl(&dword_224F93000, v11, OS_LOG_TYPE_DEFAULT, "Chat: %@ properties updated to: %@", (uint8_t *)&v25, 0x16u);
  }

  uint64_t v16 = objc_msgSend_remoteParticipants(v10, v12, v13, v14, v15);
  uint64_t v21 = objc_msgSend_lastObject(v16, v17, v18, v19, v20);
  objc_msgSend__updateProperties_(v21, v22, (uint64_t)v7, v23, v24);
}

- (void)property:(id)a3 changedTo:(id)a4 from:(id)a5
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_isEqualToString_(v6, v8, @"AVChatProxy", v9, v10))
  {
    uint64_t v15 = objc_msgSend_sharedInstance(IMAVController, v11, v12, v13, v14);
    if (objc_msgSend__shouldRunConferences(v15, v16, v17, v18, v19))
    {
    }
    else
    {
      uint64_t v24 = objc_msgSend_sharedInstance(IMAVController, v20, v21, v22, v23);
      int shouldObserveConferences = objc_msgSend__shouldObserveConferences(v24, v25, v26, v27, v28);

      if (shouldObserveConferences)
      {
        uint64_t v30 = sub_224FB12A0();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          int v65 = 138412290;
          id v66 = v6;
          _os_log_impl(&dword_224F93000, v30, OS_LOG_TYPE_DEFAULT, "Received %@ property change", (uint8_t *)&v65, 0xCu);
        }

        uint64_t v35 = objc_msgSend_sharedInstance(IMAVCallManager, v31, v32, v33, v34);
        objc_msgSend__updateAVChatProxyWithInfo_(v35, v36, (uint64_t)v7, v37, v38);
        goto LABEL_14;
      }
    }
  }
  if (objc_msgSend_isEqualToString_(v6, v11, @"ACChatProxy", v13, v14))
  {
    uint64_t v35 = objc_msgSend_sharedInstance(IMAVController, v39, v40, v41, v42);
    if (objc_msgSend__shouldRunACConferences(v35, v43, v44, v45, v46))
    {
LABEL_14:

      goto LABEL_15;
    }
    uint64_t v51 = objc_msgSend_sharedInstance(IMAVController, v47, v48, v49, v50);
    int v56 = objc_msgSend__shouldObserveConferences(v51, v52, v53, v54, v55);

    if (v56)
    {
      uint64_t v57 = sub_224FB12A0();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        int v65 = 138412290;
        id v66 = v6;
        _os_log_impl(&dword_224F93000, v57, OS_LOG_TYPE_DEFAULT, "Received %@ property change", (uint8_t *)&v65, 0xCu);
      }

      uint64_t v35 = objc_msgSend_sharedInstance(IMAVCallManager, v58, v59, v60, v61);
      objc_msgSend__updateACChatProxyWithInfo_(v35, v62, (uint64_t)v7, v63, v64);
      goto LABEL_14;
    }
  }
LABEL_15:
}

- (void)persistentProperty:(id)a3 changedTo:(id)a4 from:(id)a5
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = sub_224FB12A0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_224F93000, v6, OS_LOG_TYPE_DEFAULT, "Persistent property %@ changed", (uint8_t *)&v7, 0xCu);
  }
}

- (void)account:(id)a3 postedError:(id)a4
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v11 = objc_msgSend_domain(v6, v7, v8, v9, v10);
  int isEqualToString = objc_msgSend_isEqualToString_(v11, v12, *MEMORY[0x263F4A298], v13, v14);

  if (isEqualToString)
  {
    uint64_t v16 = sub_224FB12A0();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v90 = (uint64_t)v5;
      __int16 v91 = 2112;
      id v92 = v6;
      _os_log_impl(&dword_224F93000, v16, OS_LOG_TYPE_DEFAULT, "Account: %@   Posted AV Error: %@", buf, 0x16u);
    }

    uint64_t v21 = objc_msgSend_sharedInstance(MEMORY[0x263F4A520], v17, v18, v19, v20);
    int v25 = objc_msgSend_accountForUniqueID_(v21, v22, (uint64_t)v5, v23, v24);

    uint64_t v26 = sub_224FB12A0();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v27)
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v90 = (uint64_t)v25;
        __int16 v91 = 2112;
        id v92 = v6;
        _os_log_impl(&dword_224F93000, v26, OS_LOG_TYPE_DEFAULT, "Account: %@    Posted AV Error: %@", buf, 0x16u);
      }

      uint64_t v32 = objc_msgSend_userInfo(v6, v28, v29, v30, v31);
      uint64_t v36 = objc_msgSend_objectForKey_(v32, v33, @"ID", v34, v35);
      uint64_t v88 = objc_msgSend_objectForKey_(v32, v37, @"conference", v38, v39);
      uint64_t v86 = objc_msgSend_objectForKey_(v32, v40, @"properties", v41, v42);
      uint64_t v87 = objc_msgSend_objectForKey_(v86, v43, *MEMORY[0x263F4A740], v44, v45);
      uint64_t v49 = objc_msgSend_objectForKey_(v32, v46, @"internalErrorDomain", v47, v48);
      uint64_t v53 = objc_msgSend_objectForKey_(v32, v50, @"internalUserInfo", v51, v52);
      uint64_t v57 = objc_msgSend_objectForKey_(v32, v54, @"internalCode", v55, v56);
      uint64_t v58 = sub_224FB12A0();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v90 = (uint64_t)v32;
        _os_log_impl(&dword_224F93000, v58, OS_LOG_TYPE_DEFAULT, "            UserInfo: %@", buf, 0xCu);
      }

      uint64_t v59 = sub_224FB12A0();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v90 = (uint64_t)v88;
        _os_log_impl(&dword_224F93000, v59, OS_LOG_TYPE_DEFAULT, "        conferenceID: %@", buf, 0xCu);
      }

      uint64_t v60 = sub_224FB12A0();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        int v65 = objc_msgSend_unsignedIntValue(v87, v61, v62, v63, v64);
        *(_DWORD *)buf = 67109120;
        LODWORD(v90) = v65;
        _os_log_impl(&dword_224F93000, v60, OS_LOG_TYPE_DEFAULT, "           SessionID: %u", buf, 8u);
      }

      id v66 = sub_224FB12A0();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v90 = v49;
        _os_log_impl(&dword_224F93000, v66, OS_LOG_TYPE_DEFAULT, "      internalDomain: %@", buf, 0xCu);
      }

      uint64_t v67 = sub_224FB12A0();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v90 = (uint64_t)v57;
        _os_log_impl(&dword_224F93000, v67, OS_LOG_TYPE_DEFAULT, "        internalCode: %@", buf, 0xCu);
      }
      uint64_t v85 = (void *)v49;

      uint64_t v68 = sub_224FB12A0();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v90 = v53;
        _os_log_impl(&dword_224F93000, v68, OS_LOG_TYPE_DEFAULT, "    internalUserInfo: %@", buf, 0xCu);
      }
      uint64_t v69 = (void *)v53;

      uint64_t v70 = (void *)v36;
      uint64_t v74 = objc_msgSend_imHandleWithID_(v25, v71, v36, v72, v73);
      uint64_t v79 = objc_msgSend_unsignedIntValue(v87, v75, v76, v77, v78);
      uint64_t v26 = objc_msgSend__bestGuessAVChatWithIMHandle_conferenceID_sessionID_properties_(IMAVChat, v80, (uint64_t)v74, (uint64_t)v88, v79, 0);

      uint64_t v81 = sub_224FB12A0();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v90 = (uint64_t)v26;
        _os_log_impl(&dword_224F93000, v81, OS_LOG_TYPE_DEFAULT, "  Using found AVChat: %@", buf, 0xCu);
      }

      objc_msgSend__handleAVError_(v26, v82, (uint64_t)v6, v83, v84);
    }
    else if (v27)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v90 = (uint64_t)v6;
      _os_log_impl(&dword_224F93000, v26, OS_LOG_TYPE_DEFAULT, "[WARN] Posted AVError: %@ from nil account", buf, 0xCu);
    }
  }
}

- (void)account:(id)a3 relay:(id)a4 handleInitate:(id)a5 fromPerson:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v17 = objc_msgSend_sharedInstance(MEMORY[0x263F4A520], v13, v14, v15, v16);
  uint64_t v21 = objc_msgSend_accountForUniqueID_(v17, v18, (uint64_t)v9, v19, v20);

  if (v21)
  {
    int v25 = objc_msgSend_imHandleWithInfo_(v21, v22, (uint64_t)v12, v23, v24);
    BOOL v27 = objc_msgSend__bestGuessAVChatWithIMHandle_conferenceID_sessionID_properties_(IMAVChat, v26, (uint64_t)v25, (uint64_t)v10, 0, 0);
    uint64_t v31 = objc_msgSend_participantMatchingIMHandle_(v27, v28, (uint64_t)v25, v29, v30);
    uint64_t v32 = sub_224FB12A0();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v35 = 138412802;
      id v36 = v12;
      __int16 v37 = 2112;
      id v38 = v10;
      __int16 v39 = 2112;
      id v40 = v11;
      _os_log_impl(&dword_224F93000, v32, OS_LOG_TYPE_DEFAULT, "Handling incoming relay initiate from person: %@    conference: %@   request: %@", (uint8_t *)&v35, 0x20u);
    }

    objc_msgSend__handleRelayInitate_fromParticipant_(v27, v33, (uint64_t)v11, (uint64_t)v31, v34);
  }
  else
  {
    int v25 = sub_224FB12A0();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v35 = 138412290;
      id v36 = v9;
      _os_log_impl(&dword_224F93000, v25, OS_LOG_TYPE_DEFAULT, "[WARN] Posted relay initiate: %@ from nil account", (uint8_t *)&v35, 0xCu);
    }
  }
}

- (void)account:(id)a3 relay:(id)a4 handleUpdate:(id)a5 fromPerson:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v17 = objc_msgSend_sharedInstance(MEMORY[0x263F4A520], v13, v14, v15, v16);
  uint64_t v21 = objc_msgSend_accountForUniqueID_(v17, v18, (uint64_t)v9, v19, v20);

  uint64_t v22 = sub_224FB12A0();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v23)
    {
      int v35 = 138412802;
      id v36 = v12;
      __int16 v37 = 2112;
      id v38 = v10;
      __int16 v39 = 2112;
      id v40 = v11;
      _os_log_impl(&dword_224F93000, v22, OS_LOG_TYPE_DEFAULT, "Handling incoming relay update from person: %@    conference: %@   request: %@", (uint8_t *)&v35, 0x20u);
    }

    uint64_t v22 = objc_msgSend_imHandleWithInfo_(v21, v24, (uint64_t)v12, v25, v26);
    uint64_t v28 = objc_msgSend__bestGuessAVChatWithIMHandle_conferenceID_sessionID_properties_(IMAVChat, v27, (uint64_t)v22, (uint64_t)v10, 0, 0);
    uint64_t v32 = objc_msgSend_participantMatchingIMHandle_(v28, v29, (uint64_t)v22, v30, v31);
    objc_msgSend__handleRelayUpdate_fromParticipant_(v28, v33, (uint64_t)v11, (uint64_t)v32, v34);
  }
  else if (v23)
  {
    int v35 = 138412290;
    id v36 = v9;
    _os_log_impl(&dword_224F93000, v22, OS_LOG_TYPE_DEFAULT, "[WARN] Posted relay update: %@ from nil account", (uint8_t *)&v35, 0xCu);
  }
}

- (void)account:(id)a3 relay:(id)a4 handleCancel:(id)a5 fromPerson:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v17 = objc_msgSend_sharedInstance(MEMORY[0x263F4A520], v13, v14, v15, v16);
  uint64_t v21 = objc_msgSend_accountForUniqueID_(v17, v18, (uint64_t)v9, v19, v20);

  uint64_t v22 = sub_224FB12A0();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v23)
    {
      int v35 = 138412802;
      id v36 = v12;
      __int16 v37 = 2112;
      id v38 = v10;
      __int16 v39 = 2112;
      id v40 = v11;
      _os_log_impl(&dword_224F93000, v22, OS_LOG_TYPE_DEFAULT, "Handling incoming relay cancel from person: %@    conference: %@   request: %@", (uint8_t *)&v35, 0x20u);
    }

    uint64_t v22 = objc_msgSend_imHandleWithInfo_(v21, v24, (uint64_t)v12, v25, v26);
    uint64_t v28 = objc_msgSend__bestGuessAVChatWithIMHandle_conferenceID_sessionID_properties_(IMAVChat, v27, (uint64_t)v22, (uint64_t)v10, 0, 0);
    uint64_t v32 = objc_msgSend_participantMatchingIMHandle_(v28, v29, (uint64_t)v22, v30, v31);
    objc_msgSend__handleRelayCancel_fromParticipant_(v28, v33, (uint64_t)v11, (uint64_t)v32, v34);
  }
  else if (v23)
  {
    int v35 = 138412290;
    id v36 = v9;
    _os_log_impl(&dword_224F93000, v22, OS_LOG_TYPE_DEFAULT, "[WARN] Posted relay cancel: %@ from nil account", (uint8_t *)&v35, 0xCu);
  }
}

- (void)account:(id)a3 conference:(id)a4 invitationSentSuccessfully:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v8 = objc_msgSend__bestGuessAVChatWithIMHandle_conferenceID_sessionID_properties_(IMAVChat, v7, 0, (uint64_t)v6, 0, 0);
  uint64_t v13 = objc_msgSend_remoteParticipants(v8, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_lastObject(v13, v14, v15, v16, v17);

  uint64_t v19 = sub_224FB12A0();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = @"NO";
    if (v5) {
      uint64_t v20 = @"YES";
    }
    int v24 = 138412546;
    uint64_t v25 = v20;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_224F93000, v19, OS_LOG_TYPE_DEFAULT, "Handling invitation sent successfully: %@    conference: %@", (uint8_t *)&v24, 0x16u);
  }

  objc_msgSend__noteInviteDelivered_(v18, v21, v5, v22, v23);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingLookups, 0);
  objc_storeStrong((id *)&self->_pendingChats, 0);
}

@end