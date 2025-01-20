@interface IMAbstractDatabaseTrimmer
- (BOOL)copyDatabase:(id)a3;
- (BOOL)trimDatabaseWithOperation:(IMDSqlOperation *)a3;
@end

@implementation IMAbstractDatabaseTrimmer

- (BOOL)trimDatabaseWithOperation:(IMDSqlOperation *)a3
{
  -[IMAbstractDatabaseTrimmer performMessageSelectionWithOperation:](self, "performMessageSelectionWithOperation:");
  var5 = a3->var5;
  if (!var5)
  {
    _IMDSqlOperationBeginQuery((uint64_t)a3, (CFStringRef)objc_msgSend(NSString, "stringWithFormat:", @"INSERT INTO chat SELECT %@ from source.chat WHERE ROWID IN (SELECT chat_id from source.chat_message_join where message_id IN (SELECT ROWID from message));",
                     +[IMDChatQueryStrings allColumns]));
    IMDSqlOperationFinishQuery((uint64_t)a3);
    var5 = a3->var5;
    if (!var5)
    {
      _IMDSqlOperationBeginQuery((uint64_t)a3, (CFStringRef)objc_msgSend(NSString, "stringWithFormat:", @"INSERT OR IGNORE INTO message SELECT %@ from source.message WHERE ROWID IN (SELECT MAX(m.ROWID) FROM source.message m, chat c, source.chat_message_join cm WHERE m.ROWID=cm.message_id AND c.ROWID=cm.chat_id AND m.group_action_type IN (1,3) GROUP BY c.ROWID);",
                       @"ROWID, guid, text, replace, service_center, handle_id, subject, country, attributedBody, version, type, service, account, account_guid, error, date, date_read, date_delivered, is_delivered, is_finished, is_emote, is_from_me, is_empty, is_delayed, is_auto_reply, is_prepared, is_read, is_system_message, is_sent, has_dd_results, is_service_message, is_forward, was_downgraded, is_archive, cache_has_attachments, cache_roomnames, was_data_detected, was_deduplicated, is_audio_message, is_played, date_played, item_type, other_handle, group_title, group_action_type, share_status,  share_direction, is_expirable, expire_state, message_action_type, message_source, associated_message_guid, associated_message_type, balloon_bundle_id, payload_data, expressive_send_style_id,  associated_message_range_location, associated_message_range_length, time_expressive_send_played, message_summary_info, ck_sync_state, ck_record_id, ck_record_change_tag, destination_caller_id, is_corrupt, reply_to_guid, sort_id, is_spam, has_unseen_mention, thread_originator_guid, thread_originator_part, syndication_ranges, synced_syndication_ranges, was_delivered_quietly, did_notify_recipient, date_retracted, date_edited, was_detonated, part_count, is_stewie, is_sos, is_critical, bia_reference_id, is_kt_verified, fallback_hash, associated_message_emoji, is_pending_satellite_send, needs_relay, schedule_type, schedule_state, sent_or_received_off_grid"));
      IMDSqlOperationFinishQuery((uint64_t)a3);
      var5 = a3->var5;
      if (!var5)
      {
        _IMDSqlOperationBeginQuery((uint64_t)a3, @"INSERT INTO chat_message_join SELECT * from source.chat_message_join WHERE message_id IN (SELECT ROWID from message);");
        IMDSqlOperationFinishQuery((uint64_t)a3);
        var5 = a3->var5;
        if (!var5)
        {
          _IMDSqlOperationBeginQuery((uint64_t)a3, @"INSERT INTO handle SELECT * from source.handle WHERE ROWID IN (SELECT handle_id from source.chat_handle_join where chat_id IN (select ROWID from chat));");
          IMDSqlOperationFinishQuery((uint64_t)a3);
          var5 = a3->var5;
          if (!var5)
          {
            _IMDSqlOperationBeginQuery((uint64_t)a3, @"INSERT INTO chat_handle_join SELECT * from source.chat_handle_join WHERE chat_id IN (SELECT ROWID from chat);");
            IMDSqlOperationFinishQuery((uint64_t)a3);
            var5 = a3->var5;
            if (!var5)
            {
              _IMDSqlOperationBeginQuery((uint64_t)a3, @"INSERT OR IGNORE INTO handle SELECT * from source.handle WHERE ROWID IN (SELECT handle_id from message);");
              IMDSqlOperationFinishQuery((uint64_t)a3);
              var5 = a3->var5;
              if (!var5)
              {
                _IMDSqlOperationBeginQuery((uint64_t)a3, @"INSERT OR IGNORE INTO handle SELECT * from source.handle WHERE ROWID IN (SELECT other_handle from message);");
                IMDSqlOperationFinishQuery((uint64_t)a3);
                var5 = a3->var5;
                if (!var5)
                {
                  _IMDSqlOperationBeginQuery((uint64_t)a3, (CFStringRef)objc_msgSend(NSString, "stringWithFormat:", @"INSERT INTO attachment SELECT %@ from source.attachment WHERE ROWID IN (SELECT attachment_id from source.message_attachment_join where message_id IN (select ROWID from message));",
                                   @"ROWID, guid, created_date, start_date, filename, uti, mime_type, transfer_state, is_outgoing, user_info, transfer_name, total_bytes, is_sticker, sticker_user_info, attribution_info, hide_attachment, ck_sync_state, ck_server_change_token_blob, ck_record_id, original_guid, is_commsafety_sensitive, emoji_image_content_identifier, emoji_image_short_description, preview_generation_state "));
                  IMDSqlOperationFinishQuery((uint64_t)a3);
                  var5 = a3->var5;
                  if (!var5)
                  {
                    _IMDSqlOperationBeginQuery((uint64_t)a3, @"UPDATE attachment SET transfer_state = 0; ");
                    IMDSqlOperationFinishQuery((uint64_t)a3);
                    var5 = a3->var5;
                    if (!var5)
                    {
                      _IMDSqlOperationBeginQuery((uint64_t)a3, @"INSERT INTO message_attachment_join SELECT * from source.message_attachment_join WHERE attachment_id IN (SELECT ROWID from attachment);");
                      IMDSqlOperationFinishQuery((uint64_t)a3);
                      var5 = a3->var5;
                      if (!var5)
                      {
                        _IMDSqlOperationBeginQuery((uint64_t)a3, @"DELETE FROM chat WHERE guid = 'SMS;-;stewie:emergency:112911';");
                        IMDSqlOperationFinishQuery((uint64_t)a3);
                        var5 = a3->var5;
                        if (!var5)
                        {
                          _IMDSqlOperationBeginQuery((uint64_t)a3, @"DELETE FROM chat WHERE guid LIKE 'SMS;-;stewie:roadside:%';");
                          IMDSqlOperationFinishQuery((uint64_t)a3);
                          var5 = a3->var5;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return var5 == 0;
}

- (BOOL)copyDatabase:(id)a3
{
  NSLog(&cfstr_TrimmingDataba.isa, [(IMAbstractDatabaseArchiver *)self sourcePath]);
  long long v9 = 0u;
  memset(v8, 0, sizeof(v8));
  IMDSqlOperationInitAndCreateIfNeededWithPath((uint64_t)[(IMAbstractDatabaseArchiver *)self destinationPath], v8);
  _IMDSqlOperationBeginQuery((uint64_t)v8, (CFStringRef)objc_msgSend(NSString, "stringWithFormat:", @"ATTACH '%@' AS source;",
                   [(IMAbstractDatabaseArchiver *)self sourcePath]));
  IMDSqlOperationFinishQuery((uint64_t)v8);
  if (!*((void *)&v9 + 1))
  {
    IMDSqlOperationBeginTransaction(v8);
    if (!*((void *)&v9 + 1))
    {
      IMDDropAllTriggersWithOperation((uint64_t)v8, 0);
      if (!*((void *)&v9 + 1))
      {
        [(IMAbstractDatabaseTrimmer *)self trimDatabaseWithOperation:v8];
        if (!*((void *)&v9 + 1)) {
          IMDCreateTriggersWithOperation((uint64_t)v8, 0);
        }
      }
    }
  }
  uint64_t v7 = 0;
  BOOL v5 = IMDSqlOperationRelease((uint64_t)v8, &v7);
  if (v7) {
    [(IMAbstractDatabaseArchiver *)self deleteFailedArchiveAtPath:[(IMAbstractDatabaseArchiver *)self destinationPath] error:0];
  }
  if (a3) {
    (*((void (**)(id, BOOL, uint64_t))a3 + 2))(a3, v5, v7);
  }
  return v5;
}

@end